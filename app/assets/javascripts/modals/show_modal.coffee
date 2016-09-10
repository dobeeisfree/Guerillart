jQuery(document).ready ->

  # 공연 모달 사이즈를 가져온다
  s_func = $('#show_cnt').val();


  # 클립보드
  Clip = (element) ->
    $temp = $("<input>");
    $("body").append($temp);
    $temp.val(element).select();
    document.execCommand("copy");
    console.log("copy가 되었습니다");
    $temp.remove();


  # 공연 모달 함수 정의
  Modal_Func = (index) ->
    # 트위터의 url을 가져옴
    twt_url = $("#popup-" + index).attr('href');
    $('#popup-' + index).on 'click', (event) =>
      return !window.open(twt_url, "pop", "width=600, height=300");

    $('#clipboard-url-' + index).on 'click', (event) =>
      clip_url = $('#clipboard-url-' + index).attr('data-clipboard-text');
      Clip(clip_url);
      $('#msg-copied-' + index).text("Copied!");


  # 공연 모달 함수 쫙
  i = 0
  while i<= s_func
    Modal_Func(i)
    i++
