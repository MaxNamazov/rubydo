App.directive 'isSortable', [()->
  restrict: 'C'
  link: (scope, el, attrs)->    
    el.find('tbody').sortable 
      appendTo: document.body
      axis: "y"
      forceHelperSize: true
      helper: (event, ui)->
        ui.children().each ()->
          $(this).width($(this).width())
        ui
      update: (event, ui)->  
        id = ui.item.scope().task.id      
        scope.changePosition(id, ui.item.index()+1)       
]
        