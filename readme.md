# pass find-*

An extension for the [password store](https://www.passwordstore.org/) that
enables users find (and act upon) password entries based on patterns.

The `pass find` builtin shows results only in a tree format. Which forces the
user to tab-navigate the tree to find the entry. Displaying the results as a
regular path enables users to quickly find and act on matching entries.

Note: pass find-tail and find-show depends on the pass `tail` extension.

## Completion

The find-* extensions comes with the Bash completion support.

When installed, bash completion will be available. Alternatively source:
`completion/pass-find.bash.completion`

Note: Please contribute fish and zsh completion, if possible.

## pass find-list

```bash
$ pass find-list foo
/x/y/foo
```

## pass find-tail
```bash
$ pass find-tail foo
----------------------------------------
x/y/foo
----------------------------------------
user: <username>
url: <url>
note: ~
========================================
```

## pass find-show
```bash
$ pass find-tail foo
----------------------------------------
x/y/foo
----------------------------------------
<password>
user: <username>
url: <url>
note: ~
========================================
```

## Contribution

Contributions welcome.
