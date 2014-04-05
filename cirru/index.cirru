
doctype
html
  head
    title (= Folding Code)
    meta (:charset utf-8)
    link (:rel stylesheet) (:href css/style.css)
    script (:defer) (:src build/build.js)
    @partial expression.cirru
  @partial tree.cirru