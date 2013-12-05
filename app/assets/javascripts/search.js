$(function(){

  $('#submit_song_search').click(function(e) {
    e.preventDefault();
    var search_song, post_path, datums, clicked_button, challenge_id;
    challenge_id = $(this).parent().attr('data-id');
    search_song = $(this).parent().parent().serialize();
    get_path = "/challenges/" + challenge_id + "/songs/song_results?" + search_song;
    clicked_button = $(this);
    console.log('sending search request...');

    $.get(get_path, function(response){
      console.log(response);
      $("#results_form").html(response);
    });
  });

  $('#results_form').on('click', "#submit_song", function(e){
    e.preventDefault();

    var add_song_path, challenge_id, song_key, song_name, artist_name;
    add_song_path = "/songs/song_results";
    challenge_id = $('input:radio:checked').attr('data-challenge');
    song_key = $('input:radio:checked').attr('value');
    song_name = $('input:radio:checked').attr('data-songname');
    artist_name = $('input:radio:checked').attr('data-artistname');

    data = {
      id: challenge_id,
      song: song_name,
      artist: artist_name,
      key: song_key
    };

    $.post(add_song_path, data, function(response){
      console.log(response);
      $("#preview").html(response);
    });
  });
});

  // THIS CODE IS FOR BACK WHEN WE PARSED JSON
  //   $.get(get_path, function(response){
  //     $.each(response, function(index, val) {
  //       $.each(val, function(k, v){
  //         alert( k + ": " + v );
  //         // Here we'd generate the form html and replace the contents of the "add to playlist" div. This form will allow user to select one song to add to its corresponding playlist. This will work via post request => create new song with the key (play_key) name (name) and challenge_id.
  //       });
  //     });
  //   });
  // });