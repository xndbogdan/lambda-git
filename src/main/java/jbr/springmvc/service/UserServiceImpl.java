package jbr.springmvc.service;

import jbr.springmvc.model.Video;
import org.springframework.beans.factory.annotation.Autowired;

import jbr.springmvc.dao.UserDao;
import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;

import java.util.List;

public class UserServiceImpl implements UserService {

  @Autowired
  public UserDao userDao;

  public void register(User user) { userDao.register(user);}
  public User validateUser(Login login) { return userDao.validateUser(login);}
  public User checkExistance(User user) {return userDao.checkExistance(user);}
  public User getUserById(int id) {return userDao.getUserById(id);}
  public List<Video> getBoughtTracks(User user){ return userDao.getBoughtTracks(user);}
  public List<Video> getUploadedTracks(User user) {return userDao.getUploadedTracks(user);}
  public boolean userHasTrack(User user, Video video) {return userDao.userHasTrack(user,video);}
}

