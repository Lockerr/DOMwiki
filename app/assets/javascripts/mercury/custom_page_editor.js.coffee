class @Mercury.CustomPageEditor extends @Mercury.PageEditor

  constructor: ->
    super

  save: ->
    data = @serialize()
    Mercury.log('saving', data)
    data = jQuery.toJSON(data) unless @options.saveStyle == 'form'
    jQuery.ajax '/contents', {
      type: 'POST'
      data: {_method: 'PUT', content: data}
      success: =>
        Mercury.changes = false
        alert('custom success')
      error: =>
        alert("Mercury was unable to save.")
    }