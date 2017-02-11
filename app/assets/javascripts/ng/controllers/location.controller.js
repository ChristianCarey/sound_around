soundAround.controller('LocationCtrl', ['$scope', 'Auth', '$document', '$timeout', 'Restangular', '$rootScope',
  function($scope, Auth, $document, $timeout, Restangular, $rootScope) {
    Auth.currentUser()
      .then(function(user) {
        $scope.currentUser = user;
      })

    $scope.enableEditingLocation = function() {
      $scope.editingLocation = true;
    }

    $scope.editLocation = function(e) {
      e.preventDefault()
      $scope.currentUser.location = '';
      document.getElementById('user-location-edit').focus();
      document.getElementById('dropdown').style.display = 'none';
      $timeout(function() {
        document.getElementById('dropdown').style.display = 'block';
      }, 200);
      $scope.editingLocation = true;
    }

    $scope.updateLocation = function() {
      document.getElementById('user-location-edit').blur();
      if ($scope.editingLocation) {
        console.log('updating')
        var user = Restangular.one('users', $scope.currentUser.id);
        user.user = { location_string: $scope.currentUser.location };
        user.put().then(function(user) {
          $scope.currentUser = user;
          $rootScope.$broadcast('updateUser', user);
        })
      }
      $scope.editingLocation = false;
    }
  }]);