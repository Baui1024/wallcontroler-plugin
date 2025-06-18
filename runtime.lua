rapidjson = require("rapidjson")
Controls.Status.Value = 4
KeepAlive = Timer.New()
KeepAlive:Start(2)
LockTiming = 0.05
Lock = false
SettingLock = false 

Socket = WebSocket.New()
SocketProtocol = "wss"
SocketUrl = "/"
SocketPort = 8765

KeepAlive.EventHandler = function()
  succ,err = pcall(function() 
    Socket:Ping()
  end)
  if succ then 
    Controls.Status.Value = 0
    Controls.Status.String = "Connected"
  else  
    Controls.Status.Value = 4
    Controls.Status.String = ""
    Connect()
  end
end 

function Connect()
  if ValidateIP(Controls.IP.String) then 
    Socket:Connect(
      SocketProtocol, 
      Controls.IP.String,
      SocketUrl,
      SocketPort,
      nil
    )
  else 
    Socket:Close()
    Controls.Status.Value = 4
    Controls.Status.String = "Invalid IP"
  end  
end 

Socket.Connected = function()
  Controls.Status.Value = 0
  Controls.Status.String = "Connected"
  SyncState() 
end 

Socket.Closed = function()
  Controls.Status.Value = 4
  Controls.Status.String = ""
end 

Socket.Error = function(ws, err)
  Controls.Status.Value = 2
  Controls.Status.String = err
end 

Socket.Data = function(ws, data)
  print("RX:", data)
  ParseData(data)
end 

function SendMessage(msg)
  msg = rapidjson.encode(msg)
  print("Sending: "..msg)
  succ, err = pcall(function()
    Socket:Write(msg)
  end)
end 

Colors = {
  Off         = "#000000",
  Red         = "#FF0000",
  Green       = "#00FF00",
  Blue        = "#0000FF",
  Yellow      = "#FFFF00",
  Cyan        = "#00FFFF",
  Magenta     = "#FF00FF",
  White       = "#FFFFFF"
}
-- Colors = {
--   Off         = "#000000",
--   White       = "#FFFFFF",
--   Red         = "#FF0000",
--   Green       = "#00FF00",
--   Blue        = "#0000FF",
--   Yellow      = "#FFFF00",
--   Cyan        = "#00FFFF",
--   Magenta     = "#FF00FF",
--   Gray        = "#808080", 
--   Lightgray   = "#D3D3D3",
--   Darkgray    = "#A9A9A9",
--   Orange      = "#FFA500",
--   Pink        = "#FFC0CB",
--   Purple      = "#800080",
--   Brown       = "#A52A2A",
--   Gold        = "#FFD700",
--   Silver      = "#C0C0C0",
--   Navy        = "#000080",
--   Teal        = "#008080",
--   Olive       = "#808000",
--   Maroon      = "#800000",
--   Lime        = "#BFFF00",
--   Indigo      = "#4B0082",
--   Coral       = "#FF7F50",
--   Turquoise   = "#40E0D0",
--   Violet      = "#EE82EE",
--   Beige       = "#F5F5DC",
-- }
ColorKeys = {}

for key,value in pairs(Colors) do
  table.insert(ColorKeys,key)
end
table.sort(ColorKeys)

for i = 1, 4 do 
  if Properties["Color Mode"].Value == "Pre-defined Options" then 
    Controls["ColorOn"..i].Choices = ColorKeys
    Controls["ColorOff"..i].Choices = ColorKeys
  end
end

function SendMultipleColor(i,color,reset)
  local message = {
    command = "set_color",
    led_index = i,
    color = color
  }
  SendMessage(message)
  if reset then 
    message = {
      command = "set_color",
      led_index = i,
      color = "#000000"
    }
    Timer.CallAfter(function()
      SendMessage(message)
    end,reset)
  end 
end

