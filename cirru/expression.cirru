script#expression
  :type text/x-template
  .expression
    :v-if "isExpression($value)"
    :v-on "click: toggle"
    :v-class "folded: folded"
    span.node
      :v-repeat node
      span
        :v-component expression
        :v-with "node: $value"
  span.token
    :v-if "isToken($value)"
    :v-model "render($value)"