
Vue = require 'vue'
{parseShort} = require('cirru-parser')

Vue.component 'expression',
  template: '#expression'
  data:
    folded: no
  methods:
    toggle: (event) ->
      event.stopPropagation()
      @folded = not @folded
    render: (token) ->
      cond = token.split('').some (x) ->
        x in ',"()$ '.split('')
      if cond then "\"#{token}\""
      else token

app = new Vue
  el: '#app'
  data:
    code: 'a $ b $ c'
  computed:
    statements: ->
      parseShort @code
  methods:
    isExpression: (x) ->
      Array.isArray x
    isToken: (x) ->
      (typeof x) is 'string'