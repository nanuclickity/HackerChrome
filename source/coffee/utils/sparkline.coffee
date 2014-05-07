# Library to interact with jquery.sparkline

define ['jquery', 'sparkline'], ($)->

  _Templates =
    bardata: [4, 3, 0, -5, 1, 2, 6, -3, -2, -1, 4, 1, 0]

  _Report = (instances)-> console.log "  Sparkline:: " + instances + " Initialized."

  Sparkline =
    init: (element)->
      targets = $(element).find '.chart-sparkline'
      if not targets.length then _Report 0
      targets.each (index)->
        chart_data = _Templates[$(this).attr('data-template')]
        chart_type = $(this).attr 'data-type'

        $(this).sparkline chart_data, {type: chart_type}

        # After last iteration
        if index is (targets.length-1) then _Report targets.length
  return Sparkline