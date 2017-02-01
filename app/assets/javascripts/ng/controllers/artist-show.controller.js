soundAround.controller('ArtistShowCtrl', ['$scope', '$stateParams', 'Restangular',
  function($scope, $stateParams, Restangular) {
    $scope.artist = Restangular.one('artists', $stateParams.id).get().$object;
  }]);