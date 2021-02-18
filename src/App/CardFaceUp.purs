module App.CardFaceUp where

import Prelude

import Color as Color
import CSS as CSS
import General.Cards (Card(..), Suit(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

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
render card@(Card _ suit) =
  HH.div [ HP.classes [ HH.ClassName componentCssClass, HH.ClassName cardColour ] ] [
      HH.div [ HP.class_ (HH.ClassName "top-left") ] [ HH.text $ show card ],
      HH.div [ HP.class_ (HH.ClassName "bottom-right") ] [ HH.text $ show card ]
  ]
  where cardColour = case suit of
          Spade -> "black"
          Heart -> "red"
          Diamond -> "red"
          Club -> "black"

componentCssClass :: String
componentCssClass = "card"

styles :: CSS.CSS
styles = do
  CSS.select (CSS.fromString $ "." <> componentCssClass) $ do
    CSS.position $ CSS.relative
    CSS.border (CSS.solid) (CSS.px 2.0) (Color.rgb 0 0 0)
    CSS.height $ CSS.px 120.0
    CSS.width $ CSS.px 80.0
    CSS.select (CSS.fromString ".top-left") $ do
      CSS.position $ CSS.absolute
      CSS.top $ CSS.px 10.0
      CSS.left $ CSS.px 10.0
    CSS.select (CSS.fromString ".bottom-right") $ do
      CSS.position $ CSS.absolute
      CSS.bottom $ CSS.px 10.0
      CSS.right $ CSS.px 10.0
  CSS.select (CSS.fromString $ "." <> componentCssClass <> ".red") $ do
    CSS.color $ Color.rgb 255 0 0
  CSS.select (CSS.fromString $ "." <> componentCssClass <> ".black") $ do
    CSS.color $ Color.rgb 0 0 0
