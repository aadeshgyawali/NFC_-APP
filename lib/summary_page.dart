import 'package:flutter/material.dart';
import 'pin_entry_page.dart';

class SummaryPage extends StatelessWidget {
  final String name;
  final String registrationNumber;
  final Map<String, int> items;

  SummaryPage({
    required this.name,
    required this.registrationNumber,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Reg no - $registrationNumber'),
            SizedBox(height: 20),
            Text(
              'Menu list',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: items.entries.map((entry) {
                  return ListTile(
                    title: Text(entry.key),
                    trailing: Text(entry.value.toString()),
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
                      builder: (context) => PinEntryPage(
                        name: name,
                        registrationNumber: registrationNumber,
                        items: items,
                      ),
                    ),
                  );
                },
                child: Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
