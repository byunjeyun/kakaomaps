<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/input.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/option.js"></script>
<title>Insert title here</title>


<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css?after">

</head>
<body>

	<%@ include file="include/header.jsp" %>

	<center>	
	
	<form action="inputOk" method="get" name="reg_frm">
	<table width="100%" color="#999" cellpadding="0" cellspacing="0" border="1" style="border-color:#eee"  >
	<tr bgcolor="#555"  align="center" height="30" style="color:#ccc">
		
		<td>사업장</td>
		<td>업무구분</td>
		<td>요청인</td>
		<td>요청일</td>
		<td>요청내역</td>
		<td>담당자</td>
		<td>처리결과</td>
		<td>처리완료일</td>
		<td>비고</td>		
	</tr>

	<tr height="30">
		<td align="center">
		<select id="factnm" name="factnm" value="${rdto.factnm}">
		  <option value="">--선택--</option>
			<c:forEach items="${nfact_list}" var="ndto">
				<option value="${ndto.factnm}">${ndto.factnm}</option>
			</c:forEach>				
		</select>
		</td>	
		<td align="center"> <input type="text" name="requestgr"></td>
		<td align="center"> <input type="text" name="requesternm"></td>
		<td align="center"> <input type="date" name="requestdate"></td>
		<td align="center"> <textarea id="textarea01" rows="5" cols="24" name="requestcomment"></textarea></td>
		<td align="center"> <input type="text" name="managernm"></td>
		<td align="center"> <textarea id="textarea01" rows="5" cols="24" name="resultstat"></textarea></td>
		<td align="center"> <input type="date" name="enddate"></td>
		<td align="center"> <input type="text" name="note"></td>
	</tr>		
	</table>	
	<table>
		<tr>
			<td> <input class="button00" type="button" value="목록" onclick="location.href='index'"> </td>
			<td> <input class="button01" type="button" value="완료" onclick="inputCheck()"> </td>
			<td> <input class="button01" type="reset" value="취소"> </td>
		</tr>	
		
	</table>
	</form>
</center>


</body>
</html>