package com.legendman.dblib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.legendman.entity.entity;

public class DBLib {
	//初始化数据库;
	Connection conn;
	Statement st;
	PreparedStatement ps;
	public DBLib() throws SQLException, ClassNotFoundException
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url=("jdbc:mysql://39.106.199.37:3306/shopinfo");
		String user="root";
		String password="Li1113456";
		conn=DriverManager.getConnection(url,user,password);
		st=conn.createStatement();
	}
	//添加数据;
	public void addData(entity info) throws SQLException, IOException
	{
//		String a=info.getShopname();
//		System.out.println("-2-"+a);
		
		String sql="use shopinfo;";
		
//		st.executeUpdate(sql);
		sql="insert into shopinfo (shopname,qzpd,tastegood,provence,city,address,contact,introduce,"
				+ "		alipay,ok_address,longitude,latitude,general_addr) values(?,?,?,?,?,?,?,?,?,?,?,?,?);";
		ps=conn.prepareStatement(sql);
		ps.setString(1, info.getShopname());
		ps.setString(2, info.getQzpd());
		ps.setString(3, info.getTastegood());
		ps.setString(4, info.getProvence());
		ps.setString(5, info.getCity());
		ps.setString(6, info.getAddress());
		ps.setString(7, info.getContact());
		ps.setString(8, info.getIntroduce());
		ps.setString(9, info.getAlipay());
		ps.setString(10, info.getOk_address());
		ps.setString(11, info.getLongitude());
		ps.setString(12, info.getLatitude());
		ps.setString(13, info.getGeneral_addr());
		ps.execute();
		
		
	}
}
