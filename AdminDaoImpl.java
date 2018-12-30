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

import pojo.Admin;
import pojo.Visitor;
import util.DBUtil;
import dao.IAdminDao;
    
public class AdminDaoImpl implements IAdminDao {

	@Override
	public Admin login(String username, String password) {
		// TODO Auto-generated method stub
		String sql="select * from admin where username = ? and password = ?";
		Object[] params = {username,password};
		return DBUtil.getObject(sql, params, Admin.class);
	}

}
