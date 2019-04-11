package jbr.springmvc.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    public List<Video> videos = new ArrayList<>();
    public Cart(){
    }

    public List<Video> getVideos() {
        return videos;
    }

    public boolean isInCart(Video video){
        for(Video v:videos){
            if(v.getId()==video.getId()){
                return true;
            }
        }
        return false;
    }
}
