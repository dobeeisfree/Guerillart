jQuery(document).ready ->

  # 빈공간이 생기기 때문에, 공연정보페이지의 바디태그만 색깔 지정
  $('body').css("background", "#f4f4f4");

  # 공연의 서브네비바의 드롭다운
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

  # 공연 모달 사이즈를 가져온다
  s = $('#show_cnt').val();

  # 공연 모달 함수 정의
  Show_Modal = (index) ->
    $('#view-modal-' + index ).on 'click', (event) =>
      $('.ui.view.small.modal.'+ index).modal('show');

  # 공연 모달 함수 쫙
  i = 0
  while i<= s
    Show_Modal(i)
    i++
