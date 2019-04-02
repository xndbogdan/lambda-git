package jbr.springmvc.dao;

import jbr.springmvc.helper.MD5;
import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;
import jbr.springmvc.model.Video;
import jbr.springmvc.service.UserService;
import jbr.springmvc.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VideoDaoImpl implements VideoDao {

  @Autowired
  DataSource datasource;

  @Autowired
  JdbcTemplate jdbcTemplate;

  @Autowired
  UserService userService;

  public void upload(Video video, User user){
    String sql = "insert into video(Title,Description,Price,File_Link,User_id) values (?,?,?,?,?)";
    jdbcTemplate.update(sql, new Object[] {video.getTitle(), video.getDescription(), video.getPrice(), video.getFile_Link(), video.getUser_id()});
  }

  public User getUploader(Video video){
    return userService.getUserById(video.getUser_id());
  }

  public List<Video> getAll(){
    String sql = "select * from videos";
    List<Video> videos = jdbcTemplate.query(sql, new VideoMapper());

    return videos;
  }


}

class VideoMapper implements RowMapper<Video> {
  @Autowired
  UserService userService;

  public Video mapRow(ResultSet rs, int arg1) throws SQLException {
    Video video = new Video();

    video.setTitle(rs.getString("Title"));
    video.setDescription(rs.getString("Description"));
    video.setPrice(rs.getString("Price"));
    video.setFile_Link(rs.getString("File_Link"));
    video.setUser_id(rs.getInt("User_id"));

    return video;
  }
}