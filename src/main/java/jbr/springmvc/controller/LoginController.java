package jbr.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;
import jbr.springmvc.service.UserService;


@Controller

public class LoginController {

  @Autowired
  UserService userService;

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
    if(HomeController.firewall(session)!=null){
      return new ModelAndView("redirect:/home");
    }
    ModelAndView mav = new ModelAndView("login");
    mav.addObject("login", new Login());
    return mav;
  }

  @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
  public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
      @ModelAttribute("login") Login login, HttpSession session) {
    System.out.println("Submitted login data");
    ModelAndView mav = null;

    User user = userService.validateUser(login);

    if (user != null) {
      System.out.println("login sucessful!");
      session.setAttribute("user",user);
      return new ModelAndView("redirect:/home");
    }
    System.out.println("Wrong login details");
    mav = new ModelAndView("login");
    mav.addObject("message", "Invalid credentials!");

    return mav;
  }

  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public ModelAndView logout(HttpSession session) {
    session.removeAttribute("user");
    session.removeAttribute("cart");
    return new ModelAndView("redirect:/");
  }

}
