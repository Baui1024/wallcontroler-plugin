props["Radio Button Interlock Timeout ms On 1"].IsHidden = true
props["Radio Button Interlock Timeout ms On 2"].IsHidden = true
props["Radio Button Interlock Timeout ms Off 1"].IsHidden = true
props["Radio Button Interlock Timeout ms Off 2"].IsHidden = true
props["Radio Button Interlock Blink Top/Left"].IsHidden = true
props["Radio Button Interlock Blink Bottom/Right"].IsHidden = true

if props["Operation Mode"].Value == "Individual" then
  props["Top Buttons Mode"].IsHidden = true
  props["Bottom Buttons Mode"].IsHidden = true
  props["Left Buttons Mode"].IsHidden = true
  props["Right Buttons Mode"].IsHidden = true
  for i = 1, 4 do
    props["Button " .. i .. " Mode"].IsHidden = false
    if props["Button " .. i .. " Mode"].Value == "Toggle" then
      props["Long Press ms " .. i].IsHidden = true
      props["Repeat " .. i].IsHidden = true
      props["Repeat Interval ms " .. i].IsHidden = true
    else
      props["Long Press ms " .. i].IsHidden = false
        props["Repeat " .. i].IsHidden = false
      props["Repeat Interval ms " .. i].IsHidden = false
    end
  end
elseif props["Operation Mode"].Value == "Predefined Top/Bottom" then
  for i = 1, 4 do
    if props["Button " .. i .. " Mode"].Value == "Toggle" then
      props["Long Press ms " .. i].IsHidden = true
      props["Repeat " .. i].IsHidden = true
      props["Repeat Interval ms " .. i].IsHidden = true
    else
      props["Long Press ms " .. i].IsHidden = false
        props["Repeat " .. i].IsHidden = false
      props["Repeat Interval ms " .. i].IsHidden = false
    end
  end
  props["Top Buttons Mode"].IsHidden = false
  props["Bottom Buttons Mode"].IsHidden = false
  props["Left Buttons Mode"].IsHidden = true
  props["Right Buttons Mode"].IsHidden = true
  if props["Top Buttons Mode"].Value == "Radio Buttons" then
    props["Button " .. 1 .. " Mode"].IsHidden = true
    props["Button " .. 2 .. " Mode"].IsHidden = true
    props["Radio Button Interlock Timeout ms On 1"].IsHidden = false
    props["Radio Button Interlock Timeout ms Off 1"].IsHidden = false
    props["Radio Button Interlock Blink Top/Left"].IsHidden = false
    for i = 1, 2 do
      props["Long Press ms " .. i].IsHidden = true
      props["Repeat " .. i].IsHidden = true
      props["Repeat Interval ms " .. i].IsHidden = true
    end
  end
  if props["Bottom Buttons Mode"].Value == "Radio Buttons" then
    props["Button " .. 3 .. " Mode"].IsHidden = true
    props["Button " .. 4 .. " Mode"].IsHidden = true
    props["Radio Button Interlock Timeout ms On 2"].IsHidden = false
    props["Radio Button Interlock Timeout ms Off 2"].IsHidden = false
    props["Radio Button Interlock Blink Bottom/Right"].IsHidden = false
    for i = 3, 4 do
      props["Long Press ms " .. i].IsHidden = true
      props["Repeat " .. i].IsHidden = true
      props["Repeat Interval ms " .. i].IsHidden = true
    end
  end
elseif props["Operation Mode"].Value == "Predefined Left/Right" then
  for i = 1, 4 do
    if props["Button " .. i .. " Mode"].Value == "Toggle" then
      props["Long Press ms " .. i].IsHidden = true
      props["Repeat " .. i].IsHidden = true
      props["Repeat Interval ms " .. i].IsHidden = true
    else
      props["Long Press ms " .. i].IsHidden = false
        props["Repeat " .. i].IsHidden = false
      props["Repeat Interval ms " .. i].IsHidden = false
    end
  end
  props["Top Buttons Mode"].IsHidden = true
  props["Bottom Buttons Mode"].IsHidden = true
  props["Left Buttons Mode"].IsHidden = false
  props["Right Buttons Mode"].IsHidden = false
  if props["Left Buttons Mode"].Value == "Radio Buttons" then
    props["Button " .. 1 .. " Mode"].IsHidden = true
    props["Button " .. 3 .. " Mode"].IsHidden = true
    props["Radio Button Interlock Timeout ms On 1"].IsHidden = false
    props["Radio Button Interlock Timeout ms Off 1"].IsHidden = false
    props["Radio Button Interlock Blink Top/Left"].IsHidden = false
    for i = 1, 3, 2 do
      props["Long Press ms " .. i].IsHidden = true
      props["Repeat " .. i].IsHidden = true
      props["Repeat Interval ms " .. i].IsHidden = true
    end
  end
  if props["Right Buttons Mode"].Value == "Radio Buttons" then
    props["Button " .. 2 .. " Mode"].IsHidden = true
    props["Button " .. 4 .. " Mode"].IsHidden = true
    props["Radio Button Interlock Timeout ms On 2"].IsHidden = false
    props["Radio Button Interlock Timeout ms Off 2"].IsHidden = false
    props["Radio Button Interlock Blink Bottom/Right"].IsHidden = false
    for i = 2, 4, 2 do
      props["Long Press ms " .. i].IsHidden = true
      props["Repeat " .. i].IsHidden = true
      props["Repeat Interval ms " .. i].IsHidden = true
    end
  end
end





if props.plugin_show_debug.Value == false then 
  props["Debug Print"].IsHidden = true 
end