if (typeof Snuffle === 'undefined') {
  Snuffle = {};
}

$(document).ready(() => {
  Snuffle.handleIgnore();
  Snuffle.handleMatch();
});

Snuffle.handleIgnore = function() {
  $('.ignore').click((event) => {
    const dogCard = $(event.target).parents('.dog-card'),
          dogId = dogCard.data('dog'),
          userId = dogCard.data('user')

    $.ajax({
      url: '/match',
      data: {
        user_id: userId,
        dog_id: dogId
      },
      type: 'POST',
      dataType: 'json',
      success: (response) => {
        console.log('we have lift off')
        // card animates left and red
        // next card is brought forward
      },
      error: (xhr, response) => {
        console.log('whoops')
        // card remains in place
    });
  });
};

Snuffle.handleMatch = function() {
  $('.match').click((event) => {
    const dogCard = $(event.target).parents('.dog-card'),
          dogId = dogCard.data('dog'),
          userId = dogCard.data('user')

    // $.ajax({
    //   url: '/match',
    //   data: {
    //     user_id: userId,
    //     dog_id: 
    //   },
    //   type: 'POST',
    //   dataType: 'json',
    //   success: (response) => {
    //     console.log('we have lift off')
    //     // card animates left and red
    //     // next card is brought forward
    //   },
    //   error: (xhr, response) => {
    //     console.log('whoops')
    //     // card remains in place
    // });
  });
}

