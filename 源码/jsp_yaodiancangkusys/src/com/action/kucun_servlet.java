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
import com.orm.Kucun;
import com.orm.TAdmin;
import com.orm.Tgoods;
import com.orm.Truku;
import com.orm.TrukuMingxi;
import com.orm.Yuangong;
import com.service.liuService;

public class kucun_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("kucunMana"))
		{
			kucunMana(req, res);
		}
	}
	public void kucunMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List kucunList =new ArrayList();
		
		List<Integer> goods_id_list=liuService.getAllGoods_id();
		for(int i=0;i<goods_id_list.size();i++)
		{
			int goods_id=goods_id_list.get(i);
			int kucunShuliang=liuService.getGoodsRukuShuliang(goods_id)-liuService.getGoodsChukuShuliang(goods_id);
			
			Kucun kucun=new Kucun();
			kucun.setGoods_id(goods_id);
			kucun.setKucun(kucunShuliang);
			kucun.setGoods_name(liuService.getGoodsName(goods_id));
			kucunList.add(kucun);
		}
		
		req.setAttribute("kucunList", kucunList);
		req.getRequestDispatcher("admin/kucun/kucunMana.jsp").forward(req, res);
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
