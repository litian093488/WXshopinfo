package javastudy1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

//import javastudy3.Book;

public class BookDAO {
	//连接数据库;
	String sql;
	Connection conn;
	Statement st;
	PreparedStatement ps;
	public BookDAO() throws SQLException, ClassNotFoundException
	{
		Class.forName("com.mysql.jdbc.Driver");//加载驱动
		String uname="x";
		String pwd="x";
		String url="jdbc:mysql://x.x.x.x:3306/x";
		conn=DriverManager.getConnection(url,uname,pwd);//根据地址用户名密码链接数据库;
		st=conn.createStatement();
//		sql="use book";
//		st.executeUpdate(sql);
	}
	//根据数据库书本的信息，提出出来并展示在BookList.jsp页面上面;
	public ArrayList<Book> getBooks(String name) throws SQLException
	{
		ArrayList<Book> al=new ArrayList<>();//实例化ArrayList对象,并通过sql语句的执行对其进行赋值;
		sql="select * from x";
//		ResultSet rs=st.executeQuery(sql);//执行sql语句;将得到的结果集放在rs之中;配合24行；
		//24和31行也可以成32-33行；
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{
			Book book=new Book();//实例化Book并赋值；
			book.setId(rs.getInt(1));
			book.setShopname(rs.getString(2));
			book.setQzpd(rs.getString(3));
			book.setTastegood(rs.getString(4));
			book.setProvence(rs.getString(5));
			book.setCity(rs.getString(6));
			book.setAddress(rs.getString(7));
			book.setContact(rs.getString(8));
			book.setIntroduce(rs.getString(9));
			book.setAlipay(rs.getString(10));
			book.setOk_address(rs.getString(11));
			book.setLongitude(rs.getString(12));
			book.setLatitude(rs.getString(13));
			book.setGeneral_addr(rs.getString(14));
			al.add(book);//向集合中添加对象;
		}
		return al;
	}
}
