App.controller 'LoginCtrl', ['$scope', '$modalInstance', 'auth', ($scope, $modalInstance, auth)->
  
  $scope.creds = {}
  $scope.ok = ->
    auth.login($scope.creds).then(
      (user)->  
        location.reload()       
      ,
      (error)->
        console.log error
    )
    # $modalInstance.close($scope.creds)
  $scope.cancel =->
    $modalInstance.dismiss 'cancel'
]