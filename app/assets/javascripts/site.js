$(document).ready(function(){
	console.log("Hey! from site.js");
	$(".rating").raty( { path: '/assets', scoreName: 'comment[rating]' });
});