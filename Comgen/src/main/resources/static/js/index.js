
  /**
 * 
 */
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.562951, 126.972636), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
		    map: map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
		    drawingMode: [ // drawing manager로 제공할 그리기 요소 모드입니다

		        kakao.maps.drawing.OverlayType.RECTANGLE,
		        kakao.maps.drawing.OverlayType.CIRCLE,
		        kakao.maps.drawing.OverlayType.POLYGON
		    ],
		    // 사용자에게 제공할 그리기 가이드 툴팁입니다
		    // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
		    guideTooltip: ['draw', 'drag', 'edit'], 
		
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
	
	
		// 그리기도형으로부터 정보 추출
		function getDataFromDrawingMap() {
		   
		    var data = manager.getData();
		    console.log(data);
		    
		    
		    //각 도형의 첫번째 정보만 추출
		    //사각형
		    if(data.rectangle[0]!=null) {
		    	var square_ne=(data.rectangle[0].ePoint);
			    var square_nex = (data.rectangle[0].ePoint.x);
			    var snex = (parseFloat(square_nex).toFixed(5));
			    var square_ney = (data.rectangle[0].ePoint.y);
			    var sney = (parseFloat(square_ney).toFixed(4));
			   
			    var square_swx = (data.rectangle[0].sPoint.x);
			    var sswx = (parseFloat(square_swx).toFixed(5));
			    var square_swy = (data.rectangle[0].sPoint.y);
			    var sswy = (parseFloat(square_swy).toFixed(4));
			   
			    console.log("사각형:");
			    console.log(snex);
			    console.log(sney);
			    console.log(sswx);
			    console.log(sswy);
	

			    //도러명 및 구주소정보 
			    var geocoder = new kakao.maps.services.Geocoder();
		    		let addr_arr=[];
		    		let doro_arr=[];
			    	for(i=sswy; i<sney; i=parseFloat(i)+parseFloat(0.001)) {
//			    	console.log(i);
			    		for(j=sswx; j<snex; j=parseFloat(j)+parseFloat(0.001)) {
				    var coord = new kakao.maps.LatLng(i, j);
//				    console.log(j);
				    var callback = function(result, status) {
				        if (status === kakao.maps.services.Status.OK) {
//				            console.log("주소:" + result[0].address.address_name );
				            addr_arr.push(result[0].address.address_name);
				            if(result[0].road_address.address_name != null){
				            doro_arr.push(result[0].road_address.address_name);
//				            console.log(result);
				            }
				        }else {console.log("주소정보가 없어요");}
				    };
			    
				    
			    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback); 
			    		}
			    } 
			    	console.log(addr_arr);
			    	console.log(doro_arr);
			    	

			    	//행정동 정보 행정동 코드 추출
			    	let loc_code=[];
			    	let loc_addr=[];
			     	for(i=sswx; i<snex; i=parseFloat(i)+parseFloat(0.001)) {
			    		for(j=sswy; j<sney; j=parseFloat(j)+parseFloat(0.001)) {
			    	
			    	var geocoder = new kakao.maps.services.Geocoder();
			    	var callback = function(result, status) {
			    	    if (status === kakao.maps.services.Status.OK) {
					    	loc_code.push(result[0].code);
					    	loc_addr.push(result[0].address_name);
//			    	        console.log('지역 명칭 : ' + result[0].address_name);
//			    	        console.log('행정구역 코드 : ' + result[0].code);
			    	    }
			    	};
			   
					    	geocoder.coord2RegionCode(i, j, callback);

					    		}
					    	}
	    			console.log(loc_code);
	    			console.log(loc_addr);
		    }
		    //다각형
	    	if(data.polygon[0]!=null) {
	    		var len = data.polygon[0].points.length;
	    	    console.log("다각형:");
		    		for(i=0; i<len+1; i++) {
		    		let poly=[];
		    		poly[i]=data.polygon[0].points[i];	
		    		console.log(poly[i]);
		    		}
	    	}
	    	//원
	    	if(data.circle[0]!=null) {
	    		var cir_ne = (data.circle[0].ePoint);
	    		var cir_sw = (data.circle[0].sPoint);
	    		var cir_cen = (data.circle[0].center);
	    		var cir_r = (data.circle[0].radius);
	    	    console.log("원:");
	    		console.log(cir_ne);
	    	    console.log(cir_sw);
	    	    console.log(cir_cen);
	    	    console.log(cir_r);
	    	}
			
	    }
		    
		    
		// 주소-좌표 변환 객체를 생성합니다
//		var geocoder = new kakao.maps.services.Geocoder();
//
//		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
//		    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
//
////		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
////		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
//
//		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
//		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
//		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
//		        if (status === kakao.maps.services.Status.OK) {
//		            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
//		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
//		            
//		            var content = '<div class="bAddr">' +
//		                            '<span class="title">법정동 주소정보</span>' + 
//		                            detailAddr + 
//		                        '</div>';
//		           
//		            console.log(mouseEvent.latLng);
//		            //클릭좌표 배열에 담기 append? 두번째 클릭값부터 안들어감
//		            var arr=[];
//		            arr.push(mouseEvent.latLng);
//		            console.log(arr);
//		            // 마커를 클릭한 위치에 표시합니다 
//		            marker.setPosition(mouseEvent.latLng);
//		            marker.setMap(map);
//
//		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
//		            infowindow.setContent(content);
//		            infowindow.open(map, marker);
//		        }   
//		    });
//		});
//
//		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
////		kakao.maps.event.addListener(map, 'idle', function() {
////		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
////		});
//
//		function searchAddrFromCoords(coords, callback) {
//		    // 좌표로 행정동 주소 정보를 요청합니다
//		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
//		}
//
//		function searchDetailAddrFromCoords(coords, callback) {
//		    // 좌표로 법정동 상세 주소 정보를 요청합니다
//		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
//		}
//
////		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
////		function displayCenterInfo(result, status) {
////		    if (status === kakao.maps.services.Status.OK) {
////		        var infoDiv = document.getElementById('centerAddr');
////
////		        for(var i = 0; i < result.length; i++) {
////		            // 행정동의 region_type 값은 'H' 이므로
////		            if (result[i].region_type === 'H') {
////		                infoDiv.innerHTML = result[i].address_name;
////		                break;
////		            }
////		        }
////		    }    
////		}