/*   
 * Copyright (c) 2010-2020 Founder Ltd. All Rights Reserved.   
 *   
 * This software is the confidential and proprietary information of   
 * Founder. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Founder.   
 *   
 */     
package pojo;    
    
public class Scenery {
	private int sid;
	private String sname;
	private String describe;
	private String comment;
	private String sceneryimg;
	private String address;
	public int getSid() {
		return sid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getSceneryimg() {
		return sceneryimg;
	}
	public void setSceneryimg(String sceneryimg) {
		this.sceneryimg = sceneryimg;
	}
	@Override
	public String toString() {
		return "Scenery [sid=" + sid + ", sname=" + sname + ", describe="
				+ describe + ", comment=" + comment + ", sceneryimg="
				+ sceneryimg + ", address=" + address + "]";
	}
	
	
}
