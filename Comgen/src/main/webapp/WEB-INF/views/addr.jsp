<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
행정구역</br>
<label for="cars">시/도</label>
<select id="cars" name="cars" >
<c:forEach items="${city_list}" var="citydtos">
<option value="${citydtos.locno}">${citydtos.city}</option>
</c:forEach>
</select>

</br><label for="cars">구/군</label>
<select id="cars" name="cars" >
<c:forEach items="${gu_list}" var="gudtos">
<option value="${gudtos.gu}">${gudtos.gu}</option>
</c:forEach>
</select>
</br><label for="cars">동</label>
<select id="cars" name="cars" >
<c:forEach items="${dong_list}" var="dongdtos">
<option value="${dongdtos.dong}">${dongdtos.dong}</option>
</c:forEach>
</select>
<button type="button" onclick="">선택</button>
</body>
</html>