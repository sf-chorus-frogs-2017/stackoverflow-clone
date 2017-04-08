$(document).ready(function() {

  function decreaseAnswerVote(event) {
    event.preventDefault();

    var insertLocation = $(this).parent().prev();
    var data = $(this).parent().serialize();
    var answerID = $(this).prev('input').val();

    var request = $.ajax({
      url: `/answers/${answerID}/votes`,
      method: "POST"
    });

    request.done(function(response) {
      insertLocation.html(response)
    })

    request.fail(function(response) {
      console.log('YOOOOHOOHOHOOHO we screwed up');
    })

  }


  $('.answers-container').on('click', '.answer-down', decreaseAnswerVote)



});
