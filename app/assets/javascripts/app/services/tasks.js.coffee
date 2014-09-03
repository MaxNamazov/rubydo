App.factory 'Tasks', ['$resource', ($resource)->
  $resource 'projects/:project_id/tasks/:task_id',
    {
      project_id: '@project_id'
      task_id: '@task_id'
    },
    {
      update:
        method: 'PUT'
      changePosition:
        method: 'PATCH'
    }
]