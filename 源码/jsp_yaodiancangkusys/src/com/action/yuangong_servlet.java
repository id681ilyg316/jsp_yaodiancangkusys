package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.Yuangong;

public class yuangong_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("yuangongAdd"))
		{
			yuangongAdd(req, res);
		}
		if(type.endsWith("yuangongMana"))
		{
			yuangongMana(req, res);
		}
		if(type.endsWith("yuangongDel"))
		{
			yuangongDel(req, res);
		}
		if(type.endsWith("yuangongQuanxian"))
		{
			yuangongQuanxian(req, res);
		}
	}
	public void yuangongAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String name=req.getParameter("name");
		String sex=req.getParameter("sex");
		String age=req.getParameter("age");
		String tel=req.getParameter("tel");
		String address=req.getParameter("address");
		String zhiwei=req.getParameter("zhiwei");
		
		String sql="insert into t_yuangong(name,sex,age,tel,address,zhiwei,quanxian,loginName,loginpw,del) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params={name,sex,age,tel,address,zhiwei,0,"","","no"};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void yuangongDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		String sql="update t_yuangong set del=? where id=?";
		Object[] params={"yes",id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void yuangongMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List yuangongList=new ArrayList();
		String sql="select * from t_yuangong where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Yuangong yuangong=new Yuangong();
				yuangong.setId(rs.getInt("id"));
				yuangong.setName(rs.getString("name"));
				yuangong.setSex(rs.getString("sex"));
				yuangong.setAge(rs.getString("age"));
				yuangong.setTel(rs.getString("tel"));
				yuangong.setAddress(rs.getString("address"));
				yuangong.setZhiwei(rs.getString("zhiwei"));
				yuangong.setQuanxian(rs.getInt("quanxian"));
				yuangong.setLoginName(rs.getString("loginName"));
				yuangong.setLoginPw(rs.getString("loginPw"));
				yuangongList.add(yuangong);
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yuangongList", yuangongList);
		req.getRequestDispatcher("admin/yuangong/yuangongMana.jsp").forward(req, res);
	}
	
	public void yuangongQuanxian(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		int quanxian=Integer.parseInt(req.getParameter("quanxian"));
		String loginName=req.getParameter("loginName");
		String loginPw=req.getParameter("loginPw");
		
		String sql="update t_yuangong set quanxian=?,loginName=?,loginPw=? where id="+id;
		Object[] params={quanxian,loginName,loginPw};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
