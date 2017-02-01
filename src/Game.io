Game := Object clone
Game setup := method(cells,
  self cells := cells
  self xMin := cells map(x) min
  self xMax := cells map(x) max
  self yMin := cells map(y) min
  self yMax := cells map(y) max

  self xOffset := 0 - xMin
  self yOffset := 0 - yMin
)

Game emptyBoard := method(
  board := list()
  for(x, xMin, xMax, 1,
    board append(list())
    for(y, yMin, yMax, 1,
      board at(x + xOffset) append(".")
    )
  )
  board
)

Game initialBoard := method(
  self board := emptyBoard
  cells map(cell,
    board at(cell x + xOffset) atPut(cell y + yOffset, "#")
  )
  self
)

Game printBoard := method(
  // We need to create a new board and transform / reverse it.
  // Because the origin of the standard cartesian coordinate system is bottom left.
  // But the origin of the display print loop is top left.
  newBoard := list()
  board at(0) size repeat(newBoard append(list()))

  // Transform the board.
  board foreach(xi, x,
    x foreach(yi, y,
      newBoard at(yi) append(board at(xi) reverse at(yi))
    )
  )

  newBoard foreach(x,
    x foreach(y, y print)
    writeln("")
  )
)
