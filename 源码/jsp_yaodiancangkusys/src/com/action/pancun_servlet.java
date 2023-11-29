package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
import com.orm.Tgoods;
import com.orm.Tpancun;
import com.orm.Truku;
import com.orm.TrukuMingxi;
import com.orm.Yuangong;
import com.service.liuService;

public class pancun_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("pancunAdd"))
		{
			pancunAdd(req, res);
		}
		if(type.endsWith("pancunMana"))
		{
			pancunMana(req, res);
		}
		if(type.endsWith("pancunDel"))
		{
			pancunDel(req, res);
		}
		
	}

	public void pancunAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=String.valueOf(new Date().getTime());
		String shijian=req.getParameter("shijian");
		int goods_id=Integer.parseInt(req.getParameter("goods_id"));
		String shijishuliang=req.getParameter("shijishuliang");
		
		
		String xitongshuliang=req.getParameter("xitongshuliang");
		String type1=req.getParameter("type1");
		String beizhu=req.getParameter("beizhu");
		int yuangong_id=0;
		String del="no";
		
		String sql="insert into t_pancun values(?,?,?,?,?,?,?,?,?)";
		Object[] params={id,shijian,goods_id,shijishuliang,xitongshuliang,type1,beizhu,yuangong_id,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "pancun?type=pancunMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void pancunDel(HttpServletRequest req,HttpServletResponse res)
	{
		String sql="update t_pancun set del='yes' where id=?";
		Object[] params={req.getParameter("id")};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "pancun?type=pancunMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void pancunMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List pancunList=new ArrayList();
		String sql="select * from t_pancun where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tpancun pancun=new Tpancun();
				
				pancun.setId(rs.getString("id"));
				pancun.setShijian(rs.getString("shijian"));
				pancun.setGoods_id(rs.getInt("goods_id"));
				pancun.setShijishuliang(rs.getString("shijishuliang"));
				
				pancun.setXitongshuliang(rs.getString("xitongshuliang"));
				pancun.setType1(rs.getString("type1"));
				pancun.setBeizhu(rs.getString("beizhu"));
				pancun.setYuangong_id(rs.getInt("yuangong_id"));
				
				pancun.setDel(rs.getString("del"));
				pancun.setGoods_name(liuService.getGoodsName(rs.getInt("goods_id")));
				pancunList.add(pancun);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("pancunList", pancunList);
		req.getRequestDispatcher("admin/pancun/pancunMana.jsp").forward(req, res);
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
