doRelativeFile("./src/Account.io")

fileName := System clone args pop
write("\nUsing " .. fileName .. " as the input\n")

// Get the file contents.
file := File clone openForReading(fileName)
contents := file contents
file close

// Parse the JSON input into an object.
root := Yajl clone parse(contents) root
input := root pop asObject

generation := input generation
cells := input cells map(asObject)
cells := cells map(cell,
  new := cell clone
  new x := cell y * -1
  new y := cell x
  new
)

xMin := cells map(x) min
xMax := cells map(x) max
yMin := cells map(y) min
yMax := cells map(y) max

xOffset := 0 - xMin
yOffset := 0 - yMin

world := list()

for(x, xMin, xMax, 1,
  world append(list())
  for(y, yMin, yMax, 1,
    world at(x + xOffset) append(".")
  )
)

cells map(cell,
  world at(cell x + xOffset) atPut(cell y + yOffset, "#")
)

world foreach(x,
  x foreach(y,
    y print
  )
  writeln("")
)
