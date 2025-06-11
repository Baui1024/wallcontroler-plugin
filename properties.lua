table.insert(props, {
  Name = "Operation Mode",
  Type = "enum",
  Choices = {"Individual", "Predefined Top/Bottom", "Predefined Left/Right"},
  Value = "Individual"
})

table.insert(props, {
  Name = "Top Buttons Mode",
  Type = "enum",
  Choices = {"Radio Buttons", "Individual"},
  Value = "Radio Buttons"
})

table.insert(props, {
  Name = "Bottom Buttons Mode",
  Type = "enum",
  Choices = {"Radio Buttons", "Individual"},
  Value = "Radio Buttons"
})

table.insert(props, {
  Name = "Left Buttons Mode",
  Type = "enum",
  Choices = {"Radio Buttons", "Individual"},
  Value = "Radio Buttons"
})

table.insert(props, {
  Name = "Right Buttons Mode",
  Type = "enum",
  Choices = {"Radio Buttons", "Individual"},
  Value = "Radio Buttons"
})

for i = 1, 4 do
  table.insert(props, {
    Name = "Button " .. i .. " Mode",
    Type = "enum",
    Choices = {"Momentary", "Trigger", "Toggle"},
    Value = "Momentary"
  })
end

table.insert(props, {
  Name = "Color Mode",
  Type = "enum",
  Choices = {"Pre-defined Options", "Hex Values"},
  Value = "Pre-defined Options"
})

table.insert(props, {
  Name = "Debug Print",
  Type = "enum",
  Choices = {"None", "Tx/Rx", "Tx", "Rx", "Function Calls", "All"},
  Value = "None"
})