module App.Game where

import Prelude

import Data.Maybe (Maybe(..))
import Effect.Class (class MonadEffect)
import General.Cards (Deck(..), shuffled)
import Halogen as H
import Halogen.HTML as HH
--import Halogen.HTML.Events as HE

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

render :: forall cs m. Deck -> H.ComponentHTML Action cs m
render (Deck cards) =
  HH.div_ $
    map (\card -> HH.p_ [ HH.text $ show card ]) cards


handleAction :: forall cs o m. MonadEffect m => Action → H.HalogenM Deck Action cs o m Unit
handleAction = case _ of
  Shuffle -> do
    shuffledDeck <- H.liftEffect shuffled
    H.put $ Deck shuffledDeck
