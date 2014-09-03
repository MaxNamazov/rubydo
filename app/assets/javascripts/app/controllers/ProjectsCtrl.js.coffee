App.controller 'ProjectsCtrl', ['$scope', 'Projects', 'Tasks', 'Auth', ($scope, Projects, Tasks, Auth)->
  
  Auth.currentUser().then (user)->
    console.log user
  
  $scope.projects = []
  $scope.find = ->   
    Projects.query (projects)->
      $scope.projects = projects    

  $scope.changePosition = (id, position)->
    console.log id, position
    console.log this
    Tasks.changePosition
      project_id: this.project.id
      task_id: id
      new_position: position

  $scope.updateTask = ->
    console.log this
    Tasks.update
      project_id: this.$parent.project.id
      task_id: this.task.id
      task: this.task

  $scope.addTask = (title)->  
    self = this    
    task = new Tasks 
      project_id: this.project.id
      name: title
    task.$save (res)->
      if res.status == 'created'
        self.project.tasks.push res.task
    self.newTitle = ''

  $scope.addProject = (title)->
    project = new Projects name: title
    project.$save (res)->
      $scope.find() if res.$resolved
      $scope.newProjectName = ''

  $scope.deleteProject = (idx)->    
    Projects.delete {project_id: this.project.id}, (res)->
      $scope.find() if res.$resolved 

  $scope.deleteTask = (idx)->    
    Tasks.delete {project_id: this.$parent.project.id, task_id: this.task.id}, (res)->
      $scope.find() if res.$resolved 
      
       

]