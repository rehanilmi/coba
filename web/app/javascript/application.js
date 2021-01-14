// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap
//= require activestorage
//= require turbolinks
//= require cookies_eu
//= require_tree .


// app/assets/javascripts/application.js
var submitInvisibleRecaptchaFormContact = function () {
  document.getElementById("invisible-recaptcha-form-contact").submit();
};


var pengaturanNav = function() {
    $(".navbar").addClass("navbar-dark");
    $(".navbar").addClass("bg-dark");
    $(".navbar").removeClass("navbar-transparent");
    $("#main-logo-color").show();
    $("#main-logo-white").hide();
    $('#main-logo-title').removeClass('p-text-white');
    $('#main-logo-title').addClass('p-text-yellow');
    $('#mainNav .navbar-toggler').removeClass('p-navbar-toggler-white');
    $('#mainNav .navbar-toggler').addClass('p-navbar-toggler-color');
}
