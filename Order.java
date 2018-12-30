package pojo;    

import java.util.Date;
    
public class Order {

	private int oid;
	private int sid;
	private int tid;
	private int id;
	private int ticketnum;
	private String price;
	private String count;
	private String payway;
	private String payed;
	private Date time;
	private String name;
	private String sname;
	private String address;
	private String sceneryimg;
	private Date starttime;
	private Date endtime;
	
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTicketnum() {
		return ticketnum;
	}
	public void setTicketnum(int ticketnum) {
		this.ticketnum = ticketnum;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getPayway() {
		return payway;
	}
	public void setPayway(String payway) {
		this.payway = payway;
	}
	public String getPayed() {
		return payed;
	}
	public void setPayed(String payed) {
		this.payed = payed;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSceneryimg() {
		return sceneryimg;
	}
	public void setSceneryimg(String sceneryimg) {
		this.sceneryimg = sceneryimg;
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
		return "Order [oid=" + oid + ", sid=" + sid + ", tid=" + tid + ", id="
				+ id + ", ticketnum=" + ticketnum + ", price=" + price
				+ ", count=" + count + ", payway=" + payway + ", payed="
				+ payed + ", time=" + time + ", name=" + name + ", sname="
				+ sname + ", address=" + address + ", sceneryimg=" + sceneryimg
				+ ", starttime=" + starttime + ", endtime=" + endtime + "]";
	}
	
	
}
