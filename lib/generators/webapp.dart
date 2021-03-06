// Copyright (c) 2014, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library stagehand.webapp;

import '../src/common.dart';

/**
 * A generator for a minimal web application.
 */
class WebAppGenerator extends DefaultGenerator {
  WebAppGenerator() : super(
      'webapp',
      "A minimal web app for the developer that doesn’t want to be confused by "
      "too much going on.",
      categories: const ['dart', 'web']) {

    addFile('pubspec.yaml', _pubspec);
    addFile('readme.md', _readme);
    addFile('web/index.html', _index);
    addFile('web/main.dart', _main);
    addFile('web/styles.css', _styles);

    setEntrypoint(getFile('web/index.html'));
  }

  String get _pubspec => '''
name: {{projectName}}
version: 0.0.1
description: >
${convertToYamlMultiLine(description)}
#author: First Last <email@example.com>
#homepage: https://www.example.com
environment:
  sdk: '>=1.0.0 <2.0.0'
dependencies:
  browser: any
''';

  String get _readme => '''
# {{projectName}}

A simple web application example. This is the minimal option for the developer
that doesn’t want to be confused by too much going on.
''';

  String get _main => '''
import 'dart:html';

void main() {
  var element = new DivElement()
    ..text = "Hello, World!";
  document.body.children.add(element);
}
''';

  String get _styles => '''
body {
  background-color: #F8F8F8;
  font-family: 'Open Sans', sans-serif;
  font-size: 18px;
  margin: 15px;
}
''';

  String get _index => '''
<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{projectName}}</title>
  <link rel="stylesheet" href="styles.css">
</head>

<body>
  <script type="application/dart" src="main.dart"></script>
  <script src="packages/browser/dart.js"></script>
</body>
</html>
''';
}
