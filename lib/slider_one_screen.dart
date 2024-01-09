import 'package:bloga/provider/slider_one_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderOneExample extends StatefulWidget {
  const SliderOneExample({super.key});

  @override
  State<SliderOneExample> createState() => _SliderOneExampleState();
}

class _SliderOneExampleState extends State<SliderOneExample> {
  @override
  Widget build(BuildContext context) {
    final sliderOne = Provider.of<SliderOneProvider>(context, listen: false);
    print('build method');
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider Example'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Consumer<SliderOneProvider>(builder: (context, value, child) {
              return Slider(
                  value: sliderOne.value,
                  onChanged: (values) {
                    setState(() {});

                    value.getValue(values);
                  });
            }),
            Consumer<SliderOneProvider>(builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.value),
                      child: Center(
                          child: Text(
                        "Container 1",
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.indigo.withOpacity(value.value),
                      child: Center(
                          child: Text(
                        "Container 1",
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                  )
                ],
              );
            })
          ]),
        ));
  }
}
