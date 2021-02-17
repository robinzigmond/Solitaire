module App.CardFaceUp where

import Prelude

import General.Cards (Card)
import Halogen as H
import Halogen.HTML as HH

--import Halogen.HTML.Events as HE

type Input = Card

type State = Input

cardComponent :: forall q o m. H.Component HH.HTML q Input o m
cardComponent =
  H.mkComponent
    { initialState: identity
    , render
    , eval: H.mkEval $ H.defaultEval
    }

render :: forall a cs m. State -> H.ComponentHTML a cs m
render card =
  HH.div_ [
      HH.text $ show card,
      HH.text $ show card
  ]
