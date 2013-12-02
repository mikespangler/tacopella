# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#add_exercise').on('click', function() { 
    $('#exercises').append('<div class="exercise"><input type="text" name="exercise[]"><button class="remove">x</button></div>');
    return false; //prevent form submission
});

$('#exercises').on('click', '.remove', function() {
    $(this).parent().remove();
    return false; //prevent form submission
});