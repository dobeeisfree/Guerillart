jQuery(document).ready ->

  # 모달 셋팅
  $('.ui.basic.modal')
  .modal('attach events', 'show')
  .modal('setting', {
      detachable: false,
      allowMultiple: false,
      observeChanges: false,
      blurring: true,
      transition: 'vertical flip'
  });

  #로그인 모달
  $('#start_signin_modal').click ->
    console.log("로그인 하세요");
    $('.ui.basic.modal.signin').modal('show');
  #회원가입 모달
  $('#start_signup_modal').click ->
    console.log("회원가입 하세요");
    $('.ui.basic.modal.signup').modal('show');
