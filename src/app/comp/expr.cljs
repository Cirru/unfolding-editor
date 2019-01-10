
(ns app.comp.expr
  (:require [hsl.core :refer [hsl]]
            [respo-ui.core :as ui]
            [respo.core :refer [defcomp cursor-> list-> <> div button textarea span]]
            [respo.comp.space :refer [=<]]
            [reel.comp.reel :refer [comp-reel]]
            [respo-md.comp.md :refer [comp-md]]
            [app.config :refer [dev?]]))

(defcomp
 comp-leaf
 (text)
 (div
  {:style {:font-family ui/font-code,
           :margin "0 4px",
           :background-color (hsl 0 0 30 0.8),
           :color :white,
           :padding "0 4px",
           :line-height "24px"}}
  (<> text)))

(defcomp
 comp-expr
 (states expr)
 (list->
  {:style (merge ui/row {:align-items :flex-start})}
  (->> expr
       (map-indexed
        (fn [idx x]
          [idx
           (if (vector? x)
             (div
              {:style (merge ui/column {:border-top (str "8px solid " (hsl 0 0 90))})}
              (<> x)
              (cursor-> idx comp-expr states x))
             (comp-leaf x))])))))
