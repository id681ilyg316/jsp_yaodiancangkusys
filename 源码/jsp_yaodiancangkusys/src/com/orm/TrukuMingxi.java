package com.orm;

public class TrukuMingxi
{
	private int id;
	private int ruku_id;
	private int goods_id;
	private int shuliang;
	private String beizhu;
	
	private String goods_name;

	public String getBeizhu()
	{
		return beizhu;
	}

	public void setBeizhu(String beizhu)
	{
		this.beizhu = beizhu;
	}

	public int getGoods_id()
	{
		return goods_id;
	}

	public void setGoods_id(int goods_id)
	{
		this.goods_id = goods_id;
	}

	public String getGoods_name()
	{
		return goods_name;
	}

	public int getRuku_id()
	{
		return ruku_id;
	}

	public void setRuku_id(int ruku_id)
	{
		this.ruku_id = ruku_id;
	}

	public void setGoods_name(String goods_name)
	{
		this.goods_name = goods_name;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getShuliang()
	{
		return shuliang;
	}

	public void setShuliang(int shuliang)
	{
		this.shuliang = shuliang;
	}
	
}
