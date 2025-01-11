import 'package:flutter/material.dart';
import 'summary_page.dart';

class QuickPayPage extends StatefulWidget {
  @override
  _QuickPayPageState createState() => _QuickPayPageState();
}

class _QuickPayPageState extends State<QuickPayPage> {
  final Map<String, int> _menuItems = {
    'Momo': 0,
    'Tea': 0,
    'Coffee': 0,
    'Pizza': 0,
    'Steak': 0,
    'Burger': 0,
    'Pasta': 0,
    'Salad': 0,
    'Juice': 0,
    'Ice Cream': 0,
  };

  void _incrementItem(String item) {
    setState(() {
      _menuItems[item] = (_menuItems[item]! + 1);
    });
  }

  void _decrementItem(String item) {
    if (_menuItems[item]! > 0) {
      setState(() {
        _menuItems[item] = (_menuItems[item]! - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Pay'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, Aadesh Gyawali',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Registration no: 012245'),
            SizedBox(height: 20),
            Text(
              'MENU',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: _menuItems.keys.map((item) {
                  return ListTile(
                    title: Text(item),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => _decrementItem(item),
                        ),
                        Text(_menuItems[item].toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => _incrementItem(item),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SummaryPage(
                        name: 'Aadesh Gyawali',
                        registrationNumber: '012245',
                        items: _menuItems,
                      ),
                    ),
                  );
                },
                child: Text('Processed to pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
