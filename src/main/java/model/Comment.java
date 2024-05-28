package model;

import java.util.List;

public class Comment {
	private String idComment;
	private String idP;
	private String nameAcc;
	private String content;
	private String date;
	private List<String> imgAndVideo;
	private int status;

	public List<String> getImgAndVideo() {
		return imgAndVideo;
	}

	public void setImgAndVideo(List<String> imgAndVideo) {
		this.imgAndVideo = imgAndVideo;
	}

	public Comment(String idComment, String idP, String nameAcc, String content, List<String> imgAndVideo, String date, int status) {
		super();
		this.idComment = idComment;
		this.idP = idP;
		this.nameAcc = nameAcc;
		this.content = content;
		this.imgAndVideo = imgAndVideo;
		this.date = date;
		this.status = status;
	}
	public Comment( String idP, String nameAcc, String content, int status) {
		super();
		this.idP = idP;
		this.nameAcc = nameAcc;
		this.content = content;
		this.status = status;
	}

	public Comment() {

	}

	public String getIdComment() {
		return idComment;
	}
	public void setIdComment(String idComment) {
		this.idComment = idComment;
	}
	public String getIdP() {
		return idP;
	}
	public void setIdP(String idP) {
		this.idP = idP;
	}
	public String getNameAcc() {
		return nameAcc;
	}
	public void setNameAcc(String nameAcc) {
		this.nameAcc = nameAcc;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}


	@Override
	public String toString() {
		return "Comment{" +
				"idComment='" + idComment + '\'' +
				", idP='" + idP + '\'' +
				", nameAcc='" + nameAcc + '\'' +
				", content='" + content + '\'' +
				", date='" + date + '\'' +
				", imgAndVideo=" + imgAndVideo +
				", status=" + status +
				'}';
	}
}
