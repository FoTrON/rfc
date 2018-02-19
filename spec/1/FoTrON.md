FOlded TRee Object Notation (FoTrON) is a simple fast compact user-readable binary-safe extensible structural format, aimed at readability and extensionability.

* Domain: FoTrON.github.io/rfc
* Shortname: 1/FoTrON
* Name: FOlded TRee Object Notation
* status: draft
* editor: Pavel Pletenev <cpp.create@gmail.com>
* contributors: Dmitrii Karloskii <nin-jin@ya.ru>


## License

Copyright (c) 2017 Pavel Pletenev.

This Specification is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

This Specification is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program; if not, see http://www.gnu.org/licenses.

## Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119](http://tools.ietf.org/html/rfc2119).

## Goals
FOlded TRee Object Notation (FoTrON) is a simple fast compact user-readable binary-safe extensible structural format, aimed at readability and extensionability.
FoTrON is aimed to be a more human-readable and human-writeable object notation. This is archived with use of structural whitespaces and almost verbatim binary storage. FoTrON does not define any type system. Everything is stored as raw bytes. It can store without any encoding other serialization notations such as JSON, XML or YAML.

## Description
FoTrON is described in a following ABNF.

```abnf
tree = *(line | data-line)

line = *indent [names] [data] new-line
data-line = *indent data new-line

names = name *(space name)
;name = byte except special
name = non-special

data = data-prefix data-bytes new-line
data-bytes = *data-byte
;data-byte = byte except new-line
data-byte = non-special | data-prefix | indent | space

special = new-line | data-prefix | indent | space
non-special = %x00-08 | %x0B-19 | %x21-5B | %x5D-FF
indent = %x09
new-line = %x0A
data-prefix = %x5C
space = %x20
```

### Other requirements

1. A tree node SHOULD be represented as a record containing name, data and a list of child nodes. The name field is parsed from `name` non-terminal, value is parsed from `data-bytes` non-terminal.
1. Two adjacent `name` MUST become parent and child. Left `name` becomes parent, right `name` becomes child.
1. A node from `line` is a node with rightmost name.
1. Any leftmost tree nodes from `line` with non-zero indent length MUST become children of node from `line` with indent length less by one.
1. Values from any adjacent `data-line` with equal `indent` MUST be united in one value with `new-line` between.

# Examples
```fotron
access
	time \2035-28-07 13:08:24
	url \/favicon.png
	ip \8.8.8.8
access
	time \2035-28-07 13:08:26
	url \/favicon.ico
	ip \8.8.8.8
```
This structure SHOULD be parsed to the following structure:
```python
TreeNode(name="", value="", children=[
    TreeNode(name="access", value="", children=[
        TreeNode(name="time", value="2035-28-07 13:08:24", children=[]),
        TreeNode(name="url", value="/favicon.png", children=[]),
        TreeNode(name="ip", value="8.8.8.8", children=[])]),
    TreeNode(name="access", value="", children=[
        TreeNode(name="time", value="2035-28-07 13:08:26", children=[]),
        TreeNode(name="url", value="/favicon.ico", children=[]),
        TreeNode(name="ip", value="8.8.8.8", children=[])])])
```

## References and implementations

1. FoTrON was introduced by Dmitrii in a [russian article on HabraHabr](http://habrahabr.ru/post/248147/)
2. FoTrON has an example implementation in D programming language - [nin-jin/tree.d](https://github.com/nin-jin/tree.d). 
