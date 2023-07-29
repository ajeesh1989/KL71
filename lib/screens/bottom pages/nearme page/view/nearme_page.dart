import 'package:flutter/material.dart';

class NearMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Near me'),
      ),
      body: Center(
        child: Icon(Icons.ac_unit, size: 100),
      ),
    );
  }
}
