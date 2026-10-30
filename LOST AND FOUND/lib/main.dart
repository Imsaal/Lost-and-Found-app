import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ItemListScreen()));
}

class Item {
  final String name;
  final String location;
  final String status;

  Item(this.name, this.location, this.status);
}

final List<Item> items = [
  Item('Black Backpack', 'Library', 'Lost'),
  Item('Blue Water Bottle', 'Cafeteria', 'Found'),
  Item('Student ID Card', 'Main Gate', 'Found'),
  Item('Calculator', 'Room 101', 'Lost'),
  Item('House Keys', 'Parking Lot', 'Lost'),
  Item('Wireless Earbuds', 'Computer Lab', 'Found'),
  Item('Umbrella', 'Admin Block', 'Found'),
  Item('Notebook', 'Playground', 'Lost'),
];

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lost & Found')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('${item.location} - ${item.status}'),
            trailing: ElevatedButton(
              child: Text('Details'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen(item)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Item item;
  DetailScreen(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${item.name}', style: TextStyle(fontSize: 20)),
            Text('Location: ${item.location}', style: TextStyle(fontSize: 20)),
            Text('Status: ${item.status}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Back'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
