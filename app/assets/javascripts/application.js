// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

//signin-modal submit 함수
$(document).on('submit', '#login_form', function(e) {
    //do stuff here
    console.log("hi : "+ e);
}).on('ajax:success', '#login_form', function(e, data, status, xhr) {	//로그인 성공 시
    //do stuff here 
    console.log("hi1 : " +JSON.stringify(data) + ", @@@ "+JSON.stringify(status)+ ", @@@ "+ JSON.stringify(xhr));
    
    // $('.ui.basic.modal.signin').modal('hide');
    
    window.location.reload(true);	//새로고침
    
    // console.log("hi1 : "+data);
    // console.log("hi1 : ");
}).on('ajax:error', '#login_form', function(e, data, status, xhr) {		//로그인 실패 시
    //do stuff here
    console.log("hi2 : " +JSON.stringify(data) + ", @@@ "+JSON.stringify(status)+ ", @@@ "+ JSON.stringify(xhr));
    console.log(""+data.responseText);
    
    //오류 메시지 출력
    $('.footer#login_modal_footer').html('<div class="ui error message"><div class="header" id="login_error_msg">로그인 실패</div><p>' + data.responseText + '</p></div>');
    //$('#login_modal_footer').innerHTML = '<div class="ui error message"><div class="header" id="login_error_msg">로그인 실패</div><p>' + data.responseText + '</p></div>';
    
    
});

//signup-modal submit 함수
$(document).on('submit', '#register_form', function(e){
    //do stuff here
    console.log("hi3");
}).on('ajax:success', '#register_form', function(e, data, status, xhr) {	//회원가입 성공 시
    //do stuff here
    console.log("hi4");
    
    window.location.reload(true);	//새로고침
}).on('ajax:error', '#register_form', function(e, data, status, xhr) {		//회원가입 실패 시
	//do stuff here
	// console.log("hi5 ? : " + JSON.stringify(data));
	
    errors = JSON && JSON.parse(data.responseText) || $.parseJSON(data.responseText);
	
	// console.log("hiㅁ ? : " + data.resopnseText['email']);
	// console.log("hiㅁ ? : " + JSON.stringify(data.resopnseText['email']));
	// console.log("hi5 ? : " + JSON.stringify(errors[email]));
	console.log("hi5 n : " + errors['name']);
	console.log("hi5 e : " + errors['email']);
	console.log("hi5 p : " + errors['password']);
	// console.log("hi5 : " +JSON.stringify(data) + ", @@@ "+JSON.stringify(status)+ ", @@@ "+ JSON.stringify(xhr));
	//오류메시지 출력
	$('.footer#signup_modal_footer').html('<div class="ui error message"><div class="header" id="signup_error_msg">회원가입 실패</div><p>' + data.responseText + '</p></div>');
	
	//오류 메시지들 
	//hi5 ? : {"readyState":4,"responseText":"{\"password\":[\"is too short (minimum is 6 characters)\"]}","responseJSON":{"password":["is too short (minimum is 6 characters)"]},"status":422,"statusText":"Unprocessable Entity "}
	//hi5 ? : {"readyState":4,"responseText":"{\"email\":[\"has already been taken\"],\"password_confirmation\":[\"doesn't match Password\"]}","responseJSON":{"email":["has already been taken"],"password_confirmation":["doesn't match Password"]},"status":422,"statusText":"Unprocessable Entity "}
	//hi5 ? : {"readyState":4,"responseText":"{\"email\":[\"has already been taken\"]}","responseJSON":{"email":["has already been taken"]},"status":422,"statusText":"Unprocessable Entity "}      
});

//계정관리 submit 함수
$(document).on('submit', '#register_edit', function(e) {
    //do stuff here
    console.log("hi7 : "+ e);
}).on('ajax:success', '#register_edit', function(e, data, status, xhr) {
    //do stuff here 
    console.log("hi8 : " +JSON.stringify(data) + ", @@@ "+JSON.stringify(status)+ ", @@@ "+ JSON.stringify(xhr));
    
    
    window.location.reload(true);	//새로고침
    console.log("hi1 : "+data);
    
}).on('ajax:error', '#register_edit', function(e, data, status, xhr) {		
    //do stuff here
    // console.log("hi9 : " +JSON.stringify(data) + ", @@@ "+JSON.stringify(status)+ ", @@@ "+ JSON.stringify(xhr));
    errors = JSON && JSON.parse(data.responseText) || $.parseJSON(data.responseText);
    console.log("hi9 n : " + errors['name']);
    console.log("hi9 e : " + errors['email']);
	console.log("hi9 p : " + errors['password']);
    
    
    
});

