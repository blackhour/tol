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


import java.util.Date;
import java.util.List;

import util.DBUtil;
import pojo.Order;
import pojo.Shop;
import pojo.Ticket;
import pojo.Visitor;
import dao.IVisitorDao;
    
public class VisitorDaoImpl implements IVisitorDao {

	@Override
	public Visitor login(String username, String password) {
		// TODO Auto-generated method stub
		
		String sql="select * from user where username = ? and password = ?";
		Object[] params = {username,password};
		return DBUtil.getObject(sql, params, Visitor.class);
	}

	@Override
	public int add(String username, String password, String name,
			String idcard, String sex, String userimg,Date birthdayDate) {
		// TODO Auto-generated method stub
		String sql="Insert into user(username,password,name,idcard,sex,userimg,birthday)  values (?,?,?,?,?,?,?)";
		Object[] params = {username, password,name,idcard,sex,userimg,birthdayDate};
		return DBUtil.update(sql, params);
	}

	@Override
	public List<Order> selectorder() {
		// TODO Auto-generated method stub
		String sql="select * from ord inner join scenery on ord.sid=scenery.sid "
				+" inner join user on ord.vid=user.id "
				+" inner join ticket on ord.tid=ticket.tid "
				+ "where ord.payway like ?";	
		Object[] params = {"%"+""+"%"};
		return DBUtil.select(sql, params, Order.class);
	}

	@Override
	public List<Shop> selectshop(int vid) {
		// TODO Auto-generated method stub
		String sql="select * from shop inner join ticket on ticket.sid=shop.sid "
				+ " inner join scenery on shop.sid=scenery.sid "
				+ " where shop.vid = ?";
		Object[] params={vid};
		
		return DBUtil.select(sql, params, Shop.class);
	}

	@Override
	public int delectorder(int oid) {
		// TODO Auto-generated method stub
		String sql = "Delete from ord where oid = ?";
		Object[] params={oid};
		return DBUtil.update(sql, params);
	}

	@Override
	public int insertshop(int sid,int vid) {
		// TODO Auto-generated method stub
		String sql="select * from ticket where sid= ?";
		Object[] params={sid};
		Ticket ticket=DBUtil.getObject(sql, params, Ticket.class);
		int tid=ticket.getTid();
		String sname=ticket.getSname();
		String sql1="insert into shop (vid,sid,tid,sname) value(?,?,?,?)";
		Object[] params1={vid,sid,tid,sname};
		return DBUtil.update(sql1, params1);
	}

	@Override
	public int delectshop(int shid) {
		// TODO Auto-generated method stub
		String sql = "Delete from shop where shid = ?";
		Object[] params={shid};
		return DBUtil.update(sql, params);
	}

	
	
	
}
