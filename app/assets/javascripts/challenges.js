$(function() {
  $('#add_song').on('click', function() { 
      $('#songs').append('<div class="song"><input type="text" name="song[]"><button class="remove">x</button></div>');
      return false; //prevent form submission
  });

  $('#songs').on('click', '.remove', function() {
      $(this).parent().remove();
      return false; //prevent form submission
  });
} );