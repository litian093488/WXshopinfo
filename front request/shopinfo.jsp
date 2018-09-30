
<%@ page import="java.util.ArrayList"%>
<%@ page import="javastudy1.* "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="Jslib/jquery-1.11.3.js"></script>
<title>信息主页</title>
<style type="text/css">
table.bookinfo {
    font-family: verdana,arial,sans-serif;
    font-size:13px;
    color:#333333;
    border-width: 1px;
    border-color: #666666;
    border-collapse: collapse;
}
table.bookinfo th {
    border-width: 1px;
    padding: 8px;
    border-style: solid;
    border-color: #666666;
    background-color: #dedede;
}
table.bookinfo td {
    border-width: 1px;
    padding: 8px;
    border-style: solid;
    border-color: #666666;
    background-color: #ffffff;
}
.tr1
{
    font-size:15px;
}
</style>
<script type="text/javascript">
$(function(){
	//创建全选框
	$("input[type='checkbox'][name='selectit']:first").click(function(){
		$("input[type='checkbox'][name='selectit']").not(":first").prop("checked",$(this).prop("checked"));	
	});
	//创建点击修改按钮后的操作;
	$("input[type='button'][name='modifyit']").click(function(){
		var id= //拿到的id是hidden的id；
		$(this).parent().parent().children().eq(0).children().eq(0).val();
		//携带隐藏id跳转到modify.jsp页面，
		location.href="modify.jsp?id="+id;
	});
	//创建删除操作;
	$("#btnDelete").click(function(){
		//收集所选中的图书的id信息;
		var ids="";//收集图书的总共本数;
		var i=0;//初始化i，用来显示选中那本书;
		$("input[type='checkbox'][name='selectit']").each(function(index, element) {
            if(index>0)
			{
				if($(this).prop("checked"))
				{
					var id=
					$(this).parent().parent().children().eq(0)
					.children().eq(0).val();
					ids+=id;
					i++;
					if(!$(this).is("last"))
					{
						ids+=",";
					}
				}
			}
        });
		if(ids==0)//判断是否勾选书本?
		{
			alert("请勾选需要删除的书本！");
			return;
		}
		var ask=confirm("确定删除这"+i+"本书吗？");
		if(!ask)
		{
			return;
		}
		location.href="Deleteit?ids="+ids;
	});
	/*添加信息
	$("#btnAdd").click(function(){
		location.href="addBook.jsp";
	});
	*/
	//查找图书
	$("#search").click(function(){
		var name=$("#searchIt").val();
		alert("还没完成");
		location.href="BookList.jsp";
	});
	
});
</script>
</head>
<body>
<table class="bookinfo">
<tr><!-- <input type="text" id="searchIt" /><input type="button" id="search" value="查找图书"/> --></tr>
<tr class="tr1">
<th>序号</th><th>店名</th><th>清真?</th><th>特色</th><th>M_省</th><th>M_市</th><th>M_地址</th>
<th>M_联系方式</th><th>M_介绍</th><th>M_支付宝账号</th><th>A_地址</th>
<th>A_经度</th><th>A_纬度</th><th>A_地址名</th>

<th> <input type="checkbox" name="selectit"></th></tr>
<%
	String name = request.getParameter("name");
	BookDAO dao=new BookDAO();
	ArrayList<Book> list=dao.getBooks(name);
	for(int i=0;i<list.size();i++)
	{
		Book book=list.get(i);	
%>

<tr><td align="center">
<%=i+1%><!-- <input type="hidden" name="id" value="<%=book.getId() %>"/> --></td>
<td><%=book.getShopname() %></td>
<td><%=book.getQzpd() %></td>
<td><%=book.getTastegood() %></td>
<td><%=book.getProvence() %></td>
<td><%=book.getCity() %></td>
<td><%=book.getAddress() %></td>
<td><%=book.getContact() %></td>
<td><%=book.getIntroduce() %></td>
<td><%=book.getAlipay() %></td>
<td><%=book.getOk_address() %></td>
<td><%=book.getLongitude() %></td>
<td><%=book.getLatitude() %></td>
<td><%=book.getGeneral_addr() %></td>
<!--<td> <input type="button" name="modifyit" value="修改"/></td>--> <td><input type="checkbox" name="selectit"/></td></tr>
<%
	}
%>
</table>
<br>
<!-- <input type="button" id="btnAdd" value="添加图书">
 <input type="button" id="btnDelete" value="删除图书"> -->

</body>
</html>
