Basic principles underlie TikZ:

- special syntax for specifying **points**

- special syntax for **path** specifications

- **action** on paths

- key-value syntax for **graphics parameters**

- special syntax for **nodes**

- special syntax for **trees**

- special syntax for **graphs**

- grouping of graphic parameters

- coordinate transformation system


# Special syntax for specifying points

- using two TeX dimensions, separated by commas in round brackets. Example: `(2cm,3pt)`.

- using polar coordinates: `(30:1cm)` means 1cm in 30 degree direction.

- If unit is not provided, it means that we use PGF's xy-coordinate system. By default,
  the unit x-vector goes 1cm to the right and the unit y-vector goes 1cm upward.

- Using three numbers means that we use PGF's xyz-coordinate system.

- It is also possible to use an anchor of a previously defined shape: for example
  `(first node.south)`

- `++(1cm,0pt)`: 1cm to the right of the last point used.

- Relative movement: `(1,0) ++(1,0) ++(0,1)` specifies three coordinates:
  `(1,0)`, then `(2,0)`, and `(2,1)`.

- Relative movement: (1,0) +(1,0) +(0,1).

# Special syntax for path specifications

A path is a series of straight or curved lines, which need not be connected.

```latex
(5pt,0pt) -- (0pt,0pt) -- (0pt,5pt) -- cycle
```

# Actions on paths

Various actions on path:

- draw or *stroking*
- fill
- shade
- clip
- any combination of these

Given a path as in
```
\path (0,0) rectangle (2ex,1ex);
```
you can draw it by adding the draw option as in
```
\path[draw] (0,0) rectangle (2ex,1ex);
```

- The \draw command is an abbreviation for \path[draw]

- The \fill command is an abbreviation for \path[fill]

- The \filldraw command is an abbreviation for \path[fill,draw]

Shading is caused by the shade option and clipping by the clip option.


# Key-value syntax for graphic parameters

Example

```latex
\tikz \draw[line width=2pt,color=red] (1,0) -- (0,0) -- (0,1) -- cycle;
```


# Special syntax for specifying nodes

Nodes are inserted at the current position of the path, but either after (the default)
or before the complete path is rendered.

When special options are given, as in:
```latex
\draw (1,1) node[circle,draw] {text};
```

A node can be named for later reference by using the option `name=nodename`
or by stating the node name in the parentheses outside the text as in
`node[circle](name){text}`.


# Special syntax for specifying trees

```
\node {root}
  child {node {left}}
  child {node {right}}
```