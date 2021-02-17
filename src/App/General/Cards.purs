module General.Cards where

import Prelude

import Data.Array ((!!), (:), deleteAt, null, length)
import Data.Maybe (fromJust)
import Effect (Effect)
import Effect.Random (randomInt)
import Partial.Unsafe (unsafePartial)

data Suit = Spade | Heart | Diamond | Club

instance showSuit :: Show Suit where
  show Spade = "S"
  show Heart = "H"
  show Diamond = "D"
  show Club = "C"

data Rank = Ace | Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King

instance showRank :: Show Rank where
  show Ace = "A"
  show Two = "2"
  show Three = "3"
  show Four = "4"
  show Five = "5"
  show Six = "6"
  show Seven = "7"
  show Eight = "8"
  show Nine = "9"
  show Ten = "10"
  show Jack = "J"
  show Queen = "Q"
  show King = "K"

data Card = Card Rank Suit

instance showCard :: Show Card where
  show (Card rank suit) = show suit <> show rank

newtype Deck = Deck (Array Card)

unshuffled :: Array Card
unshuffled = Card <$> allRanks <*> allSuits
  where allRanks = [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]
        allSuits = [Spade, Heart, Diamond, Club]

shuffle :: forall a. Array a -> Effect (Array a)
shuffle arr = go [] arr
  where go got left = if null left
    then pure got
    else do
          let len = length left
          index <- randomInt 0 (len - 1)
          let chosen = unsafePartial $ fromJust $ left !! index
          go (chosen : got) $ unsafePartial $ fromJust $ deleteAt index left 


shuffled :: Effect (Array Card)
shuffled = shuffle unshuffled
