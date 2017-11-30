frame = love.graphics.newImage("frame.png")
suits = {
  {
    name="spade",
    play="SUIT POWER: DESTROY\nRemove any one (1) card from the field and place in discard pile. Card must not have a player on it.",
    image = love.graphics.newImage("spade.png"),
    bg = love.graphics.newImage("bg_spade.png")
  },
  {
    name="heart",
    play="SUIT POWER: BUILD\nDraw one (1) card, then place any card from your hand onto the field, adjacent to another card.",
    image = love.graphics.newImage("heart.png"),
    bg = love.graphics.newImage("bg_heart.png")
  },
  {
    name="diamond",
    play="SUIT POWER: RECHARGE\nRaise your POWER DIE by two (2). Maximum six (6).",
    image = love.graphics.newImage("diamond.png"),
    bg = love.graphics.newImage("bg_diamond.png")
  },
  {
    name="clubs",
    play="SUIT POWER: VISION\nPrivately look at one (1) face down card on the field. You may A) Flip card face up to nullify card or B) Leave it.",
    image = love.graphics.newImage("club.png"),
    bg = love.graphics.newImage("bg_club.png")
  },
}

common_1 = "This card is activated when flipped or played from hand on the player’s turn. If played from hand, discard immediately. A played card can be countered by any card of greater value (excluding MONSTER CARDS)."
common_2 = "This card is activated when flipped. Player must discard one (1) card from hand. If discarded card is a MONSTER CARD, activate that one’s SUIT POWER twice and draw two (2) cards."

values = {
  {
    name="1",
    play = common_1,
  },
  {
    name="2",
    play = common_1,
  },
  {
    name="3",
    play = common_1,
  },
  {
    name="4",
    play = common_1,
  },
  {
    name="5",
    play = common_1,
  },
  {
    name="6",
    play = common_1,
  },
  {
    name="7",
    play = common_1,
  },
  {
    name="8",
    play = common_1,
  },
  {
    name="9",
    play = common_1,
  },
  {
    name="10",
    play = common_1,
  },
  {
    name="J",
    play = common_2,
    image = love.graphics.newImage("jack.png"),
  },
  {
    name="Q",
    play = common_2,
    image = love.graphics.newImage("queen.png"),
  },
  {
    name="K",
    play = common_2,
    image = love.graphics.newImage("king.png"),
  },
}

fonts = {
  default = love.graphics.newFont(12),
  value = love.graphics.newFont("fonts/Montserrat-Regular.ttf",89),
  text = love.graphics.newFont("fonts/Alike-Regular.ttf",22),
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

function love.quit()
  love.system.openURL(love.filesystem.getSaveDirectory())
end

function create(id,card)

  love.graphics.setColor(255,255,255)
  love.graphics.rectangle("fill",0,0,
    love.graphics.getWidth(),love.graphics.getHeight())

  local padding = {x=57,y=107}
  love.graphics.draw(card.suit.bg)
  if card.value.image then
    love.graphics.draw(card.value.image)
  else
    love.graphics.draw(card.suit.image)
  end
  love.graphics.draw(card.frame)

  love.graphics.setFont(fonts.value)
  love.graphics.setColor(0,0,0,255*0.8)
  local value_width = 189
  local offset = 2
  for x = -2,2 do
    for y = -2,2 do
      love.graphics.printf(card.value.name,padding.x+offset*x,padding.y+offset*y,
        value_width,"center")
    end
  end
  love.graphics.setColor(255,255,255)
  love.graphics.printf(card.value.name,padding.x,padding.y,
    value_width,"center")

  local text_padding = {x=131-24,y=802}
  local text = ""
  if card.suit then
    text = text .. card.suit.play
  end
  text = text .. "\n\n"
  if card.value.play then
    text = text .. card.value.play
  end
  love.graphics.setFont(fonts.text)

  love.graphics.setColor(0,0,0,255*0.8)
  local offset = 2
  offset = 0
  love.graphics.setColor(0,0,0)
    love.graphics.printf(text,text_padding.x+offset,text_padding.y+offset,
      love.graphics.getWidth()-text_padding.x*2,"left")

  love.graphics.setFont(fonts.default)
  love.graphics.print("id:"..id)
  local ss = love.graphics.newScreenshot()
  local fname = id..".png"

  if true then
    ss:encode('png',fname)
  else
    local extra = "build/cards/"
    local f

    f = io.open(love.filesystem.getSaveDirectory().."/"..fname,'rb')
    local content = f:read("*all")
    f:close()

    local content = ss:getString()

    f = io.open(love.filesystem.getWorkingDirectory().."/"..extra..fname,'w')
    f:write(content)
    f:close()
  end

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
