# TikZ notes

## Preparation

```latex
% in the preamble
\usepackage{tikz}

% in the document
\begin{tikzpicture}
% code here ...
\end{tikzpicture}
```

Without page number
```latex
\begin{document}
\thispagestyle{empty}
\end{document}
```
The resulting PDF can then be cropped.

## Drawing help lines (grid)

```latex
\draw[help lines] (-4,-4) grid (4,4);
```


## Drawing lines

```latex
\draw (0,0) -- (2,2)
```

## Scaling

Scaling overall drawing:
```latex
\begin{tikzpicture}[scale=3]
% commands here
\end{tikzpicture}
```

Scaling only one dimension:
```latex
\begin{tikzpicture}[xscale=3]
% commands here
\end{tikzpicture}
```

Scaling in both dimension with different proportions:
```latex
\begin{tikzpicture}[xscale=2.3,yscale=0.5]
% commands here
\end{tikzpicture}
```


## Drawing arrows

Lines can be decorated:
```latex
\draw [->] (0,0) -- (2,0);
\draw [<-] (0,-0.5) -- (2,-0.5);
\draw [|->] (0,-1) -- (2,-1);
```

Arrows on both end of the path:
```latex
\draw [<->] (1,2) -- (0,0) -- (3,0);
```

## Line thickness

```latex
\draw [ultra thick,<->] (1,2) -- (0,0) -- (3,0);
```

Thickness options: `ultra thin`, `very thin`, `thin`, `semithick`, `thick`, `thick`,
`very thick`, and `ultra thick`.

Using custom widths
```latex
\draw [line width=5] (0,-0.5) -- (2,-0.5);
\draw [line width=0.1cm] (0,-1) -- (2,-1);
```
