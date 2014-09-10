App.controller 'LoginCtrl', ['$scope', '$modalInstance', 'auth', ($scope, $modalInstance, auth)->
  
  $scope.creds = {}
  $scope.login = ->
    auth.login($scope.creds).then(
      (user)->  
        location.reload()       
      ,
      (error)->
        console.log error
    )
    
  $scope.signup = ->
    $scope.creds.password_confirmation = $scope.creds.password
    auth.register($scope.creds).then(
      (user)->  
        location.reload()       
      ,
      (error)->
        console.log error
    )
  $scope.cancel =->
    $modalInstance.dismiss 'cancel'
]