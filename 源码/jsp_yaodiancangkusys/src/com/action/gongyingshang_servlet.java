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
import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.DB;
import com.orm.TAdmin;
import com.orm.gongyingshang;

public class gongyingshang_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("gongyingshangMana"))
		{
			gongyingshangMana(req, res);
		}
		if(type.endsWith("gongyingshangAdd"))
		{
			gongyingshangAdd(req, res);
		}
		if(type.endsWith("gongyingshangDel"))
		{
			gongyingshangDel(req, res);
		}
		if(type.endsWith("gongyingshangEdit"))
		{
			gongyingshangEdit(req, res);
		}
		if(type.endsWith("gongyingshangSearch"))
		{
			gongyingshangSearch(req, res);
		}
		if(type.endsWith("gongyingshangXinxi"))
		{
			gongyingshangXinxi(req, res);
		}
	}

	public void gongyingshangAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String mingcheng=req.getParameter("mingcheng");
		String dizhi=req.getParameter("dizhi");
		String lianxiren=req.getParameter("lianxiren");
		String dianhua=req.getParameter("dianhua");
		String youbian=req.getParameter("youbian");
		String chuanzhen=req.getParameter("chuanzhen");
		String youxiang=req.getParameter("youxiang");
		
		String sql="insert into t_gongyingshang(mingcheng,dizhi,lianxiren,dianhua,youbian,chuanzhen,youxiang,del) values(?,?,?,?,?,?,?,?)";
		Object[] params={mingcheng,dizhi,lianxiren,dianhua,youbian,chuanzhen,youxiang,"no"};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "gongyingshang?type=gongyingshangMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void gongyingshangMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List gongyingshangList=new ArrayList();
		String sql="select * from t_gongyingshang where  del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				gongyingshang gongyingshang=new gongyingshang();
				gongyingshang.setId(rs.getInt("id"));
				gongyingshang.setMingcheng(rs.getString("mingcheng"));
				gongyingshang.setDizhi(rs.getString("dizhi"));
				gongyingshang.setLianxiren(rs.getString("lianxiren"));
				gongyingshang.setDianhua(rs.getString("dianhua"));
				gongyingshang.setYoubian(rs.getString("youbian"));
				gongyingshang.setChuanzhen(rs.getString("chuanzhen"));
				gongyingshang.setYouxiang(rs.getString("youxiang"));
				gongyingshangList.add(gongyingshang);
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("gongyingshangList", gongyingshangList);
		req.getRequestDispatcher("admin/gongyingshang/gongyingshangMana.jsp").forward(req, res);
	}
	public void gongyingshangDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		String sql="update t_gongyingshang set del='yes' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "gongyingshang?type=gongyingshangMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void gongyingshangEdit(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String sql="update t_gongyingshang set mingcheng=?,dizhi=?,lianxiren=?,dianhua=?,youbian=?,chuanzhen=?,youxiang=? where id="+id;
		
		String mingcheng=req.getParameter("mingcheng");
		String dizhi=req.getParameter("dizhi");
		String lianxiren=req.getParameter("lianxiren");
		String dianhua=req.getParameter("dianhua");
		String youbian=req.getParameter("youbian");
		String chuanzhen=req.getParameter("chuanzhen");
		String youxiang=req.getParameter("youxiang");
		
		Object[] params={mingcheng,dizhi,lianxiren,dianhua,youbian,chuanzhen,youxiang};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "gongyingshang?type=gongyingshangMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void gongyingshangSearch(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List gongyingshangList=new ArrayList();
		String sql="select * from t_gongyingshang where type='gongyingshang' and del='no' and mingcheng like '%"+req.getParameter("mingcheng").trim()+"%'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				gongyingshang gongyingshang=new gongyingshang();
				gongyingshang.setId(rs.getInt("id"));
				gongyingshang.setMingcheng(rs.getString("mingcheng"));
				gongyingshang.setDizhi(rs.getString("dizhi"));
				gongyingshang.setLianxiren(rs.getString("lianxiren"));
				gongyingshang.setDianhua(rs.getString("dianhua"));
				gongyingshang.setYoubian(rs.getString("youbian"));
				gongyingshang.setChuanzhen(rs.getString("chuanzhen"));
				gongyingshang.setYouxiang(rs.getString("youxiang"));
				gongyingshangList.add(gongyingshang);
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("gongyingshangList", gongyingshangList);
		req.getRequestDispatcher("admin/gongyingshang/gongyingshangMana.jsp").forward(req, res);
	}
	
	
	public void gongyingshangXinxi(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{System.out.println("%%%%");
		List gongyingshangList=new ArrayList();
		int id=Integer.parseInt(req.getParameter("id"));
		String sql="select * from t_gongyingshang where id="+id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				gongyingshang gongyingshang=new gongyingshang();
				gongyingshang.setId(rs.getInt("id"));
				gongyingshang.setMingcheng(rs.getString("mingcheng"));
				gongyingshang.setDizhi(rs.getString("dizhi"));
				gongyingshang.setLianxiren(rs.getString("lianxiren"));
				gongyingshang.setDianhua(rs.getString("dianhua"));
				gongyingshang.setYoubian(rs.getString("youbian"));
				gongyingshang.setChuanzhen(rs.getString("chuanzhen"));
				gongyingshang.setYouxiang(rs.getString("youxiang"));
				gongyingshangList.add(gongyingshang);
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("gongyingshangList", gongyingshangList);
		req.getRequestDispatcher("admin/gongyingshang/gongyingshangXinxi.jsp").forward(req, res);
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
