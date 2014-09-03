App.directive 'isSortable', [()->
  restrict: 'C'
  link: (scope, el, attrs)->    
    el.sortable 
      appendTo: document.body
      axis: "y"
      forceHelperSize: true
      update: (event, ui)->  
        id = ui.item.scope().task.id      
        scope.changePosition(id, ui.item.index()+1)       
]
        