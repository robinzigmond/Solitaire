module App.Game where

import Prelude

import App.CSS.GlobalStyles (styles)
import App.CardFaceUp (cardComponent)
import Data.Array ((:), mapWithIndex)
import Data.Maybe (Maybe(..))
import Data.Symbol (SProxy(..))
import Data.Tuple (Tuple(..))
import Effect.Class (class MonadEffect)
import General.Cards (Deck(..), shuffled)
import Halogen as H
import Halogen.HTML as HH

type Slots = ( cardComponent :: forall q. H.Slot q Void Unit )

_card = SProxy :: SProxy "cardComponent"

type State = Deck

data Action = Shuffle

component :: forall q i o m. MonadEffect m => H.Component HH.HTML q i o m
component =
  H.mkComponent
    { initialState: \_ -> Deck []
    , render
    , eval: H.mkEval $ H.defaultEval
      { handleAction = handleAction
      , initialize = Just Shuffle
      }
    }

render :: forall m. Deck -> H.ComponentHTML Action Slots m
render (Deck cards) =
  HH.div_ $
    styles :
    mapWithIndex (\idx card -> HH.slot _card unit cardComponent (Tuple card idx) (\_ -> Nothing)) cards


handleAction :: forall cs o m. MonadEffect m => Action → H.HalogenM Deck Action cs o m Unit
handleAction = case _ of
  Shuffle -> do
    shuffledDeck <- H.liftEffect shuffled
    H.put $ Deck shuffledDeck
