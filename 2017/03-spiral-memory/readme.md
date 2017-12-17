# Day 3: Spiral Memory

## Part one

You come across an experimental new kind of memory stored
on an infinite two-dimensional grid.

Each square on the grid is allocated in a spiral pattern
starting at a location marked 1 and then counting up while spiralling outward.
For example, the first few squares are allocated like this:

```
65  64  63  62  61  60  59  58 57
66  37  36  35  34  33  32  31 56
67  38  17  16  15  14  13  30 55
68  39  18   5   4   3  12  29 54
69  40  19   6   1   2  11  28 53
70  41  20   7   8   9  10  27 52
71  42  21  22  23  24  25  26 51
72  43  44  45  46  47  48  49 50
73  74  75  76  77  78  79  80 81
```

While this is very space-efficient (no squares are skipped),
requested data must be carried back to square 1
(the location of the only access port for this memory system)
by programs that can only move up, down, left, or right.
They always take the shortest path:
the [Manhattan Distance](https://en.wikipedia.org/wiki/Taxicab_geometry)
between the location of the data and square 1.

For example:

- Data from square 1 is carried 0 steps, since it's at the access port.
- Data from square 12 is carried 3 steps, such as: down, left, left.
- Data from square 23 is carried only 2 steps: up twice.
- Data from square 1024 must be carried 31 steps.

How many steps are required to carry the data from the square
identified in your puzzle input all the way to the access port?

Your puzzle input is 368078

```
Degrees of separation

(2**n+1)^2

- 0 ring = 1
- 1 ring = SE = 9 - 1  => 8
- 2 ring = SE = 25 - 1 => 24 => 3 * 8 | 8 + 8*2
- 3 ring = SE = 49 - 1 => 48 => 6 * 8 | 8 + 16 + 8*3
- 4 ring = SE = 81 - 1 => 80 => 10 * 8 | 8 + 16 + 24 + 8*4
- 5 ring = SE = 121 - 1 => 120 => 15 * 8 | 8 + 16 + 24 + 32 + 8*5
```
