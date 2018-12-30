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

import java.util.Date;
    
public class Ticket {
	
	private int tid;
	private int sid;
	private int overplus;
	private int number;
	private String sname;
	private String address;
	private String price;
	private String sceneryimg;
	private Date starttime;
	private Date endtime;
	
	public String getSceneryimg() {
		return sceneryimg;
	}
	public void setSceneryimg(String sceneryimg) {
		this.sceneryimg = sceneryimg;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getOverplus() {
		return overplus;
	}
	public void setOverplus(int overplus) {
		this.overplus = overplus;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	@Override
	public String toString() {
		return "ticket [tid=" + tid + ", sid=" + sid + ", overplus=" + overplus
				+ ", number=" + number + ", sname=" + sname + ", address="
				+ address + ", price=" + price + ", sceneryimg=" + sceneryimg
				+ ", starttime=" + starttime + ", endtime=" + endtime + "]";
	}
	
}
