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
import com.orm.Tgoods;
import com.orm.Truku;
import com.orm.TrukuMingxi;
import com.orm.Yuangong;
import com.service.liuService;

public class ruku_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("rukuAdd"))
		{
			rukuAdd(req, res);
		}
		if(type.endsWith("rukuMana"))
		{
			rukuMana(req, res);
		}
		if(type.endsWith("rukuDel"))
		{
			rukuDel(req, res);
		}	
		if(type.endsWith("rukuMingxiAdd"))
		{
			rukuMingxiAdd(req, res);
		}
		if(type.endsWith("rukuMingxiMana"))
		{
			rukuMingxiMana(req, res);
		}
		if(type.endsWith("rukuMingxiDel"))
		{
			rukuMingxiDel(req, res);
		}
		if(type.endsWith("rukuQuery"))
		{
			rukuQuery(req, res);
		}
		if(type.endsWith("rukuQuery1"))
		{
			rukuQuery1(req, res);
		}
		if(type.endsWith("rukudan"))
		{
			rukudan(req, res);
		}
	}
	
	public void rukuAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String danjuhao=req.getParameter("danjuhao");
		String shijian=req.getParameter("shijian");
		int zongjiage=Integer.parseInt(req.getParameter("zongjiage"));
		String jingshouren=req.getParameter("jingshouren");
		String beizhu=req.getParameter("beizhu");
		String del="no";
		
		String sql="insert into t_ruku(danjuhao,shijian,zongjiage,jingshouren,beizhu,del) values(?,?,?,?,?,?)";
		Object[] params={danjuhao,shijian,zongjiage,jingshouren,beizhu,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "ruku?type=rukuMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void rukuDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		String sql="update t_ruku set del='yes' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "ruku?type=rukuMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void rukuMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List rukuList=new ArrayList();
		String sql="select * from t_ruku where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Truku ruku=new Truku();
				ruku.setId(rs.getInt("id"));
				ruku.setDanjuhao(rs.getString("danjuhao"));
				ruku.setShijian(rs.getString("shijian"));
				ruku.setZongjiage(rs.getInt("zongjiage"));
				ruku.setJingshouren(rs.getString("jingshouren"));
				ruku.setBeizhu(rs.getString("beizhu"));
				rukuList.add(ruku);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("rukuList", rukuList);
		req.getRequestDispatcher("admin/ruku/rukuMana.jsp").forward(req, res);
	}
	public void rukudan(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List rukuList=new ArrayList();
		String sql="select * from t_ruku where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Truku ruku=new Truku();
				ruku.setId(rs.getInt("id"));
				ruku.setDanjuhao(rs.getString("danjuhao"));
				ruku.setShijian(rs.getString("shijian"));
				ruku.setZongjiage(rs.getInt("zongjiage"));
				ruku.setJingshouren(rs.getString("jingshouren"));
				ruku.setBeizhu(rs.getString("beizhu"));
				rukuList.add(ruku);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("rukuList", rukuList);
		req.getRequestDispatcher("admin/ruku/rukudan.jsp").forward(req, res);
	}
	public void rukuMingxiAdd(HttpServletRequest req,HttpServletResponse res)
	{
		
		int ruku_id=Integer.parseInt(req.getParameter("ruku_id"));
		int goods_id=Integer.parseInt(req.getParameter("goods_id"));
		int shuliang=Integer.parseInt(req.getParameter("shuliang"));
		String beizhu=req.getParameter("beizhu");
		
		String sql="insert into t_rukuMingxi(ruku_id,goods_id,shuliang,beizhu) values(?,?,?,?)";
		Object[] params={ruku_id,goods_id,shuliang,beizhu};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "ruku?type=rukuMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void rukuMingxiMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int ruku_id=Integer.parseInt(req.getParameter("ruku_id"));
		
		List rukuMingxiList=new ArrayList();
		String sql="select * from t_rukuMingxi where ruku_id="+ruku_id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TrukuMingxi rukuMingxi=new TrukuMingxi();
				
				rukuMingxi.setId(rs.getInt("id"));
				rukuMingxi.setRuku_id(rs.getInt("ruku_id"));
				rukuMingxi.setGoods_id(rs.getInt("goods_id"));
				rukuMingxi.setShuliang(rs.getInt("shuliang"));
				rukuMingxi.setBeizhu(rs.getString("beizhu"));
				rukuMingxi.setGoods_name(liuService.getGoodsName(rs.getInt("goods_id")));
				
				rukuMingxiList.add(rukuMingxi);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		System.out.println(rukuMingxiList.size());
		req.setAttribute("rukuMingxiList", rukuMingxiList);
		req.setAttribute("ruku_id", ruku_id);
		req.getRequestDispatcher("admin/ruku/rukuMingxiMana.jsp").forward(req, res);
	}
	public void rukuQuery(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List rukuList=new ArrayList();
		String sql="select a.*,b.danjuhao,b.shijian,b.jingshouren,c.`name` as mingcheng from t_rukumingxi a LEFT JOIN t_ruku b on a.ruku_id=b.id left join t_goods c on a.goods_id=c.id";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Truku ruku=new Truku();
				ruku.setId(rs.getInt("id"));
				ruku.setDanjuhao(rs.getString("danjuhao"));
				ruku.setShijian(rs.getString("shijian"));
				ruku.setShuliang(rs.getInt("shuliang"));
				ruku.setJingshouren(rs.getString("jingshouren"));
				ruku.setMingcheng(rs.getString("mingcheng"));
				rukuList.add(ruku);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("rukuList", rukuList);
		req.getRequestDispatcher("admin/ruku/rukuQuery.jsp").forward(req, res);
	}
	public void rukuQuery1(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String goods_id=req.getParameter("goods_id");
		String shijian=req.getParameter("shijian");
		List rukuList=new ArrayList();
		String sql="select a.*,b.danjuhao,b.shijian,b.jingshouren,c.`name` as mingcheng from t_rukumingxi a LEFT JOIN t_ruku b on a.ruku_id=b.id left join t_goods c on a.goods_id=c.id where 1>0";
		if(!goods_id.equals("0"))
		{
			sql+=" and a.goods_id="+goods_id+"";			
		}
		if(!shijian.equals(""))
		{
			sql+=" and b.shijian='"+shijian+"'";			
		}
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Truku ruku=new Truku();
				ruku.setId(rs.getInt("id"));
				ruku.setDanjuhao(rs.getString("danjuhao"));
				ruku.setShijian(rs.getString("shijian"));
				ruku.setShuliang(rs.getInt("shuliang"));
				ruku.setJingshouren(rs.getString("jingshouren"));
				ruku.setMingcheng(rs.getString("mingcheng"));
				rukuList.add(ruku);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("rukuList", rukuList);
		req.getRequestDispatcher("admin/ruku/rukuQuery.jsp").forward(req, res);
	}
	public void rukuMingxiDel(HttpServletRequest req,HttpServletResponse res)
	{
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		String sql="delete from t_rukuMingxi where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "删除成功");
		req.setAttribute("path", "ruku?type=rukuMana");
		
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
