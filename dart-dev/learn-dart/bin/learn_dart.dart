import 'dart:io';

// import 'package:learn_dart/learn_dart.dart' as learn_dart;

void main(List<String> arguments) {
  stdout.write('Nhap ten cua ban: ');
  String? name = stdin.readLineSync();

  print('Ten cua ban la: $name');

  // print('Hello world: ${learn_dart.calculate()}!');
}
