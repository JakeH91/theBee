$(document).on('turbolinks:load', function(){
	console.log("Hi");
  $(".alert").delay(4000).fadeOut();
  $(".notice").delay(4000).fadeOut();
});