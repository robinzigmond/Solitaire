module App.CSS.GlobalStyles where

-- this is just a proof of concept for me that CSS works, these are not yet "real" styles!

import Prelude

import Color as Color
import CSS as CSS
import Halogen.HTML (HTML)
import Halogen.HTML.CSS (stylesheet)

styles :: forall i p. HTML p i
styles = stylesheet $
  CSS.select (CSS.fromString "body") $ do
    CSS.color $ Color.rgb 255 0 0