package jbr.springmvc.service;
import jbr.springmvc.model.User;
import jbr.springmvc.model.Video;

import java.util.ArrayList;
import java.util.List;

public interface VideoService {

  void upload(Video video, User user);
  User getUploader(Video video);
  //void erase(Video video);
  List<Video> getAll();
  List<Video> getApproved();
  List<Video> getUnapproved();
  List<Video> getDeclined();
  void approveVideo(int id);
  void declineVideo(int id);
  Video getVideoById(int id);

}
