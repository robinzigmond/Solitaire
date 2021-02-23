module App.CardFaceUp where

import Prelude

import CSS as CSS
import Color as Color
import Data.Int (toNumber)
import Data.Tuple (Tuple)
import Data.Tuple.Nested ((/\))
import General.Cards (Card(..), Suit(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.CSS (style)
import Halogen.HTML.Properties as HP

type Input = Tuple Card Int

type State = Input

cardComponent :: forall q o m. H.Component HH.HTML q Input o m
cardComponent =
  H.mkComponent
    { initialState: identity
    , render
    , eval: H.mkEval $ H.defaultEval
    }

render :: forall a cs m. State -> H.ComponentHTML a cs m
render (card@(Card _ suit) /\ idx)=
  HH.div [
    HP.classes [ HH.ClassName componentCssClass, HH.ClassName cardColour ],
    inlineStyle (toNumber idx)
  ] [
      HH.div [ HP.class_ (HH.ClassName "top-left") ] [ HH.text $ show card ],
      HH.div [ HP.class_ (HH.ClassName "bottom-right") ] [ HH.text $ show card ]
  ]
  where cardColour = case suit of
          Spade -> "black"
          Heart -> "red"
          Diamond -> "red"
          Club -> "black"

        inlineStyle index = style do
          CSS.bottom $ CSS.px $ (index * 100.0)
          CSS.left $ CSS.px $ (index * 15.0)

componentCssClass :: String
componentCssClass = "card"

styles :: CSS.CSS
styles = do
  CSS.select (CSS.fromString $ "." <> componentCssClass) $ do
    CSS.position $ CSS.relative
    CSS.backgroundColor $ Color.rgb 255 255 255
    CSS.border (CSS.solid) (CSS.px 2.0) (Color.rgb 0 0 0)
    CSS.height $ CSS.px 120.0
    CSS.width $ CSS.px 80.0
    CSS.select (CSS.fromString ".top-left") $ do
      CSS.position $ CSS.absolute
      CSS.top $ CSS.px 5.0
      CSS.left $ CSS.px 5.0
    CSS.select (CSS.fromString ".bottom-right") $ do
      CSS.position $ CSS.absolute
      CSS.bottom $ CSS.px 5.0
      CSS.right $ CSS.px 5.0
  CSS.select (CSS.fromString $ "." <> componentCssClass <> ".red") $ do
    CSS.color $ Color.rgb 255 0 0
  CSS.select (CSS.fromString $ "." <> componentCssClass <> ".black") $ do
    CSS.color $ Color.rgb 0 0 0
