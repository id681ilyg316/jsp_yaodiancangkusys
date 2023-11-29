package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;


import com.dao.DB;
import com.orm.TAdmin;
import com.orm.Tcatelog;
import com.orm.Tgoods;
import com.orm.gongyingshang;
import com.orm.Yuangong;

public class loginService
{
	public String login(String userName,String userPw)
	{
		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			e.printStackTrace();
		}
		
	       String result="no";		
           String sql="select * from t_admin where userName=? and userPw=?";
			Object[] params={userName,userPw};
			DB mydb=new DB();
			mydb.doPstm(sql, params);
			try 
			{
				ResultSet rs=mydb.getRs();
				boolean mark=(rs==null||!rs.next()?false:true);
				if(mark==false)
				{
					 result="no";
				}
				else
				{
					 result="yes";
					 TAdmin admin=new TAdmin();
					 admin.setUserId(rs.getInt("userId"));
					 admin.setUserName(rs.getString("userName"));
					 admin.setUserPw(rs.getString("userPw"));
					 WebContext ctx = WebContextFactory.get(); 
					 HttpSession session=ctx.getSession(); 
		             session.setAttribute("admin", admin);
				}
				rs.close();
			} 
			catch (SQLException e)
			{
				System.out.println("µÇÂ¼Ê§°Ü");
				e.printStackTrace();
			}
			finally
			{
				mydb.closed();
			}
			
		return result;
	}

    public String adminPwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		TAdmin admin=(TAdmin)session.getAttribute("admin");
		
		String sql="update t_admin set userPw=? where userId=?";
		Object[] params={userPwNew,admin.getUserId()};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		
		return "yes";
    }
    
    
    public List catelogAll()
    {
    	try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	List catelogList=new ArrayList();
		String sql="select * from t_catelog where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tcatelog catelog=new Tcatelog();
				catelog.setId(rs.getInt("id"));
				catelog.setName(rs.getString("name"));
				catelogList.add(catelog);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return catelogList;
    }
    public List gongyingshangAll()
    {
    	try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	List gongyingshanList=new ArrayList();
		String sql="select * from t_gongyingshang where del='no'";
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
				gongyingshanList.add(gongyingshang);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return gongyingshanList;
    }
    public List yuangongAll()
    {
    	try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
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
				yuangongList.add(yuangong);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return yuangongList;
    }
    public List goodsAll()
    {
    	try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				goods.setId(rs.getInt("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setName(rs.getString("name"));
				goods.setBeizhu(rs.getString("beizhu"));
				goods.setChandi(rs.getString("chandi"));
				goods.setDanwei(rs.getString("danwei"));
				goods.setBaozhiqi(rs.getString("baozhiqi"));
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return goodsList;
    }
    
    
    public List goodsAll1(int catelog_id)
    {
    	try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' and catelog_id="+catelog_id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				goods.setId(rs.getInt("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setName(rs.getString("name"));
				goods.setBeizhu(rs.getString("beizhu"));
				goods.setChandi(rs.getString("chandi"));
				goods.setDanwei(rs.getString("danwei"));
				goods.setBaozhiqi(rs.getString("baozhiqi"));
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return goodsList;
    }
}
