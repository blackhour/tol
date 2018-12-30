/*   
 * Copyright (c) 2010-2020 Founder Ltd. All Rights Reserved.   
 *   
 * This software is the confidential and proprietary information of   
 * Founder. You shall not disclose such Confidential Information   
 * and shall use it only in accordance with the terms of the agreements   
 * you entered into with Founder.   
 *   
 */     
package servlet.visitor;    

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import pojo.Page;
import pojo.Scenery;
import pojo.Ticket;
import service.ISceneryService;
import service.impl.SceneryServiceImpl;
import util.BaseServlet;
    
public class sceneryServlet extends BaseServlet {

	ISceneryService iSceneryService=new SceneryServiceImpl();
	public void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pageNum= request.getParameter("pageNum");
		String key="";
		if(pageNum==null){
			pageNum="1";
		}
		
		Page page=new Page();
		page.setPageNum(Integer.parseInt(pageNum));
		Page page2=iSceneryService.select(key,page);
		Gson gson = new Gson();
		String strJSON=gson.toJson(page2);
		response.getWriter().print(strJSON);
	}
	public void flag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("sid");
		Scenery scenery=iSceneryService.select(Integer.parseInt(id));
		
		HttpSession session =request.getSession();
		session.setAttribute("scenery", scenery);
		response.sendRedirect("sceneryDet.jsp");
	
	}
	public void ticket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("sid");
		Ticket ticket=iSceneryService.ticket(Integer.parseInt(id));
		HttpSession session =request.getSession();
		session.setAttribute("ticket", ticket);
		response.sendRedirect("ticket.jsp");
	
	}
	public void order(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		String tid=request.getParameter("tid");
		String sid=request.getParameter("sid");
		String vid=request.getParameter("vid");
		String price=request.getParameter("price");
		String count=request.getParameter("cou");
		String ticketnum=request.getParameter("ticketnum");
		String pay=request.getParameter("pay");
		String number=request.getParameter("number");
		
		Date date=new Date();
		SimpleDateFormat sdf =new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
		String nowTime = sdf.format(date);
		Date time =null;
		try {
			time = sdf.parse(nowTime);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Ticket ticket=iSceneryService.selectt(Integer.parseInt(tid));
		if(ticket.getNumber() < Integer.parseInt(ticketnum)){
			response.sendRedirect("warning.jsp");
		}else{
	        int res=iSceneryService.insert(Integer.parseInt(tid),Integer.parseInt(sid),Integer.parseInt(vid),price,count,Integer.parseInt(number),pay,time,Integer.parseInt(ticketnum));
	        if(res>0){
	        	response.sendRedirect("order.jsp");
	        }
			
		}
		
	}
	@Override
	protected void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}



}
