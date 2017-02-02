# eider

Eider is a command-line interface (CLI) implementation of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway's_Game_of_Life) written in [Io](http://iolanguage.org).

### Background

This project is part of [52projects](https://donny.github.io/52projects/) and the new stuff that I learn through this project: the [Io](http://iolanguage.org) programming language.

### Io language

Io has been [described](http://iolanguage.org/guide/guide.html) as a dynamic prototype-based programming language. Io are inspired by several languages: Smalltalk (all values are objects), Self (prototype-based), NewtonScript (differential inheritance), Act1 (actors and futures for concurrency), Lisp (code is a runtime inspectable / modifiable tree) and Lua (small, embeddable).

The language syntax is very simple and there are no keywords (only some characters that behave like keywords). In Io, everything is a message, Io syntax simply chains messages together, with each message returning an object and each message taking optional parameters in parentheses.

Io is a [prototype-based](https://en.wikipedia.org/wiki/Prototype-based_programming) programming language. Another example of this type of language is JavaScript. In Io, we don't deal with classes and objects. We only deal exclusively with objects, cloning them as needed. In a [prototype-based](https://media.pragprog.com/titles/btlang/lo.pdf) programming language, every object is a clone of an existing object rather than a class.

A small example of using Io:

```shell
$ io
Io 20140919
Io> "Hello World" println
Hello World
==> Hello World
```

The above code send the `println` message to a `Hello World` string. Similar to Objective-C and Smalltalk, everything is a message and the syntax follows a similar pattern. Io also has an excellent introspection and meta-programming feature, where the application code can be [modified](http://viewsourcecode.org/why/hackety.org/2008/01/05/ioHasAVeryCleanMirror.html) during runtime (like Lisp).

Io can be installed on macOS by running `brew install io`. This unfortunately does not install the [Curses](http://iolanguage.org/reference/index.html#Curses.Curses) library that allows us to write and read at arbitrary positions on the terminal (relevant to our project). Io unfortunately does [not](https://github.com/stevedekorte/io/tree/master/addons/SecureSocket) support `https` out of the box. This prevents us, for example, from using it to scrap and process web sites.

### Project

Eider is a simple CLI implementation of Conway's Game of Life. The application can be started by running `io main.io input.json`, passing the input file as an argument, in this case, `input.json`. An example of the input file:

```json
{
  "generation": 5,
  "cells": [
    {"x": 1, "y": 0},
    {"x": 1, "y": 1},
    {"x": 1, "y": 2},

    {"x": 4, "y": 3},
    {"x": 5, "y": 3},
    {"x": 5, "y": 4},
    {"x": 6, "y": 3}
  ]
}
```

The above file specifies the number of generation that we would like to print and the cells as coordinates. Eider uses a board-less approach where we don't need to specify the width and height of the board. Thus, the cells' coordinates can be arbitrary. The first three coordinates display a vertical bar below. This corresponds to [`Blinker (period 2)`](https://en.wikipedia.org/wiki/Conway's_Game_of_Life). The next four coordinates display a [tetromino pattern](http://www.math.cornell.edu/~lipa/mec/4life2.png).

```
..........
......#...
.....###..
..#.......
..#.......
..#.......
..........
```

The screenshot of the app in action can be seen below:

![Screenshot](https://raw.githubusercontent.com/donny/eider/master/screenshot.png)

### Implementation

...

### Conclusion

...
