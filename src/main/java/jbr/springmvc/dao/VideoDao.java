package jbr.springmvc.dao;

import jbr.springmvc.model.User;
import jbr.springmvc.model.Video;

import java.util.ArrayList;
import java.util.List;


public interface VideoDao {

  void upload(Video video, User user);
  User getUploader(Video video);
  //void erase(Video video);
  List<Video> getAll();
  List<Video> getApproved();
  List<Video> getUnapproved();
  List<Video> getDeclined();
  Video getVideoById(int id);
  void approveVideo(int id);
  void declineVideo(int id);
}
