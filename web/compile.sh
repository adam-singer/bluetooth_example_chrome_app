#!/bin/bash
PATH=/Applications/dart/dart-sdk/bin/:$PATH
dart2js --disallow-unsafe-eval -obluetooth_example.dart.js bluetooth_example.dart

