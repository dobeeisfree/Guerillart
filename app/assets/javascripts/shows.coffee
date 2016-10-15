jQuery(document).ready ->

  # index.html.erb
  #공연정보페이지의 바디태그만 색깔 지정
  $('body').css("background", "#f4f4f4");

  # 서브네비바의 드롭다운
  $('.show.dropdown')
    .dropdown();
  ;
  $('.genre.dropdown')
    .dropdown();
  ;

  # 공연 카드뷰
  $('.special.cards .image').dimmer({
    on: 'hover'
  });


  # 공연 모달을 할 인덱스를 가져옴
  selected_modals = $('#selected_modals').val();
  array = JSON.parse(selected_modals);


  # 공연 모달 함수 정의
  Show_Modal = (index) ->
    $('#view-modal-' + index ).on 'click', (event) =>
      $('.ui.view.small.modal.'+ index).modal('show');


  # 공연 모달 함수 쫙
  i = 0
  while i<= array.length
    Show_Modal(array[i])
    i++


  # 버큰 기능 정의
  # 클립보드
  Clip = (element) ->
    $temp = $("<input>");
    $("body").append($temp);
    $temp.val(element).select();
    document.execCommand("copy");
    console.log("copy가 되었습니다");
    $temp.remove();


  Modal_Func = (index) ->
    # 트위터의 url을 가져옴
    twt_url = $("#popup-" + index).attr('href');
    $('#popup-' + index).on 'click', (event) =>
      return !window.open(twt_url, "pop", "width=600, height=300");

    $('#clipboard-url-' + index).on 'click', (event) =>
      clip_url = $('#clipboard-url-' + index).attr('data-clipboard-text');
      Clip(clip_url);
      $('#msg-copied-' + index).text("Copied!");



  # 공연 모달 함수 부름
  i = 0
  while i<= array.length
    Modal_Func(array[i])
    i++



  # show.html.erb
  # 공연 뷰 (각 공연마다의 뷰)
  view_id = $('#show_view_id').val();
  Modal_Func(view_id);



  # new.html.erb
  # 데이트 타임 픽커
  $('.ui.checkbox').checkbox();
  $('#date-time').calendar();
