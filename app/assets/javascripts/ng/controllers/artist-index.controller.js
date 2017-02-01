soundAround.controller('ArtistIndexCtrl', ['$scope', 'Restangular', '$state', 'artistService',
  function($scope, Restangular, $state, artistService) {
  
    $scope.createArtist = function() {
      $scope.artists.create($scope.newArtist).then(_showArtist)
      $scope.newArtist = {};
    };

    $scope.removeArtist = function(e, id) {
      e.preventDefault();
      $scope.artists.remove(id).then(_getArtists);
    }

    var _showArtist = function(artist) {
      console.log(artist)
      $state.go('artists.show', { id: artist.id }, { relative: 'artists', reload: true })
    }

    var _getArtists = function() {
      artistService.all().then(_setArtists)
    }

    var _setArtists = function(artists) {
      $scope.artists = artists;
    }

    _getArtists();
  }]);