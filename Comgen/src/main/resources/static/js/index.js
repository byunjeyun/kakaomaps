
  /**
 * 
 */
 
 var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.562951, 126.972636), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
//		    var latlng = mouseEvent.latLng;
//		    var message = '위도' + latlng.getLat() + '///';
//		    message += '경도' + latlng.getLng();
//		    
//		    var resultDiv = document.getElementById('result'); 
//		    resultDiv.innerHTML = message;
		    console.log(latlng);
		  
    function getValueInoption(){
    	let inputData = document.getElementById("shape").value;
    }

	if(inputData==1) {
	
		var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
		var centerPosition; // 원의 중심좌표 입니다
		var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
		var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
		var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
		var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

		var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다

		// 지도에 클릭 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		        
		    // 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
		    if (!drawingFlag) {    
		        
		        // 상태를 그리고있는 상태로 변경합니다
		        drawingFlag = true; 
		        
		        // 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
		        centerPosition = mouseEvent.latLng; 

		        // 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
		        if (!drawingLine) {
		            drawingLine = new kakao.maps.Polyline({
		                strokeWeight: 3, // 선의 두께입니다
		                strokeColor: '#00a0e9', // 선의 색깔입니다
		                strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		                strokeStyle: 'solid' // 선의 스타일입니다
		            });    
		        }
		        
		        // 그려지고 있는 원을 표시할 원 객체를 생성합니다
		        if (!drawingCircle) {                    
		            drawingCircle = new kakao.maps.Circle({ 
		                strokeWeight: 1, // 선의 두께입니다
		                strokeColor: '#00a0e9', // 선의 색깔입니다
		                strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		                strokeStyle: 'solid', // 선의 스타일입니다
		                fillColor: '#00a0e9', // 채우기 색깔입니다
		                fillOpacity: 0.2 // 채우기 불투명도입니다 
		            });     
		        }
		        
		        // 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
		        if (!drawingOverlay) {
		            drawingOverlay = new kakao.maps.CustomOverlay({
		                xAnchor: 0,
		                yAnchor: 0,
		                zIndex: 1
		            });              
		        }
		    }
		    });

		// 지도에 마우스무브 이벤트를 등록합니다
		// 원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
		kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
		        
		    // 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
		    if (drawingFlag) {

		        // 마우스 커서의 현재 위치를 얻어옵니다 
		        var mousePosition = mouseEvent.latLng; 
		        
		        // 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
		        var linePath = [centerPosition, mousePosition];     
		        
		        // 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
		        drawingLine.setPath(linePath);
		        
		        // 원의 반지름을 선 객체를 이용해서 얻어옵니다 
		        var length = drawingLine.getLength();
		        
		        if(length > 0) {
		            
		            // 그려지고 있는 원의 중심좌표와 반지름입니다
		            var circleOptions = { 
		                center : centerPosition, 
		            radius: length,                 
		            };
		            
		            // 그려지고 있는 원의 옵션을 설정합니다
		            drawingCircle.setOptions(circleOptions); 
		                
		            // 반경 정보를 표시할 커스텀오버레이의 내용입니다
		            var radius = Math.round(drawingCircle.getRadius()),   
		            content = '<div class="info">반경 <span class="number">' + radius + '</span>m</div>';
		            
		            // 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
		            drawingOverlay.setPosition(mousePosition);
		            
		            // 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
		            drawingOverlay.setContent(content);
		            
		            // 그려지고 있는 원을 지도에 표시합니다
		            drawingCircle.setMap(map); 
		            
		            // 그려지고 있는 선을 지도에 표시합니다
		            drawingLine.setMap(map);  
		            
		            // 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
		            drawingOverlay.setMap(map);
		            
		        } else { 
		            
		            drawingCircle.setMap(null);
		            drawingLine.setMap(null);    
		            drawingOverlay.setMap(null);
		            
		        }
		    }     
		});     

		// 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
		// 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
		// 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
		kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

		    if (drawingFlag) {

		        // 마우스로 오른쪽 클릭한 위치입니다 
		        var rClickPosition = mouseEvent.latLng; 

		        // 원의 반경을 표시할 선 객체를 생성합니다
		        var polyline = new kakao.maps.Polyline({
		            path: [centerPosition, rClickPosition], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
		            strokeWeight: 3, // 선의 두께 입니다
		            strokeColor: '#00a0e9', // 선의 색깔입니다
		            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid' // 선의 스타일입니다
		        });
		        
		        // 원 객체를 생성합니다
		        var circle = new kakao.maps.Circle({ 
		            center : centerPosition, // 원의 중심좌표입니다
		            radius: polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
		            strokeWeight: 1, // 선의 두께입니다
		            strokeColor: '#00a0e9', // 선의 색깔입니다
		            strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid', // 선의 스타일입니다
		            fillColor: '#00a0e9', // 채우기 색깔입니다
		            fillOpacity: 0.2  // 채우기 불투명도입니다 
		        });
		        
		        var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
		            content = getTimeHTML(radius); // 커스텀 오버레이에 표시할 반경 정보입니다

		        
		        // 반경정보를 표시할 커스텀 오버레이를 생성합니다
		        var radiusOverlay = new kakao.maps.CustomOverlay({
		            content: content, // 표시할 내용입니다
		            position: rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
		            xAnchor: 0,
		            yAnchor: 0,
		            zIndex: 1 
		        });  

		        // 원을 지도에 표시합니다
		        circle.setMap(map); 
		        
		        // 선을 지도에 표시합니다
		        polyline.setMap(map);
		        
		        // 반경 정보 커스텀 오버레이를 지도에 표시합니다
		        radiusOverlay.setMap(map);
		        
		        // 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
		        var radiusObj = {
		            'polyline' : polyline,
		            'circle' : circle,
		            'overlay' : radiusOverlay
		        };
		        
		        // 배열에 추가합니다
		        // 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
		        circles.push(radiusObj);   
		    
		        // 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
		        drawingFlag = false;
		        
		        // 중심 좌표를 초기화 합니다  
		        centerPosition = null;
		        
		        // 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
		        drawingCircle.setMap(null);
		        drawingLine.setMap(null);   
		        drawingOverlay.setMap(null);
		    }
		    
		});    
		    
		// 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
		function removeCircles() {         
		    for (var i = 0; i < circles.length; i++) {
		        circles[i].circle.setMap(null);    
		        circles[i].polyline.setMap(null);
		        circles[i].overlay.setMap(null);
		    }         
		    circles = [];
		}		
		
		function getTimeHTML(distance) {

		    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
		    var walkkTime = distance / 67 | 0;
		    var walkHour = '', walkMin = '';

		    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
		    if (walkkTime > 60) {
		        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
		    }
		    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

		    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
		    var bycicleTime = distance / 227 | 0;
		    var bycicleHour = '', bycicleMin = '';

		    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
		    if (bycicleTime > 60) {
		        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
		    }
		    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

		    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
		    var content = '<ul class="info">';
		    content += '    <li>';
		    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
		    content += '    </li>';
		    content += '    <li>';
		    content += '        <span class="label">도보</span>' + walkHour + walkMin;
		    content += '    </li>';
		    content += '    <li>';
		    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
		    content += '    </li>';
		    content += '</ul>'

			
		    return content;
		  
		}
	
