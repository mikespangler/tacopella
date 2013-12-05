$(function(){
  $('.index-squares').click(function(){
    window.location = $(this).children('a').attr('href');
  });
});