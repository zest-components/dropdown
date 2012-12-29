define ['zest', 'selector', 'bean'], ($z, $, bean) ->
  $z.create [$z.Component],
    options:
      class: ''
    type: 'DropDown'
    render: (o) -> """
      <select class="#{o.class}">
        #{ "<option value='" + value + "'>" + name + "</option>" for name, value of o.data }
      </select>
    """
    construct: (el, o) ->
      @$select = el
      
      bean.on @$select, 'change', (e) =>
        @change e.target.value
    
    prototype:
      destroy: ->
        bean.off @$select, 'change'

      __change: ->