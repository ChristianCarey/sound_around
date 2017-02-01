soundAround.controller('ArtistShowCtrl', ['$scope', '$stateParams', 'artist',
  function($scope, $stateParams, artist) {
    $scope.artist = artist
    $scope.eventOrder = 'datetime'

    $scope.setEventOrder = function(order) {
      $scope.eventOrder = order;
      if (order === 'datetime') {
        $scope.eventOrderString = 'datetime';
      } else {
        $scope.eventOrderString = 'venue.miles_away'
      }
    }
  }]);