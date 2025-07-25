
import 'package:counter/sidrafirstapp';
import 'package:flutter/material.dart';
void main() {
  var future;
  runApp(FutureBuilder(
    future: future,
    builder: (context, asyncSnapshot) {
      return SidraFirstApp();
    }
  ));
}


