package util;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BaseServlet
 */
public abstract class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected final void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		String action = request.getParameter("action");
		
		String methodName = "execute";
		
		Class clazz = this.getClass();
		
		if ( action != null && action.trim().length()>0) {
			methodName = action;
		}
		
		Method method=null;
		
		try {
			method = clazz.getMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			method.invoke(this,request,response);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			execute(request, response);
			
		} 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected final void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected abstract void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}
