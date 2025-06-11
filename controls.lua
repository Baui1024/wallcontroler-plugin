ButtonType = {
  "Momentary",
  "Momentary",
  "Momentary",
  "Momentary",
}

if props["Operation Mode"].Value == "Raw" then

elseif props["Operation Mode"].Value == "Predefined Top/Bottom" then
  if props["Top Buttons Mode"].Value == "Radio Buttons" then
    ButtonType[1] = "Toggle"
    ButtonType[2] = "Toggle"
  elseif props["Top Buttons Mode"].Value == "Individual" then
    for i = 1, 2 do
      if props["Button " .. i .. " Mode"].Value == "Trigger" then
        ButtonType[i] = "Trigger"
      elseif props["Button " .. i .. " Mode"].Value == "Toggle" then
        ButtonType[i] = "Toggle"
      end
    end
  end
  if props["Bottom Buttons Mode"].Value == "Radio Buttons" then
    ButtonType[3] = "Toggle"
    ButtonType[4] = "Toggle"
  elseif props["Bottom Buttons Mode"].Value == "Individual" then
    for i = 3, 4 do
      if props["Button " .. i .. " Mode"].Value == "Trigger" then
        ButtonType[i] = "Trigger"
      elseif props["Button " .. i .. " Mode"].Value == "Toggle" then
        ButtonType[i] = "Toggle"
      end
    end
  end
elseif props["Operation Mode"].Value == "Predefined Left/Right" then
  if props["Left Buttons Mode"].Value == "Radio Buttons" then
      ButtonType[1] = "Toggle"
      ButtonType[3] = "Toggle"
    elseif props["Top Buttons Mode"].Value == "Individual" then
      for i = 1, 3, 2 do
        if props["Button " .. i .. " Mode"].Value == "Trigger" then
          ButtonType[i] = "Trigger"
        elseif props["Button " .. i .. " Mode"].Value == "Toggle" then
          ButtonType[i] = "Toggle"
        end
      end
    end
    if props["Bottom Buttons Mode"].Value == "Radio Buttons" then
      ButtonType[2] = "Toggle"
      ButtonType[4] = "Toggle"
    elseif props["Bottom Buttons Mode"].Value == "Individual" then
      for i = 2, 4, 2 do
        if props["Button " .. i .. " Mode"].Value == "Trigger" then
          ButtonType[i] = "Trigger"
        elseif props["Button " .. i .. " Mode"].Value == "Toggle" then
          ButtonType[i] = "Toggle"
        end
      end
    end
end

if props["Color Mode"].Value == "Pre-defined Options" then
  DefaultColorOn = "Green"
  DefaultColorOff = "Red"
else
  DefaultColorOn = "#00FF00"
  DefaultColorOff = "#FF0000"
end

for i = 1, 4 do 
  table.insert(ctrls, {
    Name = "Button" .. i,
    ControlType = "Button",
    ButtonType = ButtonType[i],
    Count = 1,
    UserPin = true,
    PinStyle = "Both",
  })
  table.insert(ctrls, {
    Name = "Color" .. i,
    ControlType = "Text",
    Count = 1,
    UserPin = true,
    DefaultValue = DefaultColorOn,
    PinStyle = "Both",
  })
  table.insert(ctrls, {
    Name = "ColorOn" .. i,
    ControlType = "Text",
    Count = 1,
    UserPin = true,
    DefaultValue = DefaultColorOn,
    PinStyle = "Both",
  })
  table.insert(ctrls, {
    Name = "ColorOff" .. i,
    ControlType = "Text",
    Count = 1,
    UserPin = true,
    DefaultValue = DefaultColorOff,
    PinStyle = "Both",
  })
end
table.insert(ctrls, {
  Name = "Status",
  ControlType = "Indicator",
  IndicatorType = "Status",
  Count = 1,
  UserPin = true,
  PinStyle = "Both",
})
table.insert(ctrls, {
  Name = "IP",
  ControlType = "Text",
  Count = 1,
  UserPin = true,
  PinStyle = "Both",
})