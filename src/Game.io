Game := Object clone
Game setup := method(cells,
  self cells := cells
  self xMin := cells map(x) min
  self xMax := cells map(x) max
  self yMin := cells map(y) min
  self yMax := cells map(y) max

  self xOffset := 0 - xMin
  self yOffset := 0 - yMin
  self margin := 10
)

Game emptyBoard := method(
  eBoard := list()
  for(x, xMin - margin, xMax + margin, 1,
    eBoard append(list())
    for(y, yMin - margin, yMax + margin, 1,
      eBoard at(x + xOffset + margin) append(".")
    )
  )
  eBoard
)

Game initialBoard := method(
  self board := emptyBoard
  cells map(cell,
    board at(cell x + xOffset + margin) atPut(cell y + yOffset + margin, "#")
  )
  self
)

Game regenerate := method(
  nextBoard := emptyBoard

  neighbourOffsets := list(
    list(-1, -1), list(-1, 0), list(-1, 1),
    list(0, -1), list(0, 1),
    list(1, -1), list(1, 0), list(1,1)
  )

  getNeighbourCount := method(origin,
    count := 0
    neighbourOffsets foreach(offset,
      cellX := origin first + offset first
      cellY := origin last + offset last
      exception := try(
        // We might return nil because we are at the edge of the board.
        cell := board at(cellX) at(cellY)
        if (cell == "#", count := count + 1)
      )
    )
    count
  )

  board foreach(xi, x,
    x foreach(yi, y,
      count := getNeighbourCount(list(xi, yi))

      if (y == "#",
        if (count == 2 or count == 3,
          nextBoard at(xi) atPut(yi, "#"),
          nextBoard at(xi) atPut(yi, ".")
        ),
        if (count == 3,
          nextBoard at(xi) atPut(yi, "#"),
          nextBoard at(xi) atPut(yi, ".")
        )
      )
    )
  )
  self board := nextBoard
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
