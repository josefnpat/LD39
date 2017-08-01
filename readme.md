# Save Atlantis

## About

This game was made for LD39. This is a physical card game!

## Story

You find yourself stranded on the fabled island of Atlantis. Once a spectacular nation, now it lies in shambles due to a plague. You have a battery powered HEV suit for protection, but the battery power is running out. Play this exciting card game and see who can last the longest!

## Requirements

* A set of Save Atlantis cards. (A standard 52 card deck can be substituted for this)
* A power die, perhaps a six sided die, for each player.
* A token for each player. (a miniature figurine or a beer bottle cap)
* 2 to 4 players.

## Game Setup

1. Shuffle the deck.
2. Each player draws five cards.
3. Place a single card face down on the table.
4. Each player chooses and places a token on top of the face down card.
5. Each player takes a power die and places it's highest value upwards.

## Gameplay

The goal of the game is to be the last one in the game.

If your power die reaches zero (e.g. you have one power, and must reduce it) you are removed from the game.

### Start of Turn

Each player takes turns, starting with the cutest. (You may fight amongst yourselves over this qualifier)

#### At the start of your turn:

1. Reduce your power die by one.
2. Draw a card into your hand.
3. Draw a second card without looking at it, and place it adjacent to any card on the table.

_Note: Your card must be able to fit on the table. If you only have room for one card, consider finding a larger table, you nut._

#### Phase 2 - During your turn you may:

1. Move to an adjacent card that is face down. 

* For every move you make, reduce your power die by 1. (You must have 2 or more power to move or you will die)
* Flip that card right-side up and activate it. Follow the instructions on the card.
2. Play any card from your hand.

* Any card played may be countered (or nullified) by anyone who plays a card with a value higher than the card you are playing.
* Face cards cannot be countered

You may choose to do (1) and (2) as much as you are able to. Your turn ends when you have exhausted your ability do either 1 or 2 or you declare your turn over. 

## Game play without Save Atlantis cards

__These instructions are if you only have a standard 52 card deck__

If you activate a:

* diamond (a recharge card), recharge your power die up to two.
* spade (a bomb card), you may destroy any card on the table that does not have a player on it.
* heart (a build card), you must draw a card, and place it face down somewhere on the table adjacent to another card.
* club (a vision card), you may personally reveal a face down card to yourself. You can choose to flip that card face up. If you do, it does not activate.

Aces are low.

If you land on a face card, you must discard a card. If the discarded card is a face card:

1. You draw two cards
2. Activate the face card's suit that you landed on, twice.

## Build

1. Run love (0.10.2) against the src folder, which builds the cards in your save directory.
2. Move the cards to build/cards/
3. run build/montage.sh from the build folder
4. output-*.png is what you're looking for

## Credits

* Creative Direction, Game Mechanics and Programming: [@josefnpat](http://twitter.com/josefnpat)
* Art and Playtesting: [@bytedesigning](http://twitter.com/bytedesigning)
* Graphic Design, Playtesting and Asshatery: [@artschu](http://twitter.com/artschu)
* Playtesting and Assistant Nacho Manager: [@chrisronin](http://twitter.com/chrisronin)
* Playtesting and Music: [@eternalnightpro](http://twitter.com/eternalnightpro)