soundAround.controller('ArtistIndexCtrl', ['$scope', 'Restangular', '$state', 'artistService', '$stateParams',
  function($scope, Restangular, $state, artistService, $stateParams) {
  
    $scope.createArtist = function() {
      $scope.artists.create($scope.newArtist).then(_showArtist)
      $scope.newArtist = {};
    };

    $scope.removeArtist = function(e, id) {
      e.preventDefault();
      $scope.artists.remove(id).then(_removeArtist);
    }

    var _showArtist = function(artist) {
      console.log(artist)
      $state.go('artists.show', { id: artist.id }, { relative: 'artists', reload: true })
    }

    var _removeArtist = function(artist) {
      _getArtists().then(function() {
        if ($stateParams.id === artist.id) {
          if ($scope.artists.length) {
            console.log('going to artist page')
            console.log($scope.artists)
            $state.go('artists.show', { id: $scope.artists[0].id }, { relative: 'artists' })
          } else {
            $state.go('artists')
          }
        }
      });
    }

    var _getArtists = function() {
      return artistService.all().then(_setArtists)
    }

    var _setArtists = function(artists) {
      $scope.artists = artists;
    }

    _getArtists();
  }]);