import 'dart:io';

String fixture(String name) => File('text/fixture/$name').readAsStringSync();