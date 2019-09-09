import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("str"),
      ),
    );
  }
}