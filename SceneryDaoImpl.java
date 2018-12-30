/*   
 * Copyright (c) 2010-2020 Founder Ltd. All Rights Reserved.   
 *   
 * This software is the confidential and proprietary information of   
 * Founder. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Founder.   
 *   
 */     
package dao.impl;    


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.Order;

import pojo.Page;
import pojo.Scenery;
import pojo.Ticket;
import util.DBUtil;
import dao.ISceneryDao;
    
public class SceneryDaoImpl implements ISceneryDao {

	@Override
	public Page select(String key,Page page) {
		// TODO Auto-generated method stub
		String sql = "select * from scenery where sname like ? ";
		Object[] params={"%"+key+"%"};
		Page list=DBUtil.select(sql, params, page,Scenery.class);
		return list;
	}

	@Override
	public Scenery select(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from scenery where sid = ? ";
		Object[] params={id};
		return DBUtil.getObject(sql, params, Scenery.class);
	}

	@Override
	public Ticket ticket(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from ticket inner join scenery on ticket.sname = scenery.sname where ticket.sid=?";
		Object[] params={id};
		return DBUtil.getObject(sql, params, Ticket.class);
		
	}

	@Override
	public int insert(int tid, int sid, int vid, String price, String count,
			int number, String pay, Date df,int ticketnum) {
		// TODO Auto-generated method stub
		String payed="ÒÑÖ§¸¶";
		String sql1="UPDATE ticket SET overplus = ? - ? where sid=?";
		Object[] params1={number,ticketnum,sid};
		DBUtil.update(sql1, params1);
		String sql = "Insert into ord (sid,vid,tid,price,count,ticketnum,payway,payed,time)  values(?,?,?,?,?,?,?,?,?)";
		Object[] params={sid,vid,tid,price,count,ticketnum,pay,payed,df};
		return DBUtil.update(sql, params);
	}

	@Override
	public Ticket selectt(int tid) {
		// TODO Auto-generated method stub
		String sql = "select * from ticket where tid = ? ";
		Object[] params={tid};
		return DBUtil.getObject(sql, params, Ticket.class);
	}

	@Override
	public int Adelete(int sid) {
		// TODO Auto-generated method stub
		String sql = "delete from scenery where sid = ?";
		Object[] params = {sid};
		return DBUtil.update(sql,params);
	}

	@Override
	public int Aadd(String sname, String address, String describe) {
		// TODO Auto-generated method stub
		String sql = "insert into csenery(name,address,describe) values(?,?,?)";
		Object[] params = {sname,address,describe};
		return DBUtil.update(sql, params);
	}

	@Override
	public int Aupdate(String sname, String address, String describe, int sid) {
		// TODO Auto-generated method stub
		String sql = "update scenery set name = ?,address = ?,describe = ? where id = ?";
		Object[] params = {sname,address,describe,sid};
		return DBUtil.update(sql, params);
	}

	@Override
	public Page Aselect(String sname, String address, Page page) {
		// TODO Auto-generated method stub
		String sql = "select * from where name = ? and address = ?";
		Object[] params = {sname,address};
		return DBUtil.select(sql, params, page, Scenery.class);
	}

	@Override
	public List<Scenery> selectscenery() {
		// TODO Auto-generated method stub
		String sql = "select * from scenery";
		
		return DBUtil.select(sql, null, Scenery.class);
	}

}
