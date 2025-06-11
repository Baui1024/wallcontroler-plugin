if props["Operation Mode"].Value == "Raw" then
  props["Top Buttons Mode"].IsHidden = true
  props["Bottom Buttons Mode"].IsHidden = true
  props["Left Buttons Mode"].IsHidden = true
  props["Right Buttons Mode"].IsHidden = true
  for i = 1, 4 do
    props["Button " .. i .. " Mode"].IsHidden = false
  end
elseif props["Operation Mode"].Value == "Predefined Top/Bottom" then
  props["Top Buttons Mode"].IsHidden = false
  props["Bottom Buttons Mode"].IsHidden = false
  props["Left Buttons Mode"].IsHidden = true
  props["Right Buttons Mode"].IsHidden = true
  if props["Top Buttons Mode"].Value == "Radio Buttons" then
    props["Button " .. 1 .. " Mode"].IsHidden = true
    props["Button " .. 2 .. " Mode"].IsHidden = true
  end
  if props["Bottom Buttons Mode"].Value == "Radio Buttons" then
    props["Button " .. 3 .. " Mode"].IsHidden = true
    props["Button " .. 4 .. " Mode"].IsHidden = true
  end
elseif props["Operation Mode"].Value == "Predefined Left/Right" then
  props["Top Buttons Mode"].IsHidden = true
  props["Bottom Buttons Mode"].IsHidden = true
  props["Left Buttons Mode"].IsHidden = false
  props["Right Buttons Mode"].IsHidden = false
  if props["Left Buttons Mode"].Value == "Radio Buttons" then
    props["Button " .. 1 .. " Mode"].IsHidden = true
    props["Button " .. 3 .. " Mode"].IsHidden = true
  end
  if props["Right Buttons Mode"].Value == "Radio Buttons" then
      props["Button " .. 2 .. " Mode"].IsHidden = true
      props["Button " .. 4 .. " Mode"].IsHidden = true
  end
end






if props.plugin_show_debug.Value == false then 
  props["Debug Print"].IsHidden = true 
end