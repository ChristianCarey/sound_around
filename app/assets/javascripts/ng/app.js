var soundAround = angular.module('soundAround', ['ui.router', 'restangular']);

soundAround.config(['RestangularProvider', function(RestangularProvider) {
  RestangularProvider.setBaseUrl('/api/v1');
  RestangularProvider.setRequestSuffix('.json');
}]);

soundAround.config(
  ["$httpProvider",
  function($httpProvider) {
    var token = $('meta[name=csrf-token]')
      .attr('content');
    $httpProvider
      .defaults
      .headers
      .common['X-CSRF-Token'] = token;
  }]);

soundAround.config(['$stateProvider', '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/artists');
    
    $stateProvider
      .state('artists', {
        url: '/artists',
        templateUrl: '/templates/artists/index.html',
        controller: 'ArtistIndexCtrl'
      })
      .state('artists.show', {
        url: '/show/:id',
        templateUrl: '/templates/artists/show.html',
        controller: 'ArtistShowCtrl'
      })
  }]);