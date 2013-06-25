// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$( document ).ready(function(){
  $("body").css("display", "none");
    $("body").fadeIn(300);

  $('#alertbox').delay(3000).fadeOut("slow");

  $('.setlist_button').click(function (e) {
    e.preventDefault()
      $(this).parent().next(".setlist").toggle("slow");
  });

});
