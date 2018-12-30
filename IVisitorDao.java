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

import java.util.Date;
import java.util.List;

import pojo.Order;
import pojo.Shop;
import pojo.Visitor;
    
public interface IVisitorDao {
	Visitor login(String username,String password);
	int add(String username, String password, String name, String idcard,
			String sex, String userimg,Date birthdayDate);
	List<Order> selectorder();
	int delectorder(int oid);
	int insertshop(int sid, int vid);
	List<Shop> selectshop(int vid);
	int delectshop(int shid);

}
