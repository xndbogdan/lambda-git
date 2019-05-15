package jbr.springmvc.service;

import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;
import jbr.springmvc.model.Video;

import java.util.List;

public interface UserService {

  void register(User user);

  User validateUser(Login login);

  User checkExistance(User user);

  User getUserById(int id);

  List<Video> getBoughtTracks(User user);

  //void erase(User user); //for gdpr compliance
}
