<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form id="form2" action="javascript:getPassword()">
		<table>
			<tr>
				<td><span>������ȣ</span></td>
				<td><input type="text" name="code" id="code"
					 onkeyup="checkCode()" placeholder="������ȣ�� �Է��ϼ���" />
					 
				<div id="checkCode"></div></td>
				<td><input type="hidden" readonly="readonly" name="code_check"
				     id="code_check" value="<%=request.getAttribute("code") %>" /></td>
			</tr>
		</table>
		<input id="hi" type="hidden" value="�����ϱ�" />
	</form>
</body>
</html>