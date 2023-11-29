package com.service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.DB;
import com.orm.Tcatelog;

public class liuService
{
	public static String getCatelogName(int id)
	{
		String catelog_name="";
		
		String sql="select * from t_catelog where id="+id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			catelog_name=rs.getString("name");
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return catelog_name;
	}
	public static String getGoodsName(int id)
	{
		String name="";
		
		String sql="select * from t_goods where id="+id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			name=rs.getString("name");
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return name;
	}
	
	public static List getAllGoods_id()
	{
	    List<Integer> goods_id_List=new ArrayList<Integer>();
	    String sql="select id from t_goods where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				goods_id_List.add(rs.getInt("id"));
		    }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return goods_id_List;
	}
	
	
	public static int getGoodsRukuShuliang(int goods_id)
	{
	    int shuliang=0;
	    String sql="select sum(shuliang)  from t_rukuMingxi where goods_id="+goods_id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			shuliang=rs.getInt(1);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return shuliang;
	}

	
	public static int getGoodsChukuShuliang(int goods_id)
	{
	    int shuliang=0;
	    String sql="select sum(shuliang)  from t_chukuMingxi where goods_id="+goods_id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			shuliang=rs.getInt(1);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return shuliang;
	}
}
