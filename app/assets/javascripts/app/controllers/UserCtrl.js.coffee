App.controller 'UserCtrl', [ '$scope', '$rootScope', 'Auth', ($scope, $rootScope, Auth)->

  $scope.logout = ->
    Auth.logout().then ()->
     location.reload()    
  $scope.login = ->
    Auth.currentUser()
]