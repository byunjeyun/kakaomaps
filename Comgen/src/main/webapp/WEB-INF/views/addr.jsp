<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/button.css?after">
</head>
<body>
<h5>행정구역</br></h5>
<form action="select">
<label for="city">시/도</label>
<select id="city" name="city" value="">
<c:forEach items="${city_list}" var="citydtos">
<option value="${citydtos.locno}">${citydtos.city}</option>
</c:forEach>
</select>

<c:if test="${citydtos.locno == null}">
<label for="gu">&nbsp;&nbsp;&nbsp;&nbsp;구/군</label>
<select id="gu" name="gu">
<c:forEach items="${gu_list}" var="gudtos">
<option value="${gudtos.gu}">${gudtos.gu}</option>
</c:forEach>
</select>
</c:if>

<c:if test="${citydtos.locno == null}">
</br></br><label for="dong">동</label>
<select id="dong" name="dong" >
<c:forEach items="${dong_list}" var="dongdtos">
<option value="${dongdtos.dong}">${dongdtos.dong}</option>
</c:forEach>
</select>
</c:if>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button class="button01" style="background-color:green; color:#fff;" "type="button" onclick="">선택완료</button>
</body>
</html>