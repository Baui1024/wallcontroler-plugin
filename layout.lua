table.insert(graphics,{Type = "GroupBox",Fill = White,CornerRadius = 0,Position = {0,0},Size = {446,75}})
table.insert(graphics,{Type = "GroupBox",Fill = Grey,CornerRadius = 0,Position = {11,75},Size = {425,482}})
table.insert(graphics,{Type = "Header",Text = "Connection & Status",Color = Black,Font = "Roboto",FontSize = 14,FontStyle = "Regular",HTextAlign = "Center",Position = {42,86},Size = {364,6}})
table.insert(graphics,{Type = "Label",Text = "IP Address",Fill = Clear,Font = "Roboto",FontSize = 11,HTextAlign = "Right",Position = {108,111},Size = {65,16}})
layout["IP"] = {PrettyName = "IP Address",Style = "Text",CornerRadius = 0,Margin = 0,Position = {186,111},Size = {153,16}}
layout["Status"] = {PrettyName = "Status",Style = "Text",CornerRadius = 0,Margin = 0,Position = {108,137},Size = {231,32}}

table.insert(graphics,{Type = "Header",Text = "Controls",Color = Black,Font = "Roboto",FontSize = 14,FontStyle = "Regular",HTextAlign = "Center",Position = {42,190},Size = {364,6}})

ColorStyle = props["Color Mode"].Value == "Pre-defined Options" and "ComboBox" or "Text"

DualColorOptions = {
  true,
  true,
  true,
  true
}

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
  elseif props["Left Buttons Mode"].Value == "Individual" then
    for i = 1, 3, 2 do
      if props["Button " .. i .. " Mode"].Value == "Trigger" then
        ButtonType[i] = "Trigger"
      elseif props["Button " .. i .. " Mode"].Value == "Toggle" then
        ButtonType[i] = "Toggle"
      end
    end
  end
  if props["Right Buttons Mode"].Value == "Radio Buttons" then
    ButtonType[2] = "Toggle"
    ButtonType[4] = "Toggle"
  elseif props["Right Buttons Mode"].Value == "Individual" then
    for i = 2, 4, 2 do
      if props["Button " .. i .. " Mode"].Value == "Trigger" then
        ButtonType[i] = "Trigger"
      elseif props["Button " .. i .. " Mode"].Value == "Toggle" then
        ButtonType[i] = "Toggle"
      end
    end
  end
end

LabelIndexPos = {
  {57,214},
  {250,214},
  {57,348},
  {250,348}
}
LabelButtonPos = {
  {42,256},
  {236,256},
  {42,390},
  {236,390}
}
ButtonPos = {
  {93,243},
  {287,243},
  {93,377},
  {287,377}
}

