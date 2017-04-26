if (typeof Snuffle === 'undefined') {
  Snuffle = {};
}

$(document).ready(function() {
  Snuffle.handleIgnore();
  Snuffle.handleMatch();
});

Snuffle.getMetaToken = function() {
  var metas = document.getElementsByTagName('meta');
  for (var i=0; i<metas.length; i++) {
    if (metas[i].getAttribute('name') === 'csrf-token') {
      return metas[i].getAttribute('content');
    };
  };
};

Snuffle.handleIgnore = function() {
  $('.ignore').click(function(event) {

    const dogCard = $(event.target).parents('.dog-card'),
          dogId = dogCard.data('dog'),
          userId = dogCard.data('user')

    $.ajax({
      url: 'users/' + userId + '/matches',
      data: {
        authenticity_token: Snuffle.getMetaToken(),
        match: {
          user_id: userId,
          dog_id: dogId,
          selected: false
        }
      },
      type: 'POST',
      dataType: 'json',
      success: function(response) {
        dogCard.animate({
          opacity: 0,
          left: "-=75",
        }, 500, function() {
          dogCard.remove()
        })
      },
      error: function(xhr, response) {
        console.log('whoops')
        // card remains in place
      }
    })

  });
};

Snuffle.handleMatch = function() {
  $('.match').click(function(event) {

    const dogCard = $(event.target).parents('.dog-card'),
          dogId = dogCard.data('dog'),
          userId = dogCard.data('user')

    $.ajax({
      url: 'users/' + userId + '/matches',
      data: {
        authenticity_token: Snuffle.getMetaToken(),
        match: {
          user_id: userId,
          dog_id: dogId,
          selected: true
        }
      },
      type: 'POST',
      dataType: 'json',
      success: function(response) {
        dogCard.animate({
          opacity: 0,
          left: "+=75",
        }, 500, function() {
          dogCard.remove()
        })
      },
      error: function(xhr, response) {
        console.log('whoops')
        // card remains in place
      }
    })

  });
};

