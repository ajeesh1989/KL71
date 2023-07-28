import 'package:flutter/material.dart';

class Icon3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
      ),
      body: Center(
        child: Icon(Icons.favorite, size: 100),
      ),
    );
  }
}