for i = 1, 4 do
  table.insert(graphics,{Type = "Label",Text = tostring(i),Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Center",Position = LabelIndexPos[i],Size = {142,29}})
  table.insert(graphics,{Type = "Label",Text = "Button",Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Center",Position = LabelButtonPos[i],Size = {51,20}})
  table.insert(graphics,{Type = "Label",Text = "Short",Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Left",Position = {ButtonPos[i][1]+87,ButtonPos[i][2]+2},Size = {51,20}})
  layout["ShortPress"..i] = {PrettyName = "Short Press "..i,Style = "Led", Margin = 2, CornerRadius = 0,Position = {ButtonPos[i][1]+71,ButtonPos[i][2]+4},Size = {16,16}}
  -- if props["Operation Mode"].Value == "Individual" or props["Top Buttons Mode"].Value == "Individual" and (i == 1 or i == 2) or props["Bottom Buttons Mode"].Value == "Individual" and (i == 3 or i == 4) then
  --  if props["Button " .. i .. " Mode"].Value == "Momentary" then
      
  --   end  
  -- end
  table.insert(graphics,{Type = "Label",Text = "Long",Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Left",Position = {ButtonPos[i][1]+87,ButtonPos[i][2]+23},Size = {51,20}})
  layout["LongPress"..i] = {PrettyName = "Long Press "..i,Style = "Led", Margin = 2, CornerRadius = 0,Position = {ButtonPos[i][1]+71,ButtonPos[i][2]+25},Size = {16,16}}

  if DualColorOptions[i] then
    table.insert(graphics,{Type = "Label",Text = "Color On",Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Center",Position = {LabelButtonPos[i][1],LabelButtonPos[i][2]+32},Size = {51,20}})
    table.insert(graphics,{Type = "Label",Text = "Color Off",Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Center",Position = {LabelButtonPos[i][1],LabelButtonPos[i][2]+52},Size = {51,20}})
    layout["ColorOn"..i] = {PrettyName = "Color On "..i,Style = ColorStyle, TextBoxStyle = "Normal",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51,LabelButtonPos[i][2]+32},Size = {71,20}}
    layout["ColorOnIndicator"..i] = {PrettyName = "Color On "..i,Style = "Meter", MeterStyle = "Level",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51+71,LabelButtonPos[i][2]+32},Size = {20,20}}
    layout["ColorOff"..i] = {PrettyName = "Color Off "..i,Style = ColorStyle, TextBoxStyle = "Normal",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51,LabelButtonPos[i][2]+52},Size = {71,20}}
    layout["ColorOffIndicator"..i] = {PrettyName = "Color Off "..i,Style = "Meter", MeterStyle = "Level",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51+71,LabelButtonPos[i][2]+52},Size = {20,20}}
    if props["Operation Mode"].Value == "Predefined Top/Bottom" and props["Top Buttons Mode"].Value == "Radio Buttons" and (i == 1 or i == 2) and props["Radio Button Interlock Blink Top/Left"].Value == "Yes" then
      table.insert(graphics,{Type = "Label",Text = "Color Blink",Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Center",Position = {LabelButtonPos[i][1]-4,LabelButtonPos[i][2]+72},Size = {59,20}})
      layout["ColorBlink"..i] = {PrettyName = "Color Blink "..i,Style = ColorStyle, TextBoxStyle = "Normal",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51,LabelButtonPos[i][2]+72},Size = {71,20}}
      layout["ColorBlinkIndicator"..i] = {PrettyName = "Color Blink "..i,Style = "Meter", MeterStyle = "Level",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51+71,LabelButtonPos[i][2]+72},Size = {20,20}}
    elseif props["Operation Mode"].Value == "Predefined Top/Bottom" and props["Bottom Buttons Mode"].Value == "Radio Buttons" and (i == 3 or i == 4) and props["Radio Button Interlock Blink Bottom/Right"].Value == "Yes" then
      table.insert(graphics,{Type = "Label",Text = "Color Blink",Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Center",Position = {LabelButtonPos[i][1]-4,LabelButtonPos[i][2]+72},Size = {59,20}})
      layout["ColorBlink"..i] = {PrettyName = "Color Blink "..i,Style = ColorStyle, TextBoxStyle = "Normal",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51,LabelButtonPos[i][2]+72},Size = {71,20}}
      layout["ColorBlinkIndicator"..i] = {PrettyName = "Color Blink "..i,Style = "Meter", MeterStyle = "Level",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51+71,LabelButtonPos[i][2]+72},Size = {20,20}}
    elseif props["Operation Mode"].Value == "Predefined Left/Right" and props["Left Buttons Mode"].Value == "Radio Buttons" and (i == 1 or i == 3) and props["Radio Button Interlock Blink Top/Left"].Value == "Yes" then
      table.insert(graphics,{Type = "Label",Text = "Color Blink",Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Center",Position = {LabelButtonPos[i][1]-4,LabelButtonPos[i][2]+72},Size = {59,20}})
      layout["ColorBlink"..i] = {PrettyName = "Color Blink "..i,Style = ColorStyle, TextBoxStyle = "Normal",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51,LabelButtonPos[i][2]+72},Size = {71,20}}
      layout["ColorBlinkIndicator"..i] = {PrettyName = "Color Blink "..i,Style = "Meter", MeterStyle = "Level",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51+71,LabelButtonPos[i][2]+72},Size = {20,20}}
    elseif props["Operation Mode"].Value == "Predefined Left/Right" and props["Right Buttons Mode"].Value == "Radio Buttons" and (i == 2 or i == 4) and props["Radio Button Interlock Blink Bottom/Right"].Value == "Yes" then
      table.insert(graphics,{Type = "Label",Text = "Color Blink",Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Center",Position = {LabelButtonPos[i][1]-4,LabelButtonPos[i][2]+72},Size = {59,20}})
      layout["ColorBlink"..i] = {PrettyName = "Color Blink "..i,Style = ColorStyle, TextBoxStyle = "Normal",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51,LabelButtonPos[i][2]+72},Size = {71,20}}
      layout["ColorBlinkIndicator"..i] = {PrettyName = "Color Blink "..i,Style = "Meter", MeterStyle = "Level",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51+71,LabelButtonPos[i][2]+72},Size = {20,20}}
    end
  else
    table.insert(graphics,{Type = "Label",Text = "Color",Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Center",Position =  {LabelButtonPos[i][1],LabelButtonPos[i][2]+32},Size = {51,20}})
    layout["Color"..i] = {PrettyName = "Color "..i,Style = ColorStyle, TextBoxStyle = "Normal",Margin = 2, CornerRadius = 0,Position = {LabelButtonPos[i][1]+51,LabelButtonPos[i][2]+32},Size = {71,20}}
  end
  layout["Button"..i] = {PrettyName = "Button "..i,Style = "Button",ButtonStyle = ButtonType[i],Margin = 2, CornerRadius = 0,Position = ButtonPos[i],Size = {71,45}}
end


table.insert(graphics,{Type = "Header",Text = "Extra Controls",Color = Black,Font = "Roboto",FontSize = 14,FontStyle = "Regular",HTextAlign = "Center",Position = {42,505},Size = {364,6}})
table.insert(graphics,{Type = "Label",Text = "Button Lock",Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Center",Position =  {42,530},Size = {85,20}})
layout["ButtonLock"] = {PrettyName = "Button Lock",Style = "Button", ButtonStyle = "Toggle",Margin = 2, CornerRadius = 0,Position = {149,530},Size = {40,20}}
table.insert(graphics,{Type = "Label",Text = "Brightness",Color = Black,Font = "Roboto",FontSize = 11,FontStyle = "Regular",HTextAlign = "Center",Position =  {225,530},Size = {85,20}})
layout["Brightness"] = {PrettyName = "Brightness",Style = "Text", TextBoxStyle = "Normal",Margin = 2, CornerRadius = 0,Position = {351,530},Size = {40,20}}