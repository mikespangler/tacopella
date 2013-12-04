// $(function(){
//   $('#submit_song_search').click(function(e) {
//     e.preventDefault();
//     alert("started");
//     var search_song, post_path, datums, clicked_button, challenge_id;
//     challenge_id = $(this).parent().attr('name');
//     search_song = $(this).parent().parent().serialize();
//     get_path = "/challenges/" + challenge_id + "/songs/search.json?" + search_song;
//     clicked_button = $(this);

//     console.log('sending search request...');
    
//     $.get(get_path, function(){
//       alert("made it!");
//     });
//   });
// });