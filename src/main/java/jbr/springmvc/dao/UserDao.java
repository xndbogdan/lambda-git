package jbr.springmvc.dao;

import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;
import jbr.springmvc.model.Video;

import java.util.List;

public interface UserDao {

  void register(User user);

  User validateUser(Login login);
  User checkExistance(User user);
  User getUserById(int id);
  public List<Video> getBoughtTracks(User user);
}
