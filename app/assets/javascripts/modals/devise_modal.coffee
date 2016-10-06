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

  # 로그인 모달 클릭 시
  $('.start_signin_modal').click ->
    console.log("로그인 하세요");
    $('.ui.basic.modal.signin').modal('show');

  # 회원가입 모달 클릭 시
  $('.start_signup_modal').click ->
    console.log("회원가입 하세요");
    $('.ui.basic.modal.signup').modal('show');

  delay = 100
  # registrations/new.html.erb
  # 회원가입 모달에서 로그인 모달로 이동
  $('.already_registered').click ->
    $('.ui.basic.modal.signup').modal('hide');
    setTimeout((->
      setTimeout $('.ui.basic.modal.signin').modal('show'), delay
      ), delay)


  # 회원가입 모달 닫았을 시 모달 초기화
  $('.ui.basic.modal.signup').modal({
      onHide: ->
        $('.footer#signup_modal_footer').html("");
        $('#signup_password').val("");
        #$('#signup_name').val("");
        #$('#signup_email').val("");
        $('#signup_confirm_password').val("");
        return console.log("회원가입 닫음");
  });



  # passwords/new.html.erb
  # 비밀번호 찾기 모달 닫았을 시
  $('.ui.basic.modal.forgot').modal({
      onHide: ->
        setTimeout((->
          setTimeout $('.ui.basic.modal.signin').modal('show'), delay
        ), delay)
        return console.log("비밀번호 찾기 닫음");
  });



  # ssessions/new.html.erb
  # 로그인 모달에서 회원가입 모달로 이동
  $('#not_registered').click ->
    $('.ui.basic.modal.signin').modal('hide');
    setTimeout((->
      setTimeout $('.ui.basic.modal.signup').modal('show'), delay
    ), delay)

  # 로그인 모달에서 비밀번호 찾기 모달로 이동
  $('#forgot_password').click ->
    $('.ui.basic.modal.signin').modal('hide');
    setTimeout((->
      setTimeout $('.ui.basic.modal.forgot').modal('show'). delay
    ), delay)

  # 로그인 모달 닫았을 시 모달 초기화
  $('.ui.basic.modal.signin').modal({
      onHide: ->
        $('.footer#login_modal_footer').html("");
        $('#login_password').val('');
        return console.log("로그인 닫음");
  });
