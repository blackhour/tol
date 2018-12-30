package servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Page;
import pojo.Scenery;
import service.ISceneryService;
import service.impl.SceneryServiceImpl;
import util.BaseServlet;

import com.google.gson.Gson;


/**
 * Servlet implementation class SceneryServlet
 */
@WebServlet("/SceneryServlet")
public class sceneryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	private ISceneryService iSceneryService = new SceneryServiceImpl();
       
	
	public void Adelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String sid = request.getParameter("sid");
		int res = iSceneryService.Adelete(Integer.parseInt(sid));
		
		if (res > 0){
			response.getWriter().print("{\"res\" : 1}");
		}
		else {
			response.getWriter().print("{\"res\" : 0}");
		}
		
	}
	
	
	public void Aadd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String describe = request.getParameter("describe");
	
		int res = iSceneryService.Aadd(name,address,describe);
		
		if (res > 0){
			response.getWriter().print("{\"res\" : 1}");
		}
		else {
			response.getWriter().print("{\"res\" : 0}");
		}
	}
	
	public void Aupdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sid = request.getParameter("sid");
		String sname = request.getParameter("sname");
		String address = request.getParameter("address");
		String describe = request.getParameter("describe");
	
		int res = iSceneryService.Aupdate(sname,address,describe,Integer.parseInt(sid));
		
		if (res > 0){
			response.getWriter().print("{\"res\" : 1}");
		}
		else {
			response.getWriter().print("{\"res\" : 0}");
		}
	}
	public void selectscenery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Scenery> scenery=iSceneryService.selectscenery();
		Gson gson = new Gson();
		String strJSON = gson.toJson(scenery);
		response.getWriter().print(strJSON);
			
	}
	
	
	public void Aselect(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sname = request.getParameter("sname");
		String address = request.getParameter("address");
		
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null){
			pageNum = "1";
		}
		
		Page page = new Page();
		page.setPageNum(Integer.parseInt(pageNum));
		
		Page resPage = iSceneryService.Aselect(sname,address,page);
		
		
		Gson gson = new Gson();
		String strJSON = gson.toJson(resPage);
		response.getWriter().print(strJSON);
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
