<<<<<<< HEAD
class ThemeSelector extends Backbone.View
  tagName: 'ul'
  className: 'theme-selector'

  events:
    'click li': 'handleClick'

  render: ->
    @$el.html ''

    for theme in @options.themes
      $li = $ '<li>'
      $li.attr 'data-id', theme
      $li.text theme

      @$el.append $li

  handleClick: (e) ->
    $li = $ e.target

    @trigger 'update', $li.attr('data-id')

$.fn.themeSelector = (opts) ->
  sel = new ThemeSelector $.extend {}, opts,
    el: this

  $(this).addClass sel.className
  sel.render()

  sel
=======
class ThemeSelector extends Backbone.View
  tagName: 'ul'
  className: 'theme-selector'

  events:
    'click li': 'handleClick'

  render: ->
    @$el.html ''

    for theme in @options.themes
      $li = $ '<li>'
      $li.attr 'data-id', theme
      $li.text theme

      @$el.append $li

  handleClick: (e) ->
    $li = $ e.target

    @trigger 'update', $li.attr('data-id')

$.fn.themeSelector = (opts) ->
  sel = new ThemeSelector $.extend {}, opts,
    el: this

  $(this).addClass sel.className
  sel.render()

  sel
>>>>>>> f41086b3477dec126aff19d257158dc3d3221e97
