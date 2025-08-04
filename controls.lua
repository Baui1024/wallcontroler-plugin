table.insert(ctrls,{Name = "code",ControlType = "Text",PinStyle = "Input",Count = 1})
ButtonType = {
  "Momentary",
  "Momentary",
  "Momentary",
  "Momentary",
}

if props["Operation Mode"].Value == "Individual" then
  for i = 1, #ButtonType do
    ButtonType[i] = props["Button " .. i .. " Mode"].Value
  end
elseif props["Operation Mode"].Value == "Predefined Top/Bottom" then
  if props["Top Buttons Mode"].Value == "Radio Buttons" then
    ButtonType[1] = "Toggle"
    ButtonType[2] = "Toggle"
  elseif props["Top Buttons Mode"].Value == "Individual" then
    for i = 1, 2 do
      ButtonType[i] = "Toggle"
    end
  end
  if props["Bottom Buttons Mode"].Value == "Radio Buttons" then
    ButtonType[3] = "Toggle"
    ButtonType[4] = "Toggle"
  elseif props["Bottom Buttons Mode"].Value == "Individual" then
    for i = 3, 4 do
      ButtonType[i] = "Toggle"
    end
  end
elseif props["Operation Mode"].Value == "Predefined Left/Right" then
  if props["Left Buttons Mode"].Value == "Radio Buttons" then
    ButtonType[1] = "Toggle"
    ButtonType[3] = "Toggle"
  elseif props["Left Buttons Mode"].Value == "Individual" then
    for i = 1, 3, 2 do
      ButtonType[i] = "Toggle"
    end
  end
  if props["Right Buttons Mode"].Value == "Radio Buttons" then
    ButtonType[2] = "Toggle"
    ButtonType[4] = "Toggle"
  elseif props["Right Buttons Mode"].Value == "Individual" then
    for i = 2, 4, 2 do
      ButtonType[i] = "Trigger"
    end
  end
end

if props["Color Mode"].Value == "Pre-defined Options" then
  DefaultColorOn = "White"
  DefaultColorOff = "Off"
  DefaultColorBlink = "Amber"
else
  DefaultColorOn = "#FFFFFF"
  DefaultColorOff = "#000000"
  DefaultColorBlink = "#FFBF00"
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
    Name = "ColorOnIndicator" .. i,
    ControlType = "Indicator",
    IndicatorType = "Led",
    Count = 1,
    UserPin = false,
    DefaultValue = 20,
    PinStyle = "None",
  })
  table.insert(ctrls, {
    Name = "ColorOff" .. i,
    ControlType = "Text",
    Count = 1,
    UserPin = true,
    DefaultValue = DefaultColorOff,
    PinStyle = "Both",
  })
  table.insert(ctrls, {
    Name = "ColorOffIndicator" .. i,
    ControlType = "Indicator",
    IndicatorType = "Led",
    Count = 1,
    UserPin = false,
    DefaultValue = 20,
    PinStyle = "None",
  })
  table.insert(ctrls, {
    Name = "ColorBlink" .. i,
    ControlType = "Text",
    Count = 1,
    UserPin = true,
    DefaultValue = DefaultColorBlink,
    PinStyle = "Both",
  })
  table.insert(ctrls, {
    Name = "ColorBlinkIndicator" .. i,
    ControlType = "Indicator",
    IndicatorType = "Led",
    Count = 1,
    UserPin = false,
    DefaultValue = 20,
    PinStyle = "None",
  })
  table.insert(ctrls,{
    Name = "ShortPress" .. i,
    ControlType = "Indicator", 
    IndicatorType = "Led",
    Count = 1,
    UserPin = false,
    PinStyle = "Output",
  })
  table.insert(ctrls,{
    Name = "LongPress" .. i,
    ControlType = "Indicator", 
    IndicatorType = "Led",
    Count = 1,
    UserPin = false,
    PinStyle = "Output",
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
table.insert(ctrls, {
  Name = "ButtonLock",
  ControlType = "Button",
  ButtonType = "Toggle",
  Count = 1,
  UserPin = true,
  PinStyle = "Both",
})
table.insert(ctrls, {
  Name = "Brightness",
  ControlType = "Knob",
  ControlUnit = "Percent",
  Count = 1,
  Min = 0,
  Max = 100,
  DefaultValue = 100,
  UserPin = true,
  PinStyle = "Both",
})