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
				<td><span>인증번호</span></td>
				<td><input type="text" name="code" id="code"
					 onkeyup="checkCode()" placeholder="인증번호를 입력하세요" />
					 
				<div id="checkCode"></div></td>
				<td><input type="hidden" readonly="readonly" name="code_check"
				     id="code_check" value="<%=request.getAttribute("code") %>" /></td>
			</tr>
		</table>
		<input id="hi" type="hidden" value="인증하기" />
	</form>
</body>
</html>