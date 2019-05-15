package jbr.springmvc.service;

import jbr.springmvc.dao.UserDao;
import jbr.springmvc.dao.VideoDao;
import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;
import jbr.springmvc.model.Video;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class VideoServiceImpl implements VideoService {

  @Autowired
  public VideoDao videoDao;

  public void upload(Video video, User user){ videoDao.upload(video,user); }

  public User getUploader(Video video){return videoDao.getUploader(video);}

  public List<Video> getAll(){return videoDao.getAll();}

  public List<Video> getApproved(){return videoDao.getApproved();}

  public List<Video> getUnapproved(){return videoDao.getUnapproved();}

  public List<Video> getDeclined(){ return videoDao.getDeclined();}

  public Video getVideoById(int id){return videoDao.getVideoById(id);}

  public void approveVideo(int id) { videoDao.approveVideo(id);}

  public void declineVideo(int id) { videoDao.declineVideo(id);}

}
