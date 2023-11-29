package com.orm;

public class Tgoods
{
	private int id;
	private int catelog_id;
	private String name;
	private String chandi;
	private String danwei;
	private String baozhiqi;
	private String beizhu;
	private String del;
	private String catelog_name;
	public String getBeizhu()
	{
		return beizhu;
	}
	public void setBeizhu(String beizhu)
	{
		this.beizhu = beizhu;
	}
	public String getChandi()
	{
		return chandi;
	}
	public void setChandi(String chandi)
	{
		this.chandi = chandi;
	}
	public String getDanwei()
	{
		return danwei;
	}
	public void setDanwei(String danwei)
	{
		this.danwei = danwei;
	}
	public String getBaozhiqi()
	{
		return baozhiqi;
	}
	public void setBaozhiqi(String baozhiqi)
	{
		this.baozhiqi = baozhiqi;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	
	public String getCatelog_name()
	{
		return catelog_name;
	}
	public void setCatelog_name(String catelog_name)
	{
		this.catelog_name = catelog_name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getDel()
	{
		return del;
	}
	
	public int getCatelog_id()
	{
		return catelog_id;
	}
	public void setCatelog_id(int catelog_id)
	{
		this.catelog_id = catelog_id;
	}
	public void setDel(String del)
	{
		this.del = del;
	}
	
}
