doRelativeFile("./src/Game.io")

fileName := System clone args pop
write("Using " .. fileName .. " as the input\n")

// Get the file contents.
file := File clone openForReading(fileName)
contents := file contents
file close

// Parse the JSON input into an object.
root := Yajl clone parse(contents) root
input := root first asObject

generation := input generation
cells := input cells map(asObject)

game := Game clone
game setup(cells)

board := game initialBoard

writeln("\nInitial Board")
board printBoard

generation repeat(step,
  writeln("\n\nBoard at Generation: #{step + 1}" interpolate)
  board regenerate printBoard
)
