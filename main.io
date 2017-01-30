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
generation println
