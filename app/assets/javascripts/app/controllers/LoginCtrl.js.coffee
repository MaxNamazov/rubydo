App.controller 'LoginCtrl', ['$scope', '$modalInstance', ($scope, $modalInstance)->
  
  $scope.creds = {}
  $scope.ok = ->
    $modalInstance.close($scope.creds)
  $scope.cancel =->
    $modalInstance.dismiss 'cancel'
]