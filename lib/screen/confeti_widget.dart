import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfetiWidgetExample extends StatefulWidget {
  const ConfetiWidgetExample({super.key});

  @override
  State<ConfetiWidgetExample> createState() => _ConfetiWidgetExampleState();
}

class _ConfetiWidgetExampleState extends State<ConfetiWidgetExample> {
  final controller = ConfettiController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(),
        ConfettiWidget(
          confettiController: controller,
          emissionFrequency: 1,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
          numberOfParticles: 20,
          colors: [Colors.pink],
        )
      ],
    );
  }
}
