if (typeof Snuffle === 'undefined') {
  Snuffle = {};
}

$(document).ready(function() {
  Snuffle.handleIgnore();
  Snuffle.handleMatch();
});

Snuffle.handleIgnore = function() {
  $('.ignore').click((event) => {
    const dogCard = $(this).
    $.ajax({
      url: '/match',
      data: {
        user_id: 1,
        dog_id: 
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

