/*
  2016-09-24
  searching controller
*/

  //자동완성
  // autocomplete = new google.maps.places.Autocomplete(
      // /** @type {!HTMLInputElement} */ (
      // document.getElementById('autocomplete')), {
      // // types: ['(cities)'],
      // // componentRestrictions: countryRestrict
    // });
  // places = new google.maps.places.PlacesService(globalMap);


  //loader 띄우기
  $(document).on({
    ajaxStart: function() { $('.ui.segment').dimmer('show');},
      ajaxStop: function() { $('.ui.segment').dimmer('hide');}
  });


  var globalMap;
  var globalMarker;
  var globalGeocoder;

  var markers = [];
  var infowindow = null;

  var markerBubbleArray = [];
  var markerBubble;

  var infoBubbleArray = [];
  var infoBubble;

  var bounds;
  var ne, sw;
  var ne_lat, ne_lng, sw_lat, sw_lng;

  var i;
  var closedMarkerBubble;	//숨은 마커버블
  var centerMarker;	//센터 표시 마커

  var isMobile;	//모바일이면 true
  var isDistOrder; //거리순 정렬이면 1, default: 0 (인기순)
  var mapZoom;    //디바이스에 따른 map의 Zoom 넘버


  // 맵 초기화
  function initialize()
  {
    var address = "<%=@location%>";
    isDistOrder = 0;
    mapZoom = 17;

    // if (address == '검색할 주소를 입력하십시오.' || address == '') {
      // alert('검색할 주소를 입력하십시오.');
      // document.getElementById("address").value = '';
      // document.getElementById("address").focus();
      // return;
    // }

    // globalGeocoder.geocode({
      // 'address' : address
    // }, function(results, status) {
      // if (status == google.maps.GeocoderStatus.OK) {
        // globalMap.setCenter(results[0].geometry.location);

        // //var marker = new google.maps.Marker({
        // globalMarker = new google.maps.Marker({
          // map : globalMap,
          // position : results[0].geometry.location,
          // draggable : true
        // });
      // } else {
        // alert("Geocode was not successful for the following reason: " + status);
      // }
    // });
    isMobile = detectBrowser();

    globalGeocoder = new google.maps.Geocoder();

    var myOptions = {
      zoom : mapZoom,
      // MyLocationEnabled : true,
      //disableDoubleClickZoom:false,
      // center : latlng,

      scrollwheel : false,
      navigationControl : false, // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택.
      navigationControlOptions : {
        position : google.maps.ControlPosition.TOP_RIGHT,
        style : google.maps.NavigationControlStyle.DEFAULT // ANDROID, DEFAULT, SMALL, ZOOM_PAN
      },

      streetViewControl : false,

      scaleControl : false, // 지도 축적 보여줄 것인지.
      //scaleControlOptions: { position: google.maps.ControlPosition.TOP_RIGHT },

      mapTypeControl : false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
      mapTypeId : google.maps.MapTypeId.ROADMAP // HYBRID, ROADMAP, SATELLITE, TERRAIN
    };

    globalMap = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    globalGeocoder.geocode({
      'address' : address
    }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK)
      {
        globalMap.setCenter(results[0].geometry.location);

        centerMarker = new google.maps.Marker({
          map : globalMap,
          position : results[0].geometry.location,
          draggable : false
        });
      }
      else
      {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });

    //gps버튼 추가
    addYourLocationButton(globalMap, centerMarker);

    //맵 로딩 완료후 한번만 실행할 함수
    google.maps.event.addListenerOnce(globalMap, 'idle', function(){
      updateMarkerBubbles();
      });

    // 드래그 끝났을 때 이벤트 추가
    google.maps.event.addListener(globalMap, 'dragend', function() {
      $(function(){
        updateMarkerBubbles();
      });
    });

    // 줌 변경시 이벤트 추가
    google.maps.event.addListener(globalMap, 'zoom_changed', function() {
      $(function(){
        updateMarkerBubbles();
      });
    });

    //지도의 빈 부분 클릭시
    google.maps.event.addListener(globalMap, 'click', function()
    {
      if(isMobile)
      {
        document.getElementById("over_info").style.width = '0%';
        // document.getElementById("over_artist").innerHTML =  "";
        document.getElementById("over_info").innerHTML =  "";
      }
      else
      {
        if(infowindow)
          infowindow.close();
        if(closedmarkerBubble)
        {
          closedMarkerBubble.open();
          closedMarkerBubble=null;

        }
      }
    });



    //bounds 변경시 이벤트 추가 (계속 발생함)
    // google.maps.event.addListener(globalMap, 'bounds_changed', function() {
      // var bounds = globalMap.getBounds();
      // var NE = bounds.getNorthEast();
      // var SW = bounds.getSouthWest();
      // // updateMarkerBubbles();
      // // clearMarkerBubbles(markers);
      // // scheduleDelayedCallback();
    // });

    // 센터 변경시 이벤트 추가 (계속 발생함)
    // google.maps.event.addListener(globalMap, 'center_changed', function() {
      // // clearMarkerBubbles();
      // // updateMarkerBubbles();
      // // clearMarkerBubbles();
      // // showMapPos();
      // // showMapAddr();
    // });

    // 갱신 딜레이
    // function fireIfLastEvent()
    // {
        // if (lastEvent.getTime() + 500 <= new Date().getTime())
        // {
            // alert('i am cool');
        // }
    // }
    // function scheduleDelayedCallback()
    // {
        // lastEvent = new Date();
        // setTimeout(fireIfLastEvent, 500);
    // }

  }


  //유저 디바이스 확인 함수
  function detectBrowser()
  {
    var useragent = navigator.userAgent;
    var mapdiv = document.getElementById("map_canvas");
    // var s_left = document.getElementById("s_left");

    //모바일이라면
    if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1 )
    {
        // mapdiv.style.width = '100%';
        // mapdiv.style.height = '100%';
        document.getElementById("s_left").style.width = '100%';
        mapZoom = 16;
        return true;

    }
    //모바일이 아니라면
    else
    {
        // mapdiv.style.width = '600px';
        // mapdiv.style.height = '800px';
        return false;
      }
  }

  //gps버튼 추가 함수
  function addYourLocationButton (map, marker)
  {
      var controlDiv = document.createElement('div');

      var firstChild = document.createElement('button');
      firstChild.style.backgroundColor = '#fff';
      firstChild.style.border = 'none';
      firstChild.style.outline = 'none';
      firstChild.style.width = '28px';
      firstChild.style.height = '28px';
      firstChild.style.borderRadius = '2px';
      firstChild.style.boxShadow = '0 1px 4px rgba(0,0,0,0.3)';
      firstChild.style.cursor = 'pointer';
      firstChild.style.marginRight = '10px';
      firstChild.style.padding = '0';
      firstChild.title = 'Your Location';
      controlDiv.appendChild(firstChild);

      var secondChild = document.createElement('div');
      secondChild.style.margin = '5px';
      secondChild.style.width = '18px';
      secondChild.style.height = '18px';
      secondChild.style.backgroundImage = 'url(https://maps.gstatic.com/tactile/mylocation/mylocation-sprite-2x.png)';
      secondChild.style.backgroundSize = '180px 18px';
      secondChild.style.backgroundPosition = '0 0';
      secondChild.style.backgroundRepeat = 'no-repeat';
      firstChild.appendChild(secondChild);

      google.maps.event.addListener(map, 'center_changed', function () {
          secondChild.style['background-position'] = '0 0';
      });

      //gps 클릭시
      firstChild.addEventListener('click', function ()
      {
        if (navigator.geolocation)
        {
          navigator.geolocation.getCurrentPosition(function (position)
          {
            map.setCenter(new google.maps.LatLng(position.coords.latitude, position.coords.longitude));

            (function(){
              marker.setPosition(map.getCenter());
              updateMarkerBubbles();
            })();
          });
        }
        else
        {
          clearInterval(animationInterval);
          secondChild.style['background-position'] = '0 0';
        }
      });

      controlDiv.index = 1;
      map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(controlDiv);
  }


  //마커 버블 업데이트
  function updateMarkerBubbles()
  {

    bounds = globalMap.getBounds();
    center = globalMap.getCenter();

    ne = bounds.getNorthEast();
    sw = bounds.getSouthWest();

    //bounds와 center 좌표 searching#getBounds controller에 보내기
    $(document).ready(function()
    {
      $.ajax({
        method: "POST",
        url: "/search?location="+"<%=@location%>",
        data: { ne_lat: ne.lat(), ne_lng: ne.lng(), sw_lat:sw.lat(), sw_lng:sw.lng(), ct_lat: center.lat(), ct_lng: center.lng(), isDistOrder: isDistOrder },
        dataType: 'json',
        success: function(data){

            //모든 infobubble 삭제
          clearMarkerBubbles();

          // alert("^^ "+JSON.stringify(data));

      //센터 마커 이동
      //centerMarker.setMap(globalMap);
          // centerMarker.setPosition(center);

          document.getElementById("s_right").innerHTML="";
          // document.getElementById("right_list").innerHTML="";
          for (var i = 0; i < data.length; i++)
          {
            //markerBubble 띄우기
            markerBubble = new InfoBubble({
              map: globalMap,
              content: "<div class='phoney'>&nbsp;"+data[i].creator.artist_name+'&nbsp;&nbsp;</div>',
              //content: "<div class='phoney'>&nbsp;"+"가나다라마바사아자차카타파하아야어여오여우유으이호호호히히히"+'&nbsp;</div>',
              position: new google.maps.LatLng(data[i].location_x, data[i].location_y),
              shadowStyle: 0,	//그림자 off
              padding: 0,
              minWidth: 20,
              minHeight: 23,
              maxWidth: 160,
              maxHeight: 50,
              backgroundColor: '#FFFF8F',
              //backgroundColor: 'transparent',
              borderRadius: 4,
              arrowSize: 10,
              borderWidth: 1,
              borderColor: '#000000',
              disableAutoPan: true,	//한 지점으로 계속 고정시키는 거
              hideCloseButton: true,	//닫기 버튼 숨기기
              // backgroundClassName: 'phoney',
              arrowStyle: 0	//화살표 모양 (0 : 가운데)
            });
            markerBubble.open();
            markerBubbleArray.push(markerBubble);

            //markerBubble 클릭시 infowindow 팝업
            (function(markerBubble, i)
            {
              google.maps.event.addDomListener(markerBubble.bubble_, 'click', function()
              {
                if(isMobile)
                {
                  // centerMarker.setMap(null);
                  globalMap.setCenter(markerBubble.getPosition());
                  document.getElementById("over_info").style.width = '100%';
                  document.getElementById("over_artist").innerHTML =  "<h1>"+data[i].genre+"</h1>";
                   // document.getElementById("over_info").innerHTML = '<div class="item" style="height: 100%;">'
      // +'<img class="ui avatar image" src="http://semantic-ui.com/images/avatar/small/christian.jpg" style="width: 27%; height: 100%; float: left;">'
      // +'<div class="content" style="width: 50%; float: left;">'
        // +'<div class="header" style="font-weight: bold;">&nbsp;&nbsp;'+data[i].title+'</div>'
        // +'<div class="body">&nbsp;&nbsp;'+data[i].creator.artist_name+'</div>'
        // +'<div class="footer">'
            // +'<div id="f_left" style="float: left; width: 76%;">&nbsp;&nbsp;'+data[i].genre+'</div>'
            // +'<div id="f_right" style="float: right">'+ data[i].creator.fan_count +'</div>'
          // +'</div></div></div>;'
                }
                else
                {
                  if (infowindow && closedMarkerBubble)
                  {
                    infowindow.close();
                    closedMarkerBubble.open();
                  }
                  closedMarkerBubble = markerBubble;
                  markerBubble.close();

                  infowindow = new google.maps.InfoWindow({
                    content: "Hello, World!!" + data[i].creator.artist_name + "<br />"+"hi"
                  });
                  infowindow.open(globalMap, markerBubble);
                }
            // document.getElementById("over_info").style.height = '20%';
              });
            })(markerBubble, i);

            if(!isMobile)
            {
              document.getElementById("s_right").innerHTML += "<h1>"+data[i].creator.fan_count+"</h1> <br />";
              // document.getElementById("right_list").innerHTML+='<div class="item" style="height: 20%;">'
                  // +'<img class="ui avatar image" src="http://semantic-ui.com/images/avatar/small/christian.jpg" style="width: 20%; height: 20%;">'
                  // +'<div class="content" style="width: 76%;">'
                    // +'<div class="header" style="font-weight: bold;">'+data[i].title+'</div>'
                    // +'<div class="body">'+data[i].creator.artist_name+'</div>'
                    // +'<div class="footer">'
                        // +'<div id="f_left" style="float: left; width: 66%;">'+data[i].genre+'</div>'
                        // +'<div id="f_right" style="float: right">'+ data[i].creator.fan_count +'</div>'
                      // +'</div></div></div>;'

            }
          }
        },
        error: function()
        {
          alert("Sorry, load failed T^T");
        }
      })
    });


    // alert(""+js_results+"<%=Time.now%>");
    // alert(""+"<%=@results%>"+"<%=Time.now%>");
    // alert(""+"<%=@neLat%>");




        // //infoBubble 띄우기
        // markerBubble = new InfoBubble({
            // map: globalMap,
              // shadowStyle: 0,	//그림자 off
              // padding: 0,
              // minWidth: 5,
              // backgroundColor: '#FFFFFF',
              // borderRadius: 4,
              // arrowSize: 10,
              // borderWidth: 1,
              // borderColor: '#2c2c2c',
              // disableAutoPan: true,	//한 지점으로 계속 고정시키는 거
              // hideCloseButton: true,	//닫기 버튼 숨기기
              // arrowPosition: 30,
              // // backgroundClassName: 'phoney',
              // arrowStyle: 2	//화살표 모양 (0 : 가운데)
            // });
            // markerBubble.open();
            // markerBubbleArray.push(markerBubble);

        // //infoBubble 클릭 리스너
        // google.maps.event.addDomListener(markerBubble.bubble_, 'click', function() {
        // });



        // //marker 띄우기
        // // globalMarker = new google.maps.Marker({
          // // map : globalMap,
          // // draggable : false,

          // // icon: new google.maps.MarkerImage(
              // // // "http://chart.googleapis.com/chart?chst=d_bubble_text_small&chld=edge_bc|%20"+"안녕"+"|000000|FF0000",
              // // "http://chart.googleapis.com/chart?chst=d_bubble_texts_big&chld=edge_bc|000000|FF0000|",
              // // null, null, null)
          // // //label : "hi"
        // // });
        // // markers.push(globalMarker);

        // // //marker 클릭시 infowindow 팝업
        // // (function(globalMarker, i) {
                      // // // add click event
                      // // google.maps.event.addListener(globalMarker, 'click', function() {
                        // // if (infowindow) {
                  // // infowindow.close();
              // // }
                          // // infowindow = new google.maps.InfoWindow({
                          // // });
                          // // infowindow.open(globalMap, globalMarker);

                      // // });
                  // // })(globalMarker, i);


        // //marker 대신 infowindow 띄우기
        // // globalinfoWindow = new google.maps.InfoWindow({
          // // clickable : true,
          // // map : globalMap,
      // }//if end
  }//updateMarkerBubbles end


  //markerBubble 모두 지우기
  function clearMarkerBubbles()
  {
    for (var j = 0; j < markerBubbleArray.length; j++)
    {
      // if(markerBubbleArray[j])
      markerBubbleArray[j].setMap(null);
    }
    markerBubbleArray = [];

    // while(markerBubbleArray.length){
              // markerBubbleArray.pop().setMap(null);
        // }
  }



  // 맵 드래그할 때 맵 중앙 좌표 보여주기
  function showMapPos()
  {
    var pos = globalMap.getCenter();

    //alert(pos.lat()+"/"+pos.lng());
    //return {x:pos.lat(), y:pos.lng()};

    document.getElementById("centerX").value = pos.lat();
    document.getElementById("centerY").value = pos.lng();
  }

  // 드래그할 때 맵 중앙 좌표의 주소
  function showMapAddr() {
    globalGeocoder.geocode({
      'location' : globalMap.getCenter()
    }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        /*
         var str="";
         for(var i=0; i<results[0].address_components.length; i++){
         str += "/"+results[0].address_components[0].long_name
         }
         document.getElementById("txtAddress").innerHTML=str;

         document.getElementById("txtAddress").innerHTML=results[0].address_components[0].types;
         */

        var str = "";
        for (var i = 3; i >= 0; i--) {
          str += " " + results[0].address_components[i].short_name;
        }
        document.getElementById("txtAddress").innerHTML = str;
        //document.getElementById("txtAddress").innerHTML=results[0].address_components[0].long_name;

      } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  }

  // 맵 중앙에 마크찍기
  function setMark() {
    var myOptions = {
      position : globalMap.getCenter(),
      draggable : true,
      map : globalMap,
      //icon: "http://sstatic.naver.net/search/img2/ico_bal_a.gif", // 아이콘 설정할 때
      visible : true
    };

    globalMarker = new google.maps.Marker(myOptions);
  }

  // 마크 삭제하기
  function removeMark() {
    globalMarker.setOptions({
      map : null,
      visible : false
    });
    globalMarker = null;
  }

  // 마크좌표 가져오기
  function getMarkPos() {
    var pos = globalMarker.getPosition();

    //alert(pos.lat()+"/"+pos.lng());
    //return {x:pos.lat(), y:pos.lng()};

    document.getElementById("markerX").value = pos.lat();
    document.getElementById("markerY").value = pos.lng();
  }

  // 특정좌표로 이동하기
  function setMapByCoord(x, y) {
    var loc = new google.maps.LatLng(x, y);

    globalMap.setCenter(loc);
  }

  // 주소값으로 찾기
  function codeAddress() {
    var address = document.getElementById("address").value;
    if (address == '검색할 주소를 입력하십시오.' || address == '') {
      alert('검색할 주소를 입력하십시오.');
      document.getElementById("address").value = '';
      document.getElementById("address").focus();
      return;
    }

    globalGeocoder.geocode({
      'address' : address
    }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        globalMap.setCenter(results[0].geometry.location);

        //var marker = new google.maps.Marker({
        globalMarker = new google.maps.Marker({
          map : globalMap,
          position : results[0].geometry.location,
          draggable : true
        });
      } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  }

  // 정보창 마크 찍기
  function setInfoMark() {
    //var html = "<div><a href='http://www.findall.co.kr' target='_blank'>www.findall.co.kr</a></div>";
    //var html = "<div><iframe src='http://www.findall.co.kr' style='width:300px;height:120px;'></iframe></div>";

    var html = "";
    html += "<div>";
    html += "    <a href='http://www.findall.co.kr' target='_blank'>";
    html += "        <img src='http://image.findall.co.kr/FANew/Topmain/summer_logo.gif' border='0'>";
    html += "    </a>";
    html += "</div>";

    var infoWin = new google.maps.InfoWindow({
      content : html,
      maxWidth : 1000
    });
    var loc = new google.maps.LatLng(37.500061375296184, 127.03099206089973);

    var myOptions = {
      position : loc,
      draggable : false,
      map : globalMap,
      //icon: "http://sstatic.naver.net/search/img2/ico_bal_a.gif", // 아이콘 설정할 때
      visible : true
    };

    // 마커 생성
    globalMarker = new google.maps.Marker(myOptions);

    // 마커에 이벤트리스너 추가
    google.maps.event.addListener(globalMarker, 'click', function() {
      infoWin.open(globalMap, globalMarker);
    });

    // 지도 중심좌표 이동
    globalMap.setCenter(loc);
  }


  //정렬방법 바꾸기
  function switchOrder()
  {
    if(isDistOrder == 1)
      isDistOrder = 0;
    else
      isDistOrder = 1;

    updateMarkerBubbles();
  }



  //공연 시작 리스트
  function setShowList(creations)
  {
    var j_creations = JSON.parse(creations);
    var showList = document.getElementById("showList");

    for(var i = 0; i < j_creations.length; i++)
      showList.innerHTML += "<h1>" + j_creations[i].genre + "</h1> <br />";
  }
  function finishShow()
  {
    alert("Show finished");
  }
