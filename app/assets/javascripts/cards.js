if (typeof Snuffle === 'undefined') {
  Snuffle = {};
}

$(document).ready(() => {
  Snuffle.handleIgnore();
  Snuffle.handleMatch();
});

Snuffle.getMetaToken = function() {
  let metas = document.getElementsByTagName('meta');
  for (let i=0; i<metas.length; i++) {
    if (metas[i].getAttribute('name') === 'csrf-token') {
      return metas[i].getAttribute('content');
    }
  }
}

Snuffle.handleIgnore = function() {
  $('.ignore').click((event) => {

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
      success: (response) => {
        dogCard.animate({
          opacity: 0,
          left: "-=75",
        }, 500, function() {
          dogCard.remove()
        })
      },
      error: (xhr, response) => {
        console.log('whoops')
        // card remains in place
      }
    })

  });
};

Snuffle.handleMatch = function() {
  $('.match').click((event) => {
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
      success: (response) => {
        dogCard.animate({
          opacity: 0,
          left: "+=75",
        }, 500, function() {
          dogCard.remove()
        })
      },
      error: (xhr, response) => {
        console.log('whoops')
        // card remains in place
      }
    })

  });
}

