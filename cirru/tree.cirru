body#app
  textarea#code
    :v-model code
    :placeholder "write Cirru code"
  #statements
    :title "tree of the code left"
    .statement
      :v-repeat statements
      span
        :v-component expression
        :v-with "node: $value"