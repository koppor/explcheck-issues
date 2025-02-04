# Use Monaco as Code Renderer

## Context and Problem Statement

We need to display the found errors in the source code.

## Decision Drivers

* Easy to use
* Nice user experience

## Considered Options

* [Monaco](https://microsoft.github.io/monaco-editor/)
* [CodeMirror](https://codemirror.net/)
* [Ace](https://ace.c9.io/)
* [Pygments](https://pygments.org/)

## Decision Outcome

Chosen option: "Monaco", because used in Visual Studio Code and well-maintained.

## More Information

* Implemeting some hovering with Pygments is hard.
* Discussion of Monaco, CodeMirror und Ace: <https://blog.replit.com/code-editors>
