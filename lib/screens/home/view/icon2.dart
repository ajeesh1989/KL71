import 'package:flutter/material.dart';

class Icon2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Where to stay'),
      ),
      body: Center(
        child: Icon(Icons.star, size: 100),
      ),
    );
  }
}
