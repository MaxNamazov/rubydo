App.factory 'Projects', ['$resource', ($resource)->
  $resource 'projects/:project_id',
    project_id: '@project_id'
]