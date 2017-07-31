frame = love.graphics.newImage("frame.png")
suits = {
  {
    name="spade",
    play="destroy any placed card that does not have a player on it.",
    image = love.graphics.newImage("spade.png"),
    bg = love.graphics.newImage("bg_spade.png")
  },
  {
    name="heart",
    play="draw a card into your hand and then place a card on the table from your hand face down adjacent to another card.",
    image = love.graphics.newImage("heart.png"),
    bg = love.graphics.newImage("bg_heart.png")
  },
  {
    name="diamond",
    play="add up to two on your power die for a maximum of six.",
    image = love.graphics.newImage("diamond.png"),
    bg = love.graphics.newImage("bg_diamond.png")
  },
  {
    name="clubs",
    play="privately look at any face down card on the table. You may flip the card over. If you do, skips the activation phase.",
    image = love.graphics.newImage("club.png"),
    bg = love.graphics.newImage("bg_club.png")
  },
}

activate_it = "If this card is revealed when stepped on, activate it."
activate_it2 = "If this card is revealed when stepped on, discard a card. If that card is a face card, draw two cards and activate this card twice."

values = {
  {
    name="1",
  },
  {
    name="2",
    play = "counter any card with a value of 1.",
    rules = {activate_it},
  },
  {
    name="3",
    play = "counter any card with a value of 2 or less.",
    rules = {activate_it},
  },
  {
    name="4",
    play = "counter any card with a value of 3 or less.",
    rules = {activate_it},
  },
  {
    name="5",
    play = "counter any card with a value of 4 or less.",
    rules = {activate_it},
  },
  {
    name="6",
    play = "counter any card with a value of 5 or less.",
    rules = {activate_it},
  },
  {
    name="7",
    play = "counter any card with a value of 6 or less.",
    rules = {activate_it},
  },
  {
    name="8",
    play = "counter any card with a value of 7 or less.",
    rules = {activate_it},
  },
  {
    name="9",
    play = "counter any card with a value of 8 or less.",
    rules = {activate_it},
  },
  {
    name="10",
    rules = {activate_it},
    play = "counter any card with a value of 9 or less.",
  },
  {
    name="J",
    rules = {activate_it2},
    image = love.graphics.newImage("jack.png"),
  },
  {
    name="Q",
    rules = {activate_it2},
    image = love.graphics.newImage("queen.png"),
  },
  {
    name="K",
    rules = {activate_it2},
    image = love.graphics.newImage("king.png"),
  },
}

fonts = {
  default = love.graphics.newFont(12),
  suit = love.graphics.newFont("fonts/Montserrat-Regular.ttf",64),
  value = love.graphics.newFont("fonts/Montserrat-Regular.ttf",64),
  text = love.graphics.newFont("fonts/Montserrat-Regular.ttf",24),
}

cards = {}

for _,suit in pairs(suits) do
  for _,value in pairs(values) do
    local card = {
      suit = suit,
      value = value,
      frame = frame,
    }
    table.insert(cards,card)
  end
end

function love.load(args)
  current = 0
  for _,arg in pairs(args) do
    local single = tonumber(arg)
    if single then
      create(single,cards[single])
      love.event.quit()
    end
  end
end

function create(id,card)

  love.graphics.setColor(255,255,255)
  love.graphics.rectangle("fill",0,0,
    love.graphics.getWidth(),love.graphics.getHeight())

  local padding = {x=107,y=107}
  love.graphics.draw(card.suit.bg)
  if card.value.image then
    love.graphics.draw(card.value.image)
  else
    love.graphics.draw(card.suit.image)
  end
  love.graphics.draw(card.frame)

  love.graphics.setFont(fonts.suit)
  love.graphics.printf(card.suit,padding.x,248,
    love.graphics.getWidth()-padding.x*2,"center")

  love.graphics.setFont(fonts.value)
  love.graphics.printf(card.value.name,padding.x,padding.y,
    love.graphics.getWidth()-padding.x*2,"left")

  local text_padding = {x=131,y=802}
  local text = ""
  if card.value.play then
    text = text .. "Discard this card at any time to "..card.value.play.." "
  end
  if card.value.rules then
    for i,v in pairs(card.value.rules) do
      text = text .. v .. " "
    end
  end
  if card.suit.play then
    text = text .. "You may discard this card during your turn to activate it. "
    text = text .. "When this card is activated, "..card.suit.play.." "
  end
  love.graphics.setFont(fonts.text)
  for i,v in pairs({{0,0,0,255*0.8},{255,255,255}}) do
    love.graphics.setColor(v)
    local offset = i == 1 and 2 or 0
    love.graphics.printf(text,text_padding.x+offset,text_padding.y+offset,
      love.graphics.getWidth()-text_padding.x*2,"center")
  end
  love.graphics.setColor(255,255,255)

  love.graphics.setFont(fonts.default)
  love.graphics.print("id:"..id)
  local ss = love.graphics.newScreenshot()
  ss:encode('png',id..'.png')
end

function love.draw()

  current = current + 1
  local card = cards[current]
  if card then
    create(current,card)
  else
    love.event.quit()
  end

end
