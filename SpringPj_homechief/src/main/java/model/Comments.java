package model;

import java.util.Date;

public class Comments {
	int rcpnum;
	int memnum;
	String content;
	Date reg_date; // content.jsp에서 저장을 위해 Date 타입을 String으로 변경
	int commentnum;

	String name; // 회원이름
	String profile;

	public Comments() {
	}

	public int getRcpnum() {
		return rcpnum;
	}

	public void setRcpnum(int rcpnum) {
		this.rcpnum = rcpnum;
	}

	public int getMemnum() {
		return memnum;
	}

	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getCommentnum() {
		return commentnum;
	}

	public void setCommentnum(int commentnum) {
		this.commentnum = commentnum;
	}

	@Override
	public String toString() {
		return "Comments [rcpnum=" + rcpnum + ", memnum=" + memnum + ", content=" + content + ", reg_date=" + reg_date
				+ ", commentnum=" + commentnum + ", name=" + name + ", profile=" + profile + "]";
	}

}
