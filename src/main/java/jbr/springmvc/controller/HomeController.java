package jbr.springmvc.controller;

import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;
import jbr.springmvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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

  @RequestMapping(value = "/home", method = RequestMethod.GET)
  public ModelAndView Home(HttpServletRequest request, HttpServletResponse response,HttpSession session) {

    if(firewall(session)==null){
      return new ModelAndView("redirect:/");
    }
    ModelAndView mav = new ModelAndView("home");
    mav.addObject("user", firewall(session));
    return mav;
  }

  static User firewall(HttpSession session){
    User usr=null;
    if(session.getAttribute("user")!=null){
      usr = (User)session.getAttribute("user");
    }
    return usr;
  }

}
