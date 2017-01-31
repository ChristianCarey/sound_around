soundAround.controller('ArtistsCtrl', ['$scope', 'Restangular',
  function($scope, Restangular) {
    $scope.artists = Restangular.all('artists').getList().$object;

    $scope.postArtist = function() {
      console.log($scope.newArtist.name)
      Restangular.all('artists').post({name: $scope.newArtist.name})
        .then(_addArtist)
    };

    var _addArtist = function(artist){
      $scope.artists.push(artist);
      $scope.newArtist = {};
    }
  }]);