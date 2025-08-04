table.insert(props, {
  Name = "Operation Mode",
  Type = "enum",
  Choices = {"Individual", "Predefined Top/Bottom", "Predefined Left/Right"},
  Value = "Predefined Top/Bottom"
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

table.insert(props, {
  Name = "Radio Button Interlock Timeout ms On 1",
  Type = "integer",
  Min = 0,
  Max = 60000,
  Value = 0 
})

table.insert(props, {
  Name = "Radio Button Interlock Timeout ms On 2",
  Type = "integer",
  Min = 0,
  Max = 60000,
  Value = 0
})

table.insert(props, {
  Name = "Radio Button Interlock Timeout ms Off 1",
  Type = "integer",
  Min = 0,
  Max = 60000,
  Value = 0
})

table.insert(props, {
  Name = "Radio Button Interlock Timeout ms Off 2",
  Type = "integer",
  Min = 0,
  Max = 60000,
  Value = 0
})

table.insert(props, {
  Name = "Radio Button Interlock Blink Top/Left",
  Type = "enum",
  Choices = {"Yes", "No"},
  Value = "No"
})

table.insert(props, {
  Name = "Radio Button Interlock Blink Bottom/Right",
  Type = "enum",
  Choices = {"Yes", "No"},
  Value = "No"
})

for i = 1, 4 do
  table.insert(props, {
    Name = "Button " .. i .. " Mode",
    Type = "enum",
    Choices = {"Momentary", "Toggle"},
    Value = "Momentary"
  })
  table.insert(props, {
    Name = "Long Press ms "..i,
    Type = "integer",
    Min = 500,
    Max = 10000,
    Value = 2000
  })
    table.insert(props, {
    Name = "Repeat " .. i,
    Type = "enum",
    Choices = {"Yes", "No"},
    Value = "No"
  })
  table.insert(props, {
    Name = "Repeat Interval ms "..i,
    Type = "integer",
    Min = 100,
    Max = 2000,
    Value = 500
  })
end

table.insert(props, {
  Name = "Color Mode",
  Type = "enum",
  Choices = {"Pre-defined Options", "Hex Values"},
  Value = "Pre-defined Options"
})

table.insert(props, {
  Name = "Rotation",
  Type = "enum",
  Choices = {"0", "90", "180", "270"},
  Value = "0"
})

table.insert(props, {
  Name = "Debug Print",
  Type = "enum",
  Choices = {"None", "Tx/Rx", "Tx", "Rx", "Function Calls", "All"},
  Value = "None"
})