function SendColor(i,state,reset)
  local color = ""
  if state then 
    color = Controls["ColorOn"..i].String
  else 
    color = Controls["ColorOff"..i].String 
  end
  if Properties["Color Mode"].Value == "Pre-defined Options" then 
    color = Colors[color]
  end
  if Lock then 
    color = "#ff0000"
  end  
  local message = {
    command = "set_color",
    led_index = {i},
    color = color
  }
  SendMessage(message)
  if reset then 
    message = {
      command = "set_color",
      led_index = {i},
      color = "#000000"
    }
    Timer.CallAfter(function()
      SendMessage(message)
    end,reset)
  end 
  --print("sending color "..color.. " "..i.."", state and "on" or "off" , reset)
end 

function SyncState()
  for i = 1, 4 do 
    ButtonStates(i, 1, true)
  end 
end 

function ButtonStates(btn_id, val, internal)
  local individual_button = function(btn_id, val, internal)
    btn = Controls["Button"..btn_id]
    if Lock then 
      if not SettingLock then
        SendMultipleColor({1,2,3,4}, "#ff0000", 0.2)
      end
      return 
    end 
    if Properties["Button "..btn_id.." Mode"].Value == "Trigger" and val == 1 then 
      if not internal then
        btn:Trigger()
        SendColor(btn_id, true, 0.2)
      end
    elseif Properties["Button "..btn_id.." Mode"].Value == "Toggle" and val == 1 then 
      if not internal then
        btn.Boolean = not btn.Boolean
      end
      SendColor(btn_id, btn.Boolean) 
    elseif Properties["Button "..btn_id.." Mode"].Value == "Momentary" then
      if not internal then
        btn.Boolean = val == 1 or false
        SendColor(btn_id, btn.Boolean)
      end
    end  
  end 
  local radio_button = function(btn_on, btn_off)
    Controls["Button"..btn_on].Boolean = true 
    Controls["Button"..btn_off].Boolean = false
    SendColor(btn_on, Controls["Button"..btn_on].Boolean)
    SendColor(btn_off, Controls["Button"..btn_off].Boolean)
  end 
  
  if Properties["Operation Mode"].Value == "Individual" then
    individual_button(btn_id, val, internal)
  elseif Properties["Operation Mode"].Value == "Predefined Top/Bottom" then
    if btn_id == 1 or btn_id == 2 then 
      if Properties["Top Buttons Mode"].Value == "Radio Buttons" and val == 1 then
        if btn_id == 1 then
          radio_button(1,2)
        else
          radio_button(2,1)   
        end
      elseif Properties["Top Buttons Mode"].Value == "Individual" then
        individual_button(btn_id, val, internal)
      end
    elseif btn_id == 3 or btn_id == 4 then 
      if Properties["Bottom Buttons Mode"].Value == "Radio Buttons" and val == 1 then
        if btn_id == 3 then
          radio_button(3,4)
        else
          radio_button(4,3)   
        end
      elseif Properties["Bottom Buttons Mode"].Value == "Individual" then
        individual_button(btn_id, val, internal)
      end
    end
  elseif Properties["Operation Mode"].Value == "Predefined Left/Right" then
    if btn_id == 1 or btn_id == 3 then
      if Properties["Left Buttons Mode"].Value == "Radio Buttons" then
        if btn_id == 1 then
          radio_button(1,3)
        else
          radio_button(3,1)   
        end
      elseif Properties["Left Buttons Mode"].Value == "Individual" then
        individual_button(btn_id, val, internal)
      end
    elseif btn_id == 2 or btn_id == 4 then
      if Properties["Right Buttons Mode"].Value == "Radio Buttons" then
        if btn_id == 2 then
          radio_button(2,4)
        else
          radio_button(4,2)   
        end
      elseif Properties["Right Buttons Mode"].Value == "Individual" then
        individual_button(btn_id, val, internal)
      end
    end
  end
end 

ButtonPressed = {
  false,
  false,
  false,
  false
}

