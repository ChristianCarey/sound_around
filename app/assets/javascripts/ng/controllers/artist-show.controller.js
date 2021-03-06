soundAround.controller('ArtistShowCtrl', ['$scope', '$stateParams', 'artist', 'artistService',
  function($scope, $stateParams, artist, artistService) {
    var allEvents = angular.copy(artist.events);
    $scope.numEvents = allEvents.length;
    $scope.artist = artist;
    $scope.eventOrder = 'datetime';
    $scope.soldOutShowing = true;

    $scope.setEventOrder = function(order) {
      $scope.eventOrder = order;
      if (order === 'datetime') {
        $scope.eventOrderString = 'datetime';
      } else {
        $scope.eventOrderString = 'venue.miles_away'
      }
    }

    $scope.showSoldOut = function() {
      $scope.soldOutShowing = true;
      angular.copy(allEvents, $scope.artist.events)
    }

    $scope.hideSoldOut = function() {
      $scope.soldOutShowing = false;
      var notSoldOut = []
      artist.events.forEach(function(event) {
        if (event.ticket_status === 'available') {
          notSoldOut.push(event);
        }
      })
      angular.copy(notSoldOut, $scope.artist.events)
    }

    $scope.$on('updateUser', function(e, user) {
      artistService.find($scope.artist.id)
        .then(function(artist) {
          $scope.artist = artist;
        })
    })
  }]);