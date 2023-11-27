import 'package:flutter/material.dart';

class PlantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Information'),
      ),
      body: ListView(
        children: [
          buildPlantContainer(
            plantName: 'Tomatoes',
            icon: Icons.local_florist, // Replace with a tomato icon
            onTap: () {
              // Navigate to the tomato scan page
              Navigator.of(context).pushNamed('/tomato_scan');
            },
          ),
          buildPlantContainer(
            plantName: 'Maize',
            icon: Icons.grass, // Replace with a maize icon
            onTap: () {
              // Navigate to the maize scan page
              Navigator.of(context).pushNamed('/maize_scan');
            },
          ),
          buildPlantContainer(
            plantName: 'Cassava',
            icon: Icons.eco, // Replace with a cassava icon
            onTap: () {
              // Navigate to the cassava scan page
              Navigator.of(context).pushNamed('/cassava_scan');
            },
          ),
        ],
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

  Widget buildPlantContainer({
    required String plantName,
    required IconData icon,
    required void Function() onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
      ),
      child: ListTile(
        leading: Icon(icon, size: 40.0),
        title: Text(plantName),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
