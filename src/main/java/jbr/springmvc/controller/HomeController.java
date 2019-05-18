package jbr.springmvc.controller;

import jbr.springmvc.helper.MD5;
import jbr.springmvc.model.*;
import jbr.springmvc.service.OrderItemService;
import jbr.springmvc.service.OrderService;
import jbr.springmvc.service.UserService;
import jbr.springmvc.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Paths;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;


@Controller

public class HomeController {

  @Autowired
  UserService userService;
  @Autowired
  VideoService videoService;
  @Autowired
  OrderService orderService;
  @Autowired
  OrderItemService orderItemService;

  @RequestMapping(value = "/home", method = RequestMethod.GET)
  public ModelAndView Home(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

    if(firewall(session)==null){
      return new ModelAndView("redirect:/");
    }
    ModelAndView mav = new ModelAndView("home");
    mav.addObject("user", firewall(session));
    mav.addObject("videos",videoService.getApproved());
    mav.addObject("userSvc",userService);
    mav.addObject("cart",getCart(session));
    mav.addObject("route","home");
    return mav;
  }

  @RequestMapping(value = "/upload", method = RequestMethod.GET)
  public ModelAndView Upload(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

    if (firewall(session) == null) {
      return new ModelAndView("redirect:/");
    }
    ModelAndView mav = new ModelAndView("upload");
    mav.addObject("user", firewall(session));
    mav.addObject("userSvc", userService);
    mav.addObject("cart", getCart(session));
    mav.addObject("route", "upload");
    mav.addObject("uploadItem", new Video());
    return mav;
  }

  @RequestMapping(value = "/admin", method = RequestMethod.GET)
  public ModelAndView Admin(HttpServletRequest request, HttpServletResponse response, HttpSession session){
    if(admin_firewall(session)==null){
      return new ModelAndView("redirect:/");
    }
    ModelAndView mav = new ModelAndView("admin");
    mav.addObject("user", firewall(session));
    mav.addObject("route", "admin");
    mav.addObject("videos",videoService.getUnapproved());

    return mav;
  }

  @RequestMapping(value = "/buy", method = RequestMethod.POST, produces = "application/json")
  public ModelAndView Buy(HttpServletRequest request, HttpServletResponse response,HttpSession session,@RequestBody MultiValueMap<String, String> formData) {

    if(firewall(session)==null){
      return new ModelAndView("redirect:/");
    }
    Cart cart = null;
    Integer product_id = formData.get("product_id").get(0)!=null?Integer.parseInt(formData.get("product_id").get(0)):null;
    if(product_id != null){
      if(getCart(session)!=null){
        cart = getCart(session);
        cart.videos.add(videoService.getVideoById(product_id));

      } else {
        cart = new Cart();
        cart.videos.add(videoService.getVideoById(product_id));
        session.setAttribute("cart",cart);
      }
    }
    return new ModelAndView("redirect:/");
  }

  @RequestMapping(value = "/approve", method = RequestMethod.POST, produces = "application/json")
  public ModelAndView Approve(HttpServletRequest request, HttpServletResponse response,HttpSession session,@RequestBody MultiValueMap<String, String> formData) {
    Integer product_id = formData.get("product_id").get(0)!=null?Integer.parseInt(formData.get("product_id").get(0)):null;
    if(admin_firewall(session)==null){ return new ModelAndView("redirect:/"); }
    if(product_id==null){ return new ModelAndView("redirect:/admin"); }
    videoService.approveVideo(product_id);
    return new ModelAndView("redirect:/admin");
  }

  @RequestMapping(value = "/decline", method = RequestMethod.POST, produces = "application/json")
  public ModelAndView Decline(HttpServletRequest request, HttpServletResponse response,HttpSession session,@RequestBody MultiValueMap<String, String> formData) {
    Integer product_id = formData.get("product_id").get(0)!=null?Integer.parseInt(formData.get("product_id").get(0)):null;
    if(admin_firewall(session)==null){ return new ModelAndView("redirect:/"); }
    if(product_id==null){ return new ModelAndView("redirect:/admin"); }
    videoService.declineVideo(product_id);
    return new ModelAndView("redirect:/admin");
  }
  static User firewall(HttpSession session ){
    if(session.getAttribute("user")!=null){
      User usr = (User)session.getAttribute("user");
      return usr;
    }
    return null;
  }

  static User admin_firewall(HttpSession session ){
    if(session.getAttribute("user")!=null){
      User usr = (User)session.getAttribute("user");
      if(usr.getAdmin()){
        return usr;
      }
    }
    return null;
  }

  static Cart getCart(HttpSession session){
    return (Cart)session.getAttribute("cart");
  }


  @RequestMapping(value = "/upload", method = RequestMethod.POST, headers = "content-type=multipart/form-data", consumes = "multipart/form-data")
  @ResponseBody
  public ModelAndView UploadPost(HttpServletRequest request, HttpSession session, @RequestParam CommonsMultipartFile file) throws IOException, ServletException {
    User user = firewall(session);
    if (user == null) {
      return new ModelAndView("redirect:/");
    }
    
    String name = request.getParameter("title");
    String description = request.getParameter("description");
    Double price = request.getParameter("price")!=null ? Double.parseDouble(request.getParameter("price")):null;



    String path=session.getServletContext().getRealPath("/");
    //String filename=file.getOriginalFilename();
    path=path+"resources"+ File.separator + "uploads" + File.separator;
    String filename = user.getId()+"_"+name+".mp3";
    //System.out.println(path+" "+filename);
    try{
      byte barr[]=file.getBytes();
      String fullpath = path+"/"+filename;
      BufferedOutputStream bout=new BufferedOutputStream(
          new FileOutputStream(fullpath));
      bout.write(barr);
      bout.flush();
      bout.close();

    }catch(Exception e){System.out.println(e);}

    Video upload = new Video();
    upload.setTitle(name);
    upload.setFile_Link(filename);
    upload.setDescription(description);
    if(price!=null){
      upload.setPrice(price);
    }
    videoService.upload(upload,user);

    return new ModelAndView("redirect:/");
  }

  @RequestMapping(value = "/account", method = RequestMethod.GET)
  public ModelAndView Account(HttpServletRequest request, HttpServletResponse response, HttpSession session){
    if(firewall(session)==null){
      return new ModelAndView("redirect:/");
    }
    ModelAndView mav = new ModelAndView("bought");
    mav.addObject("user", firewall(session));
    mav.addObject("route", "account");
    mav.addObject("videos",userService.getBoughtTracks(firewall(session)));
    mav.addObject("uploaded",userService.getUploadedTracks(firewall(session)));
    return mav;
  }

  @RequestMapping(value = "/checkout", method = RequestMethod.GET, produces = "application/json")
  public ModelAndView Checkout(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
    User user = firewall(session);
    Cart cart = (Cart)session.getAttribute("cart");
    Order order = new Order();
    order.setDate(Timestamp.from(Instant.now()));
    order.setUser_id(user.getId());
    order.setUid(MD5.getMd5(user.getId()+"_"+order.getDate().toLocalDateTime().toString()));
    orderService.placeOrder(order);
    order = orderService.getOrderByTimestamp(order.getUid(),user);
    for(Video video:cart.getVideos()){
      Order_item o = new Order_item();
      o.setVideo_id(video.getId());
      o.setPrice(video.getPrice());
      o.setOrder_id(order.getId());
      orderItemService.saveOrderItem(o);
    }
    cart = new Cart();
    session.setAttribute("cart",cart);
    return new ModelAndView("redirect:/");
  }


}
