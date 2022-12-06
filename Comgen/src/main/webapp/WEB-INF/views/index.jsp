<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/button.css?after">
</head>

<body>

<div style="float:left; width:330px;">
<h3 bgcolor="">DB주소 검색</br></h3>

<h4>영역선택</br></h4>

<label for="cars">도형선택</label>
<!--<select id="shape" name="shape" >
<option value="1">원반경</option>
<option value="2">사각형</option>
<option value="3">다각형</option>
</select>--!>

<p class="getdata">
<button onclick="selectOverlay('MARKER')">마커</button>
<button onclick="selectOverlay('CIRCLE')">원</button>
<button onclick="selectOverlay('RECTANGLE')">사각형</button>
<button onclick="selectOverlay('POLYGON')">다각형</button>
<button class="button01" onclick="getDataFromDrawingMap()">선택완료</button>
</p>

<table>
<tr>
<td><iframe height="150px" src=/addr></iframe>
</td>
</tr>

<tr>
<td> 
</td>

</tr>
<tr>
<td><iframe height="550px" src=/test></iframe>
</td>
</tr>
</table>

 
</div>

<div id="map" style="width:1500px;height:950px;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be246cb585128818296aac80f596f18c&libraries=services,drawing"></script>
	
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.562951, 126.972636), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
		    map: map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
		    drawingMode: [ // drawing manager로 제공할 그리기 요소 모드입니다
		        kakao.maps.drawing.OverlayType.MARKER,
		        kakao.maps.drawing.OverlayType.POLYLINE,
		        kakao.maps.drawing.OverlayType.RECTANGLE,
		        kakao.maps.drawing.OverlayType.CIRCLE,
		        kakao.maps.drawing.OverlayType.POLYGON
		    ],
		    // 사용자에게 제공할 그리기 가이드 툴팁입니다
		    // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
		    guideTooltip: ['draw', 'drag', 'edit'], 
		    markerOptions: { // 마커 옵션입니다 
		        draggable: true, // 마커를 그리고 나서 드래그 가능하게 합니다 
		        removable: true // 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다  
		    },
	
		    rectangleOptions: {
		        draggable: true,
		        removable: true,
		        editable: true,
		        strokeColor: '#39f', // 외곽선 색
		        fillColor: '#3f9', // 채우기 색
		        fillOpacity: 0.3 // 채우기색 투명도
		    },
		    circleOptions: {
		        draggable: true,
		        removable: true,
		        editable: true,
		        strokeColor: '#39f',
		        fillColor: '#f39',
		        fillOpacity: 0.3
		    },
		    polygonOptions: {
		        draggable: true,
		        removable: true,
		        editable: true,
		        strokeColor: '#39f',
		        fillColor: '#39f',
		        fillOpacity: 0.3,
		        hintStrokeStyle: 'dash',
		        hintStrokeOpacity: 0.5
		    }
		};

		// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
		var manager = new kakao.maps.drawing.DrawingManager(options);

		// 버튼 클릭 시 호출되는 핸들러 입니다
		function selectOverlay(type) {
		    // 그리기 중이면 그리기를 취소합니다
		    manager.cancel();

		    // 클릭한 그리기 요소 타입을 선택합니다
		    manager.select(kakao.maps.drawing.OverlayType[type]);
		}
	
	
		function getDataFromDrawingMap() {
		    // Drawing Manager에서 그려진 데이터 정보를 가져옵니다 
		    var data = manager.getData();
		    console.log(data);
		    var ne = (data.rectangle[0].ePoint);
		    var sw = (data.rectangle[0].sPoint);
		    console.log(ne);
		    console.log(sw);
		}		    


		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

//		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
//		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">법정동 주소정보</span>' + 
		                            detailAddr + 
		                        '</div>';
		           
		            console.log(mouseEvent.latLng);
		            //클릭좌표 배열에 담기 append? 두번째 클릭값부터 안들어감
		            var arr=[mouseEvent.latLng];
		            arr.push(mouseEvent.latLng);
		            console.log(arr);
		            // 마커를 클릭한 위치에 표시합니다 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);

		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		        }   
		    });
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
//		kakao.maps.event.addListener(map, 'idle', function() {
//		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
//		});

		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}

		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

//		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
//		function displayCenterInfo(result, status) {
//		    if (status === kakao.maps.services.Status.OK) {
//		        var infoDiv = document.getElementById('centerAddr');
//
//		        for(var i = 0; i < result.length; i++) {
//		            // 행정동의 region_type 값은 'H' 이므로
//		            if (result[i].region_type === 'H') {
//		                infoDiv.innerHTML = result[i].address_name;
//		                break;
//		            }
//		        }
//		    }    
//		}
	
	</script>
	</body>
	</html>