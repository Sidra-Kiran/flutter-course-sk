import 'package:flutter/material.dart';


void main() {
  runApp(sidraApp());
}

class sidraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Citra App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('SUM  App')),
        body: sidraHome(),
      ),
    );
  }
}

class sidraHome extends StatefulWidget {
  @override
  _sidraHomeState createState() => _sidraHomeState();
}

class _sidraHomeState extends State<sidraHome> {
  bool isSwitched = false;
  double slider1Value = 0;
  double slider2Value = 0;
  String result = "";

  TextEditingController textController = TextEditingController();

  void _sumValues() {
    double sum = slider1Value + slider2Value;
    setState(() {
      result = "Result: $sum";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Switch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Switch ON/OFF"),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    if (!isSwitched) {
                      result = "";
                      textController.clear();
                    }
                  });
                },
              ),
            ],
          ),

          // Conditional widgets
          if (isSwitched) ...[
            SizedBox(height: 20),

            // Slider 1 and value
            Text("Slider 1 value: ${slider1Value.toStringAsFixed(1)}"),
            Slider(
              value: slider1Value,
              min: 0,
              max: 100,
              divisions: 100,
              label: slider1Value.round().toString(),
              onChanged: (value) {
                setState(() {
                  slider1Value = value;
                  textController.text =
                      "Slider1: ${slider1Value.toStringAsFixed(1)}, Slider2: ${slider2Value.toStringAsFixed(1)}";
                });
              },
            ),

            SizedBox(height: 10),

            // Slider 2 and value
            Text("Slider 2 value: ${slider2Value.toStringAsFixed(1)}"),
            Slider(
              value: slider2Value,
              min: 0,
              max: 100,
              divisions: 100,
              label: slider2Value.round().toString(),
              onChanged: (value) {
                setState(() {
                  slider2Value = value;
                  textController.text =
                      "Slider1: ${slider1Value.toStringAsFixed(1)}, Slider2: ${slider2Value.toStringAsFixed(1)}";
                });
              },
            ),

            SizedBox(height: 20),

            // TextField
            TextField(
              controller: textController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Slider Values',
              ),
            ),

            SizedBox(height: 20),

            // Button
            ElevatedButton(
              onPressed: _sumValues,
              child: Text("SUM Value"),
            ),

            SizedBox(height: 20),

            // Result Container
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: Text(
                result,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ],
      ),
    );
  }
}