function SetButtonLock()
  if not Lock then  
    Lock = true
    SettingLock = true 
    SendMultipleColor({1,2,3,4}, "#ff0000", 0.2)
    Timer.CallAfter(
      function()
        SettingLock = false
      end,LockTiming*1.2
    ) 
  else
    SettingLock = true 
    SendMultipleColor({1,2,3,4}, "#00FF00", 0.2)
    Timer.CallAfter(
      function()
        SettingLock = false
        Timer.CallAfter(function()
          SyncState() 
        end,0.2)
      end,LockTiming*1.2
    ) 
    Timer.CallAfter(function() 
      Lock = false
    end,LockTiming*1.1)
  end
end

ParseData = function(data)
  data = rapidjson.decode(data)
  if data["command"] and data["command"] == "button_press" then 
    local btn_id = data["button_id"]
    local val = data["value"]
    if btn_id == 1 or btn_id == 2 then 
      if val == 1 then
        ButtonPressed[btn_id] = true 
        Timer.CallAfter(function()
          ButtonPressed[btn_id] = false 
          ButtonStates(btn_id, val)
        end,LockTiming)
        if ButtonPressed[1] and ButtonPressed[2] then
          SetButtonLock()
        end
      else 
        ButtonStates(btn_id, val)
      end
    else
      ButtonStates(btn_id, val)
    end
  end 
end



function ValidateIP(ip)
  -- Check format: must be 4 dot-separated numbers
  local a, b, c, d = ip:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)$")
  a, b, c, d = tonumber(a), tonumber(b), tonumber(c), tonumber(d)
  if not a or not b or not c or not d then return false end

  -- Each part must be 0-255
  if a > 255 or b > 255 or c > 255 or d > 255 then return false end

  -- Unicast exclusion rules:
  if a == 0 then return false end                 -- 0.0.0.0/8 is reserved
  if a >= 224 then return false end              -- 224.0.0.0/4 is multicast
  if a == 127 then return false end              -- 127.0.0.0/8 is loopback

  return true
end

function ValidHexColor(str)
  if type(str) ~= "string" then return false end
  return str:match("^#%x%x%x%x%x%x$") or str:match("^#%x%x%x$") ~= nil
end

function AssignColors()
  for i = 1, 4 do 
    if Properties["Color Mode"].Value == "Pre-defined Options" then 
      onColor, offColor = false, false
      for key,value in pairs(Colors) do
        if key == Controls["ColorOn"..i].String then 
          onColor = true 
        end
        if key == Controls["ColorOff"..i].String then 
          offColor = true 
        end
      end
      if not onColor then 
        Controls["ColorOn"..i].String = "White"
      end
      if not offColor then 
        Controls["ColorOff"..i].String = "Off"
      end
      Controls["ColorOnIndicator"..i].Color = Colors[Controls["ColorOn"..i].String]
      Controls["ColorOffIndicator"..i].Color = Colors[Controls["ColorOff"..i].String]
    else 
      if not ValidHexColor(Controls["ColorOn"..i].String) then
        Controls["ColorOn"..i].String = "#FFFFFF"
      end
      if not ValidHexColor(Controls["ColorOff"..i].String) then
        Controls["ColorOff"..i].String = "#000000"
      end
      Controls["ColorOnIndicator"..i].Color = Controls["ColorOn"..i].String
      Controls["ColorOffIndicator"..i].Color = Controls["ColorOff"..i].String
    end 
  end 
end 

function EventHandlers()
  Controls.IP.EventHandler = Connect
  for i = 1, 4 do
    Controls["Button"..i].EventHandler = function(ctrl)
      ButtonStates(i, 1 , true)
    end 
    Controls["ColorOn"..i].EventHandler = AssignColors
    Controls["ColorOff"..i].EventHandler = AssignColors
  end 
end 

function Initalize()
  EventHandlers()
  AssignColors()
  Connect()
end 

Initalize()