LaTeX/Macros

Documents produced with the commands you have learned up to this point will look acceptable
to a large audience. While they are not fancy-looking, they obey all the established rules 
of good typesetting, which will make them easy to read and pleasant to look at. However,
there are situations where LaTeX does not provide a command or environment
that matches your needs, or the output produced by some existing command may not
meet your requirements.

In this chapter, we will try to give some hints on how to teach LaTeX new tricks
and how to make it produce output that looks different from what is provided by
default.

LaTeX is a fairly high-level language compared to Plain TeX and thus is more
limited. The next chapter will focus on Plain TeX and will explain advanced
techniques for programming.

New commands

To add your own commands, use the
```latex
\newcommand{\name}[num]{definition}
```
command.
Basically, the command requires two arguments: the name of the command you want
to create (preceded by a backslash), and the definition of the command.
Note that the command name can but need not be enclosed in braces, as you like.
The num argument in square brackets is optional and specifies the number of
arguments the new command takes (up to 9 are possible). If missing it
defaults to 0, i.e. no argument allowed.

The following two examples should help you to get the idea. The first
example defines a new command called \wbal that will print "The Wikibook about LaTeX".
Such a command could come in handy if you had to write the title of this book
over and over again. 

```latex
\newcommand{\wbal}{The Wikibook about \LaTeX}
This is "\wbal" \ldots{} "\wbal"
```

The next example illustrates how to define a new command that takes one argument.
The #1 tag gets replaced by the argument you specify. If you wanted to use more
than one argument, use #2 and so on, these arguments are added in an extra set
of brackets.

```latex
\newcommand{\wbalsup}[1] {
  This is the Wikibook about LaTeX 
  supported by #1}
\newcommand{\wbalTwo}[2] {
  This is the Wikibook about LaTeX
  supported by #1 and #2}
% in the document body:
\begin{itemize}
\item \wbalsup{Wikimedia}
\item \wbalsup{lots of users!}
\item \wbalTwo{John Doe}{Anthea Smith}
\end{itemize}
```

Name your new command \wbalTwo and not \wbal2 as digits cannot be used to
name macros — invalid characters will error out at compile-time.

LaTeX will not allow you to create a new command that would overwrite
an existing one. But there is a special command in case you explicitly
want this: `\renewcommand`. It uses the same syntax as the \newcommand command.

In certain cases you might also want to use the \providecommand command.
It works like \newcommand, but if the command is already defined,
LaTeX will silently ignore the new command.

With LaTex2e, it is also possible to add a default parameter to a command
with the following syntax:
```latex
\newcommand{name}[num][default]{definition}
```

If the default parameter of \newcommand is present, then the first of the number
of arguments specified by num is optional with a default value of default;
if absent, then all of the arguments are required.

```latex
\newcommand{\wbalTwo}[2][Wikimedia]{
  This is the Wikibook about LaTeX
  supported by {#1} and {#2}!}
% in the document body:
\begin{itemize}
\item \wbalTwo{John Doe}
\item \wbalTwo[lots of users]{John Doe}
\end{itemize}
```

Note

When the command is used with an explicit first parameter it is given enclosed
with brackets (here "[lots of users]").

Here is a common example: if you are writing a book about Mathematics and you have
to use vectors, you have to decide how they will look. There are several different
standards, used in many books. If a is a vector, some people like to add an arrow
over it ( a → {\displaystyle {\vec {a}}} {\vec {a}}), other people write it
underlined (a); another common version is to write it bold (a). Let us assume you
want to write your vectors with an arrow over them; then add the following line
in your mystyle.sty.

```latex
\newcommand{\myvec}[1]{\vec{#1}}
```

and write your vectors inside the new \myvec{...} command.
You can call it as you wish, but you'd better choose a short name because you
will probably write it very often. Then, if you change your mind and you want your
vectors to look differently you just have to change the definition of
your \myvec{...}. Use this approach whenever you can: this will save you
a lot of time and increase the consistency of your document. 

`DeclareRobustCommand`

Some commands are fragile, that is they fail in some environments.
If a macro works in body text but not in (for example) a figure caption,
it's worth trying to replace the \newcommand{\MyCommand}... declaration
with \DeclareRobustCommand{\MyCommand}... in the preamble.
This is especially true for macros which, when expanded, produce text
that is written to a .aux file. 

## New environments

Just as with the \newcommand command, there is a command to create
your own environments. The \newenvironment command uses the following syntax:

```latex
\newenvironment{name}[num][default]{before}{after}
```

Again \newenvironment can have an optional argument. When the \begin{name}
command (which starts the environment) is encountered, the material specified
in the `before` argument is processed before the text in the environment
gets processed. The material in the after argument gets processed when
the \end{name} command (which ends the environment) is encountered.

The optional num and default arguments are used the same way as in
the \newcommand command. LaTeX makes sure that you do not define an
environment that already exists. If you ever want to change an existing
environment, you can use the \renewenvironment command.
It uses the same syntax as the \newenvironment command.

The example below illustrates the usage of the \newenvironment command:

```
\newenvironment{king}
{ \rule{1ex}{1ex}\hspace{\stretch{1}} }
{ \hspace{\stretch{1}}\rule{1ex}{1ex} }
```
\begin{king}
My humble subjects \ldots
\end{king}

Extra space

When creating a new environment you may easily get bitten by extra spaces creeping
in, which can potentially have fatal effects. One example is when you want to create
a title environment which suppresses its own indentation as well as the one on
the following paragraph. The \ignorespaces command in the begin block of the
environment will make it ignore any space after executing the begin block.
The end block is a bit more tricky as special processing occurs at the end
of an environment. With the \ignorespacesafterend LaTeX will issue an
\ignorespaces after the special `end` processing has occurred. 


