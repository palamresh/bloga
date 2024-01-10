import 'package:flutter/material.dart';

class DragerExample extends StatefulWidget {
  const DragerExample({super.key});

  @override
  State<DragerExample> createState() => _DragerExampleState();
}

class _DragerExampleState extends State<DragerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drager Example'),
      ),
      body: Draggable(
        feedback: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.pink,
        ),
        childWhenDragging: Container(
          width: 100,
          height: 100,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
