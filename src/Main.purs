module Main where

import Prelude

import App.Game as Game
import Effect (Effect)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runUI Game.component unit body

{-
SOLITAIRE: components:
- Deck in top-left (FaceDown deck and FaceUp deck)
- pilesx4 in top-right (one for each suit)
- stacksx7 in main play area

don't try drag/drop (yet?) - use a "click" interface which brings up a menu with possible movement destinations
generic "card" component - states of face-up, face-down?
need a general event handler for each FU one for the "movement" interface
1st pass - no interaction, just random deal and display result in some form

"root" Game component which takes a deck (array of randomly-shuffled cards) as input.
Going to work on laying that out first.
"actual" root component will eventually contain other UI elements (eg New Game button),
but for now will just render Game but randomly shuffle the deck on initialisation
(that's the second stage, the first will just take a fixed layout)
-}