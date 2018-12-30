/*   
 * Copyright (c) 2010-2020 Founder Ltd. All Rights Reserved.   
 *   
 * This software is the confidential and proprietary information of   
 * Founder. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Founder.   
 *   
 */     
package servlet.admin;    

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.IAdminDao;
import pojo.Admin;
import pojo.Visitor;
import service.IAdminService;
import service.impl.AdminServiceImpl;
import util.BaseServlet;
    
public class adminServlet extends BaseServlet {
	
	
	private static final long serialVersionUID = 1L;
	IAdminService iAdminService=new AdminServiceImpl();
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// µÇÂ¼
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Admin admin = iAdminService.login(username, password);
		if(admin == null){
			//µÇÂ¼Ê§°Ü
			
		}else{
			//µÇÂ¼³É¹¦
			HttpSession session =request.getSession();
			session.setAttribute("admin", admin);
			response.sendRedirect("adminIn.jsp");
		}
	}
	
	@Override
	protected void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	

}
