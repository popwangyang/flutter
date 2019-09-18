import 'package:flutter/material.dart';
import 'package:flutter_app/components/header.dart';

class ContainerPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text('Container容器'),
      ),
      body: Header(),
    );
  }
}