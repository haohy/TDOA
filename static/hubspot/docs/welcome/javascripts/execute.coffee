<<<<<<< HEAD
$.fn.executr = (opts) ->
  defaults =
    codeSelector: 'code[executable]'

  opts = $.extend {}, defaults, opts

  this.on 'click', opts.codeSelector, (e) ->
    $target = $ e.target
    $code = $target.parents(opts.codeSelector)

    ctx = window
    if opts.setUp?
      CoffeeScript.run opts.setUp, ctx

    CoffeeScript.run $code.text(), ctx

    if opts.tearDown?
      CoffeeScript.run opts.tearDown, ctx

=======
$.fn.executr = (opts) ->
  defaults =
    codeSelector: 'code[executable]'

  opts = $.extend {}, defaults, opts

  this.on 'click', opts.codeSelector, (e) ->
    $target = $ e.target
    $code = $target.parents(opts.codeSelector)

    ctx = window
    if opts.setUp?
      CoffeeScript.run opts.setUp, ctx

    CoffeeScript.run $code.text(), ctx

    if opts.tearDown?
      CoffeeScript.run opts.tearDown, ctx

>>>>>>> f41086b3477dec126aff19d257158dc3d3221e97
