package util;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.Closeable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.omg.CORBA.PUBLIC_MEMBER;

import pojo.Page;

import com.mchange.v2.codegen.bean.Property;

public class DBUtil {
	public static Connection getconn () throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://127.0.0.1:3306/ticketol";
		String user = "root";
		String pwd = "root";
		
		Connection conn = DriverManager.getConnection(url, user, pwd);
		return conn;		
	}
	public static void close(ResultSet rs,Statement stmt,Connection conn){
		try {
			if (stmt != null) {
				stmt.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if (conn != null) {
				conn.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public static int update(String sql,Object[] params) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		int res;
		try {
			conn = getconn();		
			stmt = conn.prepareStatement(sql);
			for(int i=0;i<params.length;i++){
				stmt.setObject(i+1, params[i]);
			}
			res = stmt.executeUpdate();
			return res;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			/*
			 * finally中的代码在任何时候都会被执行
			 */
			close(null, stmt, conn);

		}
		return 0;
	}
	public static List<Map<String, Object>> select(String sql,Object[] params) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Map<String, Object>> list=new ArrayList<>();
		try {
			;
			conn = getconn();
			stmt = conn.prepareStatement(sql);
			if(params != null){
				for(int i=0;i<params.length;i++){
					stmt.setObject(i+1, params[i]);
				}
			}
			rs = stmt.executeQuery();
			ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
			int colCount=rsmd.getColumnCount();
	
			while(rs.next()) {
				Map<String, Object> map = new HashMap<>();
				for(int i=0;i<colCount;i++){
					String colName = rsmd.getColumnName(i+1);
					Object value=rs.getObject(i+1);
					map.put(colName, value);
				}
				list.add(map);
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			/*
			 * finally中的代码在任何时候都会被执行
			 */
			close(rs, stmt, conn);
		}
		return list;
	}
	public static <T>List<T> select(String sql,Object[] params,Class<T> type){
		List<Map<String, Object>> listMap = select(sql,params);
		List<T> list = new ArrayList<>();
		try {
			BeanInfo beanInfo = Introspector.getBeanInfo(type);
			PropertyDescriptor[] properties = beanInfo.getPropertyDescriptors();
			for (Map<String, Object> map : listMap) {
				T object = type.newInstance();
				for (PropertyDescriptor prop : properties) {
					String proName = prop.getName();
					Method setter = prop.getWriteMethod();
					Object value =map.get(proName);
					if(value !=null){
						try {
							setter.invoke(object, value);
						} catch (IllegalArgumentException
								| InvocationTargetException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				list.add(object);
				
			}
			
			
		} catch (IntrospectionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return list;
	
	}
	public static <T> T getObject(String sql,Object[] params,Class<T> type) {
		List<T> list = select(sql, params, type);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
		
	}
	
	public static <T> Page select(String sql,Object[] params,Page page,Class<T> type) {
		List<T> list =select(sql, params,type);
		int resCount=list.size();
		int res=resCount % page.getRowCount();
		int pageCount=0;
		if(res==0){
			pageCount=resCount / page.getRowCount();
		}
		else {
			pageCount=(resCount / page.getRowCount())+1;
		}
		page.setPageCount(pageCount);
		int start = (page.getPageNum()-1)*page.getRowCount();
		String sqlLimit=sql+"limit "+start+",  "+page.getRowCount();
		list =select(sqlLimit, params,type);
		page.setList(list);
		
		return page;
	}
}
