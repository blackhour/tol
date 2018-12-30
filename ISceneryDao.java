/*   
 * Copyright (c) 2010-2020 Founder Ltd. All Rights Reserved.   
 *   
 * This software is the confidential and proprietary information of   
 * Founder. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Founder.   
 *   
 */     
package dao;    

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.Order;

import pojo.Page;
import pojo.Scenery;
import pojo.Ticket;
    
public interface ISceneryDao {

	Page select(String key,Page page);

	Scenery select(int id);

	Ticket ticket(int id);

	int insert(int tid, int sid, int vid, String price, String count,
			int number, String pay, Date df,int ticketnum);

	Ticket selectt(int tid);

	int Adelete(int sid);

	int Aadd(String sname, String address, String describe);

	int Aupdate(String sname, String address, String describe, int sid);

	Page Aselect(String sname, String address, Page page);

	List<Scenery> selectscenery();

}
