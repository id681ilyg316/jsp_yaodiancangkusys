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
import com.orm.Tchuku;
import com.orm.TchukuMingxi;
import com.orm.Truku;
import com.orm.Yuangong;
import com.service.liuService;

public class chuku_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("chukuAdd"))
		{
			chukuAdd(req, res);
		}
		if(type.endsWith("chukuMana"))
		{
			chukuMana(req, res);
		}
		if(type.endsWith("chukuDel"))
		{
			chukuDel(req, res);
		}
		
		if(type.endsWith("chukuMingxiAdd"))
		{
			chukuMingxiAdd(req, res);
		}
		if(type.endsWith("chukuMingxiMana"))
		{
			chukuMingxiMana(req, res);
		}
		if(type.endsWith("chukuMingxiDel"))
		{
			chukuMingxiDel(req, res);
		}
		if(type.endsWith("chukuQuery"))
		{
			chukuQuery(req, res);
		}
		if(type.endsWith("chukuQuery1"))
		{
			chukuQuery1(req, res);
		}
		if(type.endsWith("chukudan"))
		{
			chukudan(req, res);
		}
	}
	public void chukuAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String danjuhao=req.getParameter("danjuhao");
		String shijian=req.getParameter("shijian");
		int zongjiage=Integer.parseInt(req.getParameter("zongjiage"));
		String jingshouren=req.getParameter("jingshouren");
		String beizhu=req.getParameter("beizhu");
		String del="no";
		
		String sql="insert into t_chuku(danjuhao,shijian,zongjiage,jingshouren,beizhu,del) values(?,?,?,?,?,?)";
		Object[] params={danjuhao,shijian,zongjiage,jingshouren,beizhu,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "chuku?type=chukuMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void chukuDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		String sql="update t_chuku set del='yes' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "chuku?type=chukuMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void chukuMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List chukuList=new ArrayList();
		String sql="select * from t_chuku where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tchuku chuku=new Tchuku();
				chuku.setId(rs.getInt("id"));
				chuku.setDanjuhao(rs.getString("danjuhao"));
				chuku.setShijian(rs.getString("shijian"));
				chuku.setZongjiage(rs.getInt("zongjiage"));
				chuku.setJingshouren(rs.getString("jingshouren"));
				chuku.setBeizhu(rs.getString("beizhu"));
				chukuList.add(chuku);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("chukuList", chukuList);
		req.getRequestDispatcher("admin/chuku/chukuMana.jsp").forward(req, res);
	}
	public void chukudan(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List chukuList=new ArrayList();
		String sql="select * from t_chuku where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tchuku chuku=new Tchuku();
				chuku.setId(rs.getInt("id"));
				chuku.setDanjuhao(rs.getString("danjuhao"));
				chuku.setShijian(rs.getString("shijian"));
				chuku.setZongjiage(rs.getInt("zongjiage"));
				chuku.setJingshouren(rs.getString("jingshouren"));
				chuku.setBeizhu(rs.getString("beizhu"));
				chukuList.add(chuku);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("chukuList", chukuList);
		req.getRequestDispatcher("admin/chuku/chukudan.jsp").forward(req, res);
	}
	
	
	public void chukuMingxiAdd(HttpServletRequest req,HttpServletResponse res)
	{
		
		int chuku_id=Integer.parseInt(req.getParameter("chuku_id"));
		int goods_id=Integer.parseInt(req.getParameter("goods_id"));
		int shuliang=Integer.parseInt(req.getParameter("shuliang"));
		String beizhu=req.getParameter("beizhu");
		
		String sql="insert into t_chukuMingxi(chuku_id,goods_id,shuliang,beizhu) values(?,?,?,?)";
		Object[] params={chuku_id,goods_id,shuliang,beizhu};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "chuku?type=chukuMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void chukuMingxiMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int chuku_id=Integer.parseInt(req.getParameter("chuku_id"));
		
		List chukuMingxiList=new ArrayList();
		String sql="select * from t_chukuMingxi where chuku_id="+chuku_id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TchukuMingxi chukuMingxi=new TchukuMingxi();
				
				chukuMingxi.setId(rs.getInt("id"));
				chukuMingxi.setChuku_id(rs.getInt("chuku_id"));
				chukuMingxi.setGoods_id(rs.getInt("goods_id"));
				chukuMingxi.setShuliang(rs.getInt("shuliang"));
				chukuMingxi.setBeizhu(rs.getString("beizhu"));
				chukuMingxi.setGoods_name(liuService.getGoodsName(rs.getInt("goods_id")));
				
				chukuMingxiList.add(chukuMingxi);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		System.out.println(chukuMingxiList.size());
		req.setAttribute("chukuMingxiList", chukuMingxiList);
		req.setAttribute("chuku_id", chuku_id);
		req.getRequestDispatcher("admin/chuku/chukuMingxiMana.jsp").forward(req, res);
	}
	
	public void chukuMingxiDel(HttpServletRequest req,HttpServletResponse res)
	{
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		String sql="delete from t_chukuMingxi where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "删除成功");
		req.setAttribute("path", "chuku?type=chukuMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void chukuQuery(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List chukuList=new ArrayList();
		String sql="select a.*,b.danjuhao,b.shijian,b.jingshouren,c.`name` as mingcheng from t_chukumingxi a LEFT JOIN t_chuku b on a.chuku_id=b.id left join t_goods c on a.goods_id=c.id";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tchuku chuku=new Tchuku();
				chuku.setId(rs.getInt("id"));
				chuku.setDanjuhao(rs.getString("danjuhao"));
				chuku.setShijian(rs.getString("shijian"));
				chuku.setShuliang(rs.getInt("shuliang"));
				chuku.setJingshouren(rs.getString("jingshouren"));
				chuku.setMingcheng(rs.getString("mingcheng"));
				chukuList.add(chuku);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("chukuList", chukuList);
		req.getRequestDispatcher("admin/chuku/chukuQuery.jsp").forward(req, res);
	}
	public void chukuQuery1(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String goods_id=req.getParameter("goods_id");
		String shijian=req.getParameter("shijian");
		List chukuList=new ArrayList();
		String sql="select a.*,b.danjuhao,b.shijian,b.jingshouren,c.`name` as mingcheng from t_chukumingxi a LEFT JOIN t_chuku b on a.chuku_id=b.id left join t_goods c on a.goods_id=c.id where 1>0";
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
				Tchuku chuku=new Tchuku();
				chuku.setId(rs.getInt("id"));
				chuku.setDanjuhao(rs.getString("danjuhao"));
				chuku.setShijian(rs.getString("shijian"));
				chuku.setShuliang(rs.getInt("shuliang"));
				chuku.setJingshouren(rs.getString("jingshouren"));
				chuku.setMingcheng(rs.getString("mingcheng"));
				chukuList.add(chuku);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("chukuList", chukuList);
		req.getRequestDispatcher("admin/chuku/chukuQuery.jsp").forward(req, res);
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
