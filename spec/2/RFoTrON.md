Relaxed FOlded TRee Object Notation (RFoTrON) is an extension to 1/FoTrON, indroducing several usability features.

* Domain: FoTrON.github.io/rfc
* Shortname: 2/RFoTrON
* Name: Relaxed FOlded TRee Object Notation
* status: draft
* editor: Pavel Pletenev <cpp.create@gmail.com>


## License

Copyright (c) 2017 Pavel Pletenev.

This Specification is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

This Specification is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program; if not, see http://www.gnu.org/licenses.

## Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119](http://tools.ietf.org/html/rfc2119).

## Goals
Relaxed FOlded TRee Object Notation (RFoTrON) is an extension to [1/FoTrON](1/FoTrON), indroducing several usability features.
FoTrON, while being quite useful and strict, is a bit hard to edit by hand. It uses tab symbol as only indentation. Also it is unclear, which encoding is used in the document.

## Implementation

1. Indentation in RFoTrON MAY consist of both tabs ('\t') and spaces (' '), but it ony one type of symbols SHOULD be used in the entire document. If both indentation symbols are used implementation SHOULD raise an error.
2. A RFoTrON document MAY declare the encoding to use to parse strings via a top-level node line this: `coding \utf-8`. This node MUST be the first line of file.
3. A RFoTrON document MAY declare itself to be exclusively binary via a top-level node line this: `coding \binary`. This node MUST be the first line of file. After this directive implementation SHOULD reopen the file as binary-only.
