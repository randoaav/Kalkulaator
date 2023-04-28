import 'package:flutter/material.dart';

class KmToMileConverter extends StatefulWidget {
  @override
  _KmToMileConverterState createState() => _KmToMileConverterState();
}

class _KmToMileConverterState extends State<KmToMileConverter> {
  final TextEditingController _kmController = TextEditingController();
  double _miles = 0;

  void _convert() {
    double km = double.tryParse(_kmController.text) ?? 0;
    setState(() {
      _miles = km * 0.621371;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Km to Mile Converter'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _kmController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter distance in kilometers',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              child: Text('Convert'),
              onPressed: _convert,
            ),
            SizedBox(height: 8.0),
            Text(
              '$_miles miles',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
