module App.CSS.GlobalStyles where

-- this is just a proof of concept for me that CSS works, these are not yet "real" styles!

import Prelude

import App.CardFaceUp as CardFaceUp
import Halogen.HTML (HTML)
import Halogen.HTML.CSS (stylesheet)

styles :: forall i p. HTML p i
styles = stylesheet $ do
  CardFaceUp.styles
