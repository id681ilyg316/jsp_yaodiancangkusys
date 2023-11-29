package com.orm;

public class Yuangong
{
	private int id;

	private String name;

	private String sex;

	private String age;

	private String tel;

	private String address;

	private String zhiwei;

	private int quanxian;//0没有权限,1仓库管理员

	private String loginName;

	private String loginPw;

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}


	public String getAge()
	{
		return age;
	}

	public void setAge(String age)
	{
		this.age = age;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getLoginName()
	{
		return loginName;
	}

	public void setLoginName(String loginName)
	{
		this.loginName = loginName;
	}

	public String getLoginPw()
	{
		return loginPw;
	}

	public void setLoginPw(String loginPw)
	{
		this.loginPw = loginPw;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public int getQuanxian()
	{
		return quanxian;
	}

	public void setQuanxian(int quanxian)
	{
		this.quanxian = quanxian;
	}

	public String getSex()
	{
		return sex;
	}

	public void setSex(String sex)
	{
		this.sex = sex;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getZhiwei()
	{
		return zhiwei;
	}

	public void setZhiwei(String zhiwei)
	{
		this.zhiwei = zhiwei;
	}

}
