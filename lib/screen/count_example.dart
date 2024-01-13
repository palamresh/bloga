import 'package:bloga/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final counterProvider =
    //Provider.of<CounterProvider>(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // counterProvider.countIncrease();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("CounterProvider Example"),
      ),
      body: Center(
          child: Consumer<CounterProvider>(builder: (context, value, child) {
        return Text(
          value.count.toString(),
          style: TextStyle(fontSize: 30),
        );
      })),
    );
  }
}
