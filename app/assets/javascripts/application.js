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
$(document).on('submit', '#login_form', function(e) {
            //do stuff here
            console.log("hi : "+ e);
            
}).on('ajax:success', '#login_form', function(e, data, status, xhr) {
        //do stuff here 
        console.log("hi1 : " +JSON.stringify(data) + ", @@@ "+JSON.stringify(status)+ ", @@@ "+ JSON.stringify(xhr));
        // console.log("hi1 : "+data);
        // console.log("hi1 : ");
}).on('ajax:error', '#login_form', function(e, data, status, xhr) {
        //do stuff here
        console.log("hi2");
});


$(document).on('submit', '#register_form', function(e){
    //do stuff here
    console.log("hi3");
}).on('ajax:success', '#register_form', function(e, data, status, xhr) {
    //do stuff here
    console.log("hi4");
}).on('ajax:error', '#register_form', function(e, data, status, xhr) {
       //do stuff here
       console.log("hi5");
});
