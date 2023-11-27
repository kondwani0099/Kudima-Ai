import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MonthCell('January', 'Best Crops: Carrots, Spinach', 'Most Likely Disease: Early Blight'),
            MonthCell('February', 'Best Crops: Broccoli, Peas', 'Most Likely Disease: Leaf Mold'),
            MonthCell('March', 'Best Crops: Lettuce, Radishes', 'Most Likely Disease: Bacteria Spot'),
            MonthCell('April', 'Best Crops: Tomatoes, Peppers', 'Most Likely Disease: Late Blight'),
            MonthCell('May', 'Best Crops: Cucumbers, Melons', 'Most Likely Disease: Leaf Mold'),
            MonthCell('June', 'Best Crops: Corn, Beans', 'Most Likely Disease: Target Spot'),
            MonthCell('July', 'Best Crops: Zucchini, Squash', 'Most Likely Disease: Tomato Yellow Leaf Curl Virus'),
            MonthCell('August', 'Best Crops: Eggplant, Okra', 'Most Likely Disease: Tomato Mosaic Virus'),
            MonthCell('September', 'Best Crops: Pumpkins, Apples', 'Most Likely Disease: Septoria Leaf Spot'),
            MonthCell('October', 'Best Crops: Potatoes, Cauliflower', 'Most Likely Disease: Late Blight'),
            MonthCell('November', 'Best Crops: Radishes, Turnips', 'Most Likely Disease: Bacteria Spot'),
            MonthCell('December', 'Best Crops: Kale, Brussels Sprouts', 'Most Likely Disease: Early Blight'),
          ],
        ),
      ),
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
               Navigator.of(context).pushReplacementNamed('/home');
              break;
            case 1:
              Navigator.of(context).pushReplacementNamed('/articles');
              break;
            case 2:
              Navigator.of(context).pushReplacementNamed('/scan');
              break;
            case 3:
              // Stay on the calendar screen
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

class MonthCell extends StatelessWidget {
  final String month;
  final String cropInfo;
  final String diseaseInfo;

  MonthCell(this.month, this.cropInfo, this.diseaseInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text(month, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Divider(),
          Text(cropInfo, style: TextStyle(fontSize: 14)),
          Divider(),
          Text(diseaseInfo, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalendarScreen(),
    routes: {
      '/articles': (context) => PlaceholderScreen('Articles'),
      '/scan': (context) => PlaceholderScreen('Scan'),
      '/settings': (context) => PlaceholderScreen('Settings'),
    },
  ));
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  PlaceholderScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Placeholder for $title'),
      ),
    );
  }
}
