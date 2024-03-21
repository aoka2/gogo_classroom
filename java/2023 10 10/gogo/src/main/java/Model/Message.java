package Model;

import java.io.Serializable;
import java.util.ArrayList;

public class Message implements Serializable{
	private String title;
	private String context;
	private String creater;
	private String subject;
	private ArrayList<String> commnet;
	private int like;
	private int dislike;
	public Message() {
		
	}
	public Message(String title, String context,String creater,String subject) {
		this.title = title;
		this.context = context;
		this.like = 0;
		this.dislike = 0;
		this.creater = creater;
		this.subject = subject;
		this.commnet = new ArrayList<>();
	}
	public String getTitle() {
		return this.title;
	}
	public String getContext() {
		return this.context;
	}
	public int getLike() {
		return this.like;
	}
	public int getDislike() {
		return this.dislike;
	}
	public String getCreater() {
		return this.creater;
	}
	public String getSubject() {
		return this.subject;
	}
	public ArrayList<String> getCommnet(){
		return this.commnet;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public void setDislike(int dislike) {
		this.dislike = dislike;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setCommnet(ArrayList<String> commnet) {
		this.commnet = commnet;
	}
}