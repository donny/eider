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
board printBoard
writeln("")
board regenerate printBoard
writeln("")
board regenerate printBoard
# board printBoard
