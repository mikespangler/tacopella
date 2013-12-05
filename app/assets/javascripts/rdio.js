
// where our key will go if we deploy
var playback_token = "GAlNi78J_____zlyYWs5ZG02N2pkaHlhcWsyOWJtYjkyN2xvY2FsaG9zdEbwl7EHvbylWSWFWYMZwfc=";
var domain = "localhost";

// a global variable that will hold a reference to the api swf once it has loaded

var apiswf = null;

$(document).ready(function() {
  // on page load use SWFObject to load the API swf into div#apiswf
  var flashvars = {
    'playbackToken': playback_token, // from rdio.js
    'domain': domain,                // from rdio.js
    'listener': 'callback_object'    // the global name of the object that will receive callbacks from the SWF
    };
  var params = {
    'allowScriptAccess': 'always'
  };
  var attributes = {};
  swfobject.embedSWF('http://www.rdio.com/api/swf/', // the location of the Rdio Playback API SWF
      'apiswf', // the ID of the element that will be replaced with the SWF
      1, 1, '9.0.0', 'expressInstall.swf', flashvars, params, attributes);


  // set up the controls

  $('body').on('click', '#play', function(event) {
    // var diffy;
    //console.log('I\'m play: '+$('#play_key').attr('value'));
    apiswf.rdio_play($('#play_key').attr('value'));

    // if ($('#difficulty').attr('value') == '1') {
    //   diffy = 10000;
    //   //console.log('easy');
    // } else if ($('#difficulty').attr('value') == '2') { 
    //   diffy = 5000;
    //   //console.log('medium');
    // } else {
    //   diffy = 1000;
    //   //console.log('hard');
    // }
    setInterval(function(){ apiswf.rdio_stop();},8000);
    event.preventDefault();
  });

  $('#stop').click(function() { apiswf.rdio_stop(); });
  $('#pause').click(function() { apiswf.rdio_pause(); });
  $('#previous').click(function() { apiswf.rdio_previous(); });
  $('#next').click(function() { apiswf.rdio_next(); });

});




// the global callback object
var callback_object = {};

callback_object.ready = function ready(user) {
  // Called once the API SWF has loaded and is ready to accept method calls.

  // find the embed/object element
  apiswf = $('#apiswf').get(0);

  apiswf.rdio_startFrequencyAnalyzer({
    frequencies: '10-band',
    period: 100
  });

}

  var score = parseInt($('#score').text());
  var song_count = parseInt($('#song_count').attr('value'));

  // Submit Answer Actions
  $('#submit_guess').click(function() {
    // console.log(song_count+1);
    // console.log($('#challenge_size').attr('value'));
    if ((song_count + 1) < ($('#challenge_size').attr('value'))) {

      var song_name = $('#song_name').attr('value').toLowerCase().replace(/ /g,'');
      var guess = $('#guess').val().toLowerCase().replace(/ /g,'');

      if (song_name === guess) {
         $('#correct').show();
         $('#wrong').hide()
         $('#score').text(score += 1)
      } else {
         $('#correct').hide();
         $('#wrong').show();
      }

      var challenge_id = $('#challenge_id').attr('value');
      
      $.get('/challenges/' + challenge_id + '/songs/'+ song_count , function(next_song){
        console.log(next_song);
        $('#song_name').attr('value', next_song.name);
        $('#play_key').attr('value', next_song.play_key);
        $('#song_count').attr('value', song_count += 1);
      });

    } else {

      console.log('Hello!');
      $('#wrong').hide()
      $('#correct').hide();
      $('#game_over').show();
      $('#score').show();
    }
  });



callback_object.freeRemainingChanged = function freeRemainingChanged(remaining) {
  $('#remaining').text(remaining);
}

callback_object.playStateChanged = function playStateChanged(playState) {
  // The playback state has changed.
  // The state can be: 0 - paused, 1 - playing, 2 - stopped, 3 - buffering or 4 - paused.
  $('#playState').text(playState);
}

callback_object.playingTrackChanged = function playingTrackChanged(playingTrack, sourcePosition) {
  // The currently playing track has changed.
  // Track metadata is provided as playingTrack and the position within the playing source as sourcePosition.
  if (playingTrack != null) {
    $('#track').text(playingTrack['name']);
    $('#album').text(playingTrack['album']);
    $('#artist').text(playingTrack['artist']);
    $('#art').attr('src', playingTrack['icon']);
  }
}

// Attach a submit handler to the form
$( "#searchForm" ).submit(function( event ) {
 
  // Stop form from submitting normally
  event.preventDefault();
 
  // Get some values from elements on the page:
  var $form = $( this ),
    term = $form.find( "input[name='s']" ).val(),
    url = $form.attr( "action" );
 
  // Send the data using post
  var posting = $.post( url, { s: term } );
 
  // Put the results in a div
  posting.done(function( data ) {
    var content = $( data ).find( "#content" );
    $( "#result" ).empty().append( content );
  });
});


callback_object.playingSourceChanged = function playingSourceChanged(playingSource) {
  // The currently playing source changed.
  // The source metadata, including a track listing is inside playingSource.
}

callback_object.volumeChanged = function volumeChanged(volume) {
  // The volume changed to volume, a number between 0 and 1.
}

callback_object.muteChanged = function muteChanged(mute) {
  // Mute was changed. mute will either be true (for muting enabled) or false (for muting disabled).
}

callback_object.positionChanged = function positionChanged(position) {
  //The position within the track changed to position seconds.
  // This happens both in response to a seek and during playback.
  $('#position').text(position);
}

callback_object.queueChanged = function queueChanged(newQueue) {
  // The queue has changed to newQueue.
}

callback_object.shuffleChanged = function shuffleChanged(shuffle) {
  // The shuffle mode has changed.
  // shuffle is a boolean, true for shuffle, false for normal playback order.
}

callback_object.repeatChanged = function repeatChanged(repeatMode) {
  // The repeat mode change.
  // repeatMode will be one of: 0: no-repeat, 1: track-repeat or 2: whole-source-repeat.
}

callback_object.playingSomewhereElse = function playingSomewhereElse() {
  // An Rdio user can only play from one location at a time.
  // If playback begins somewhere else then playback will stop and this callback will be called.
}

callback_object.updateFrequencyData = function updateFrequencyData(arrayAsString) {
  // Called with frequency information after apiswf.rdio_startFrequencyAnalyzer(options) is called.
  // arrayAsString is a list of comma separated floats.

  var arr = arrayAsString.split(',');

  $('#freq div').each(function(i) {
    $(this).width(parseInt(parseFloat(arr[i])*500));
  })
}