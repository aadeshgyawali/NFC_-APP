import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PinEntryPage extends StatefulWidget {
  final String name;
  final String registrationNumber;
  final Map<String, int> items;

  PinEntryPage({
    required this.name,
    required this.registrationNumber,
    required this.items,
  });

  @override
  _PinEntryPageState createState() => _PinEntryPageState();
}

class _PinEntryPageState extends State<PinEntryPage> {
  final TextEditingController _pinController = TextEditingController();
  final String correctPin = '0000';

  void _showPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Billing Information'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${widget.name}'),
              Text('Registration no: ${widget.registrationNumber}'),
              Text('Date: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}'),
              Text('Time: ${DateFormat('HH:mm:ss').format(DateTime.now())}'),
              ...widget.items.entries.map((entry) {
                return Text('${entry.key}: ${entry.value}');
              }).toList(),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Print'),
              onPressed: () {
                // Implement printing logic here for Sunmi V2 Pro
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _processPayment() {
    if (_pinController.text == correctPin) {
      _showPopup();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect Pin')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Pin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _pinController,
              maxLength: 4,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter Pin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _processPayment,
              child: Text('Pay and Print'),
            ),
          ],
        ),
      ),
    );
  }
}
