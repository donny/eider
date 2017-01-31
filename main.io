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

xMin := cells map(x) min
xMax := cells map(x) max
yMin := cells map(y) min
yMax := cells map(y) max

world := list()

world println
for(x, xMin, xMax, 1,
  world append(list())
  world println

  for(y, yMin, yMax, 1,
    x println
    world at(1) println

    # world at(x) append(".")
    world at(x) println
  )
)
