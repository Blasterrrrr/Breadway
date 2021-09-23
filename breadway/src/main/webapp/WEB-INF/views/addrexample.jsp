<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>주소로 장소 표시하기</title>
     <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
	</style>
</head>
<body>
	<div id="map" style="width:100%;height:350px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5acc7ee5ef93f6db9b99b45f7fd217dd&libraries=services"></script>
	
	<script type="text/javascript">
		var inputData = ['${theatre.theatre_Name}']
		//지도의 중심좌표
		var mapContainer = document.getElementById('map'),
			mapOption = {
				center: new kakao.maps.LatLng(37.54699, 127.09598),
				level: 3 //확대레벨
				};
		//지도 생성
		var map = new kakao.maps.Map(mapContainer, mapOption);
		var count = 0;
		var ps = new kakao.maps.services.Places();
		var bounds = new kakao.maps.LatLngBounds();
		if (inputData != null) {
			kewwordSearch(inputData[count]);
			}
		
		function kewwordSearch(keword) {
			ps.keywordSearch(keword, placesSearchCB);
			count = count + 1;
			}
		
		function placesSearchCB(data, status, pagination) {
				if (status === kakao.maps.services.Status.OK) {
						displayMarker(data[0]);
						bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
				if (count < inputData.length) {
					kewwordSearch(inputData[count]);
				} else if (count == inputData.length) {
					setBounds();
				}
			}
		}
		//지도에 마커를 표시
		function displayMarker(place) {
			var marker = new kakao.maps.Marker({
			map: map,
			position: new kakao.maps.LatLng(place.y, place.x),
		});
			// 커스텀 오버레이에 표시할 컨텐츠 입니다
			// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			// 별도의 이벤트 메소드를 제공하지 않습니다 
			var content = '<div class="wrap">' + 
			            '    <div class="info">' + 
			            '        <div class="title">' + 
			            '           ${theatre.theatre_Name}' + 
			            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			            '        </div>' + 
			            '        <div class="body">' + 
			            '            <div class="img">' +
			            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			            '           </div>' + 
			            '            <div class="desc">' + 
			            '                <div class="ellipsis">${theatre.theatre_Address}</div>' + 
			            '					<div><a href="${theatre.theatre_webAddr}" target="_blank" class="link">홈페이지</a></div>'+
			          /*   '                <div class="jibun ellipsis">(우) 08209 (지번) 신도림동 692</div>' + 
			            '                +  */
			            '            </div>' + 
			            '        </div>' + 
			            '    </div>' +    
			            '</div>';

			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
			    content: content,
			    map: map,
			    position: marker.getPosition()       
			});

			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				var position = this.getPosition();
				var url = 'https://map.kakao.com/link/map/' + place.id;
				window.open(url, '_blank');
			    overlay.setMap(map);
			});

			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			function closeOverlay() {
			    overlay.setMap(null);     
			}	
		}
	function setBounds() {
	map.setBounds(bounds, 90, 30, 10, 30);
	}
	</script>
</body>
</html>