//	// 지도에 표시할 원을 생성합니다
//	var circle = new kakao.maps.Circle({
//	    center : new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()),  // 원의 중심좌표 입니다 
//	    radius: 100, // 미터 단위의 원의 반지름입니다 
//	    strokeWeight: 5, // 선의 두께입니다 
//	    strokeColor: '#75B8FA', // 선의 색깔입니다
//	    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
//	    strokeStyle: 'dashed', // 선의 스타일 입니다
//	    fillColor: '#CFE7FF', // 채우기 색깔입니다
//	    fillOpacity: 0.7  // 채우기 불투명도 입니다   
//	}); 
//
//	// 지도에 원을 표시합니다 
//	circle.setMap(map); 
	}else if(inputData==2) { 
	 
	var linePath = [
	                new kakao.maps.LatLng(33.452344169439975, 126.56878163224233),
	                new kakao.maps.LatLng(33.452739313807456, 126.5709308145358),
	                new kakao.maps.LatLng(33.45178067090639, 126.5726886938753) 
	            ];

	            // 지도에 표시할 선을 생성합니다
	            var polyline = new kakao.maps.Polyline({
	                path: linePath, // 선을 구성하는 좌표배열 입니다
	                strokeWeight: 5, // 선의 두께 입니다
	                strokeColor: '#FFAE00', // 선의 색깔입니다
	                strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	                strokeStyle: 'solid' // 선의 스타일입니다
	            });

	            // 지도에 선을 표시합니다 
	            polyline.setMap(map);  
	            drawingFlag = true;
	            
	            var sw = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()), // 사각형 영역의 남서쪽 좌표
	                ne = new kakao.maps.LatLng(latlng.getLat()-0.005, latlng.getLng()-0.005); // 사각형 영역의 북동쪽 좌표
	            
	            // 사각형을 구성하는 영역정보를 생성합니다
	            // 사각형을 생성할 때 영역정보는 LatLngBounds 객체로 넘겨줘야 합니다
	            
	            
	            
	            var rectangleBounds = new kakao.maps.LatLngBounds(sw, ne);
	            
	            // 지도에 표시할 사각형을 생성합니다
	            var rectangle = new kakao.maps.Rectangle({
	                bounds: rectangleBounds, // 그려질 사각형의 영역정보입니다
	                strokeWeight: 4, // 선의 두께입니다
	                strokeColor: '#FF3DE5', // 선의 색깔입니다
	                strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	                strokeStyle: 'shortdashdot', // 선의 스타일입니다
	                fillColor: '#FF8AEF', // 채우기 색깔입니다
	                fillOpacity: 0.8 // 채우기 불투명도 입니다
	            });

	            // 지도에 사각형을 표시합니다
	            rectangle.setMap(map);
	            }else if(inputData==3) {
	            
	            // 다각형을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 다각형을 표시합니다
	            var polygonPath = [
	                new kakao.maps.LatLng(33.45133510810506, 126.57159381623066),
	                new kakao.maps.LatLng(33.44955812811862, 126.5713551811832),
	                new kakao.maps.LatLng(33.449986291544086, 126.57263296172184),
	                new kakao.maps.LatLng(33.450682513554554, 126.57321034054742),
	                new kakao.maps.LatLng(33.451346760004206, 126.57235740081413) 
	            ];

	            // 지도에 표시할 다각형을 생성합니다
	            var polygon = new kakao.maps.Polygon({
	                path:polygonPath, // 그려질 다각형의 좌표 배열입니다
	                strokeWeight: 3, // 선의 두께입니다
	                strokeColor: '#39DE2A', // 선의 색깔입니다
	                strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	                strokeStyle: 'longdash', // 선의 스타일입니다
	                fillColor: '#A2FF99', // 채우기 색깔입니다
	                fillOpacity: 0.7 // 채우기 불투명도 입니다
	            });

	            // 지도에 다각형을 표시합니다
	            polygon.setMap(map);
	
	            }
		});
