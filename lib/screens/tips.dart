import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
    home: TipsScreen(),
  ));
}

class TipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
        backgroundColor: Colors.green,
      ),
      body: TipsContent(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              // Home screen
              break;
            case 1:
              Navigator.of(context).pushReplacementNamed('/articles');
              break;
            case 2:
              Navigator.of(context).pushReplacementNamed('/scan');
              break;
            case 3:
              Navigator.of(context).pushReplacementNamed('/calendar');
              break;
            case 4:
              Navigator.of(context).pushReplacementNamed('/settings');
              break;
          }
        },
      ),
    );
  }
}

class TipsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        TipCard(
          title: 'Tip 1: Watering Your Plants',
          content: 'Make sure to water your plants regularly. Different plants have different watering needs, so be sure to research the specific requirements of your plants.',
        ),
        TipCard(
          title: 'Tip 2: Sunlight and Shade',
          content: 'Ensure that your plants receive the right amount of sunlight. Some plants need full sun, while others thrive in the shade. Place your plants accordingly.',
        ),
        TipCard(
          title: 'Tip 3: Pruning and Trimming',
          content: 'Regularly prune and trim your plants to remove dead or diseased branches. This promotes healthy growth and prevents the spread of diseases.',
        ),
         TipCard(
          title: 'Tip 4: Fertilization',
          content: 'Use the right fertilizers in the right quantities. Conduct soil tests to determine nutrient deficiencies and apply fertilizers accordingly.',
        ),
        TipCard(
          title: 'Tip 5: Pest Management',
          content: 'Implement integrated pest management (IPM) strategies to control pests. Use biological controls, beneficial insects, and organic pesticides when needed.',
        ),
        TipCard(
          title: 'Tip 6: Weeding',
          content: 'Regularly remove weeds from your fields. Weeds compete with crops for nutrients and water, so keeping them under control is crucial.',
        ),
        TipCard(
          title: 'Tip 7: Timely Harvesting',
          content: 'Harvest your crops at the right time. Overripe or underripe produce may not store well and can lead to lower yields.',
        ),
        TipCard(
          title: 'Tip 8: Water Management',
          content: 'Manage water resources efficiently. Use drip irrigation or soaker hoses to minimize water wastage and ensure consistent soil moisture.',
        ),
        // Add more tip cards as needed
      ],
    );
  }
}

class TipCard extends StatelessWidget {
  final String title;
  final String content;

  TipCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              content,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
