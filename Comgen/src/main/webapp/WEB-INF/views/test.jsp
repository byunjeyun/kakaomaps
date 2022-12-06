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




<h4>건물유형 지정</h4>

<div>
  <input type="checkbox" id="scales" name="scales" checked>
  <label for="scales">66㎡ 미만</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">66㎡ 대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">99㎡ 대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">132㎡ 이상</label>
</div>

<legend>전용면적 지정</legend>
<div>
  <input type="checkbox" id="scales" name="scales" checked>
  <label for="scales">아파트</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">빌라/다세대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">오피스텔</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">단독</label>
</div>

<legend>주택가격 지정</legend>
<div>
  <input type="checkbox" id="scales" name="scales" checked>
  <label for="scales">1억원 미만</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">1~2억원 대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">3~5억원 대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">5억원 이상</label>
</div>


건축연도 지정<br>
<input type="number" min="1900" max="2099" step="1" value="2016" />
~
<input type="number" min="1900" max="2099" step="1" value="2016" />

<legend>소유주 지정</legend>
<div>
  <input type="checkbox" id="scales" name="scales" checked>
  <label for="scales">전체</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">자가</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">임대</label>
</div>

<hr>
<h4>통계청DB 조건 선택</h4>
<legend>성별</legend>
<div>
  <input type="checkbox" id="scales" name="scales" checked>
  <label for="scales">남자</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">여자</label>
</div>

<legend>연령</legend>
<div>
  <input type="checkbox" id="scales" name="scales" checked>
  <label for="scales"20대 이하</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">20대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">30대</label>
  <input type="checkbox" id="scales" name="scales" checked>
  <label for="scales">40대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">50대</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">60대 이상</label>

</div>



<legend>유형선택</legend>
<div>
  <input type="checkbox" id="scales" name="scales" checked>
  <label for="scales">주택</label>
  <input type="checkbox" id="horns" name="horns">
  <label for="horns">기업체</label>
  <input type="checkbox" id="horns" name="horns">
</div>



</body>
</html>