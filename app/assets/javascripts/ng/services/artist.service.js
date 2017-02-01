soundAround.factory('artistService', ['Restangular', 
  function(Restangular){

    var all = function() {
      return Restangular.all('artists').getList()
        .then(_setArtists);
    }

    var find = function(id) {
      return Restangular.one('artists', id).get();
    }

    var _artists;

    var _create = function(params){
      return Restangular.all('artists').post(params)
        .then(function(artist) {
          _artists.unshift(artist);
          return artist;
        })
    }

    var _remove = function(id) {
      return Restangular.one('artists', id).remove()
        .then(function(artist) {
          var index = _artists.indexOf(artist);
          _artists.splice(index, 1);
          return artist
        });
    }

    var _setArtists = function(artists) {
      _artists = artists;
      return _artists;
    };

    Restangular.extendCollection('artists', function(artists) {
      artists.create = _create;
      artists.remove = _remove;
      return artists;
    })

    return {
      all: all,
      find: find
    }

  }]);