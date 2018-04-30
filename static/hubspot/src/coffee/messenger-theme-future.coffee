<<<<<<< HEAD
$ = jQuery

spinner_template = '''
    <div class="messenger-spinner">
        <span class="messenger-spinner-side messenger-spinner-side-left">
            <span class="messenger-spinner-fill"></span>
        </span>
        <span class="messenger-spinner-side messenger-spinner-side-right">
            <span class="messenger-spinner-fill"></span>
        </span>
    </div>
'''

class FutureMessage extends window.Messenger.Message
    template: (opts) ->
        $message = super

        $message.append $ spinner_template

        $message

window.Messenger.themes.future =
    Message: FutureMessage
=======
$ = jQuery

spinner_template = '''
    <div class="messenger-spinner">
        <span class="messenger-spinner-side messenger-spinner-side-left">
            <span class="messenger-spinner-fill"></span>
        </span>
        <span class="messenger-spinner-side messenger-spinner-side-right">
            <span class="messenger-spinner-fill"></span>
        </span>
    </div>
'''

class FutureMessage extends window.Messenger.Message
    template: (opts) ->
        $message = super

        $message.append $ spinner_template

        $message

window.Messenger.themes.future =
    Message: FutureMessage
>>>>>>> f41086b3477dec126aff19d257158dc3d3221e97
