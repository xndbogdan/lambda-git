package jbr.springmvc.controller;

import jbr.springmvc.model.Cart;
import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;
import jbr.springmvc.service.UserService;
import jbr.springmvc.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller

public class HomeController {

  @Autowired
  UserService userService;
  @Autowired
  VideoService videoService;
  @RequestMapping(value = "/home", method = RequestMethod.GET)
  public ModelAndView Home(HttpServletRequest request, HttpServletResponse response,HttpSession session) {

    if(firewall(session)==null){
      return new ModelAndView("redirect:/");
    }
    ModelAndView mav = new ModelAndView("home");
    mav.addObject("user", firewall(session));
    mav.addObject("videos",videoService.getApproved());
    mav.addObject("userSvc",userService);
    mav.addObject("cart",getCart(session));
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

  static User firewall(HttpSession session){
    User usr=null;
    if(session.getAttribute("user")!=null){
      usr = (User)session.getAttribute("user");
    }
    return usr;
  }

  static Cart getCart(HttpSession session){
    return (Cart)session.getAttribute("cart");
  }

}
