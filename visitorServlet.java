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

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import pojo.Order;
import pojo.Shop;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;

import pojo.Visitor;
import service.IVisitorService;
import service.impl.VisitorServiceImpl;
import util.BaseServlet;
public class visitorServlet  extends BaseServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IVisitorService iVisitorService=new VisitorServiceImpl();
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 登录
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Visitor visitor = iVisitorService.login(username, password);
		if(visitor == null){
			//登录失败
			request.setAttribute("error", "");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
			//登录成功
			HttpSession session =request.getSession();
			session.setAttribute("visitor", visitor);
			response.sendRedirect("visitorIn.jsp");
		}
	}
	
	
	
	public void add(HttpServletRequest request, HttpServletResponse response) {
		// 登录
		
		// 设置上传图片的保存路径
		
		DiskFileItemFactory factoy=new DiskFileItemFactory();
        //创建解析器
        ServletFileUpload sfu=new ServletFileUpload(factoy);
		
        try {
			List<FileItem> list=sfu.parseRequest(request);
			Visitor visitor=new Visitor();
			String name=list.get(1).getString("utf-8");
			visitor.setName(name);
			String username =list.get(2).getString("utf-8");
			visitor.setUsername(username);
			String password =list.get(3).getString("utf-8");
			visitor.setPassword(password);
			String sex =list.get(4).getString("utf-8");
			visitor.setUsername(sex);
			String birthday =list.get(5).getString("utf-8");
			
			SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd");
			Date birthdayDate =null;
			try {
				birthdayDate= sdFormat.parse(birthday);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			visitor.setBirthday(birthdayDate);
			String idcard =list.get(6).getString("utf-8");
			visitor.setIdcard(idcard);
			
			String path=this.getServletContext().getRealPath("/userimg");
			String fileName=UUID.randomUUID().toString().replace("-", "")+"_"+list.get(0).getName();
			
		   /* if(!fileName.toLowerCase().endsWith("jpg")){
                System.out.println("图片格式不是jpg");
                request.setAttribute("msg", "你的图片格式不是jpg格式");
                request.getRequestDispatcher("/adminjsps/admin/book/add.jsp").forward(request, response);
                return;
            }*/
			File f=new File(path,fileName);
			list.get(0).write(f);
			visitor.setUserimg("userimg/"+fileName);
			Image image=new ImageIcon(f.getAbsolutePath()).getImage();
			String userimg = visitor.getUserimg();
			int res=iVisitorService.add(username,password,name,idcard, sex, userimg, birthdayDate);
			if(res>0)
			{
				HttpSession session =request.getSession();
				session.setAttribute("visitor", visitor);
				response.sendRedirect("visitorIn.jsp");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		
		
	}
	public void selectorder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Order> order=iVisitorService.selectorder();
		Gson gson = new Gson();
		String strJSON=gson.toJson(order);
		response.getWriter().print(strJSON);
	}
	public void delectorder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String oid = request.getParameter("oid");
		int res = iVisitorService.delectorder(Integer.parseInt(oid));
		if(res>0){
			response.sendRedirect("order.jsp");
		}
	}
	public void delectshop(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String shid = request.getParameter("shid");
		int res = iVisitorService.delectshop(Integer.parseInt(shid));
		if(res>0){
			response.sendRedirect("shop.jsp");
		}
	}
	public void selectshop(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String vid=request.getParameter("vid");
		List<Shop> shop=iVisitorService.selectshop(Integer.parseInt(vid));
		Gson gson = new Gson();
		String strJSON=gson.toJson(shop);
		response.getWriter().print(strJSON);
	}
public void insertshop(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String sid = request.getParameter("sid");
		String vid = request.getParameter("vid");
		int res = iVisitorService.insertshop(Integer.parseInt(sid),Integer.parseInt(vid));
		if(res>0){
			response.getWriter().print("{\"res\":1}");
		}else{
			response.getWriter().print("{\"res\":0}");
		}
	}
	@Override
	protected void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	
	

}
