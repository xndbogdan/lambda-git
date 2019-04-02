package jbr.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;

import jbr.springmvc.dao.UserDao;
import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;

public class UserServiceImpl implements UserService {

  @Autowired
  public UserDao userDao;

  public void register(User user) { userDao.register(user);}
  public User validateUser(Login login) { return userDao.validateUser(login);}
  public User checkExistance(User user) {return userDao.checkExistance(user);}
  public User getUserById(int id) {return userDao.getUserById(id);}

}
