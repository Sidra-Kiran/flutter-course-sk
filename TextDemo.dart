import 'package:flutter/material.dart';
class TextDemo extends StatefulWidget {
  const TextDemo({super.key});
  @override
  State<TextDemo> createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  double sum = 0;

  void calculateSum() {
    setState(() {
      double num1 = double.tryParse(controller1.text) ?? 0;
      double num2 = double.tryParse(controller2.text) ?? 0;
      sum = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Demo"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 11, 163, 238),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter first number",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter second number",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSum,
              child: const Text("Calculate Sum"),
            ),
            const SizedBox(height: 20),
            Text(
              "Sum: $sum",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}