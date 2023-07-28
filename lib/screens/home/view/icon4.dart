import 'package:flutter/material.dart';

class Icon4Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency'),
      ),
      body: Center(
        child: Icon(Icons.ac_unit, size: 100),
      ),
    );
  }
}
