import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
    home: IoTScreen(),
  ));
}

class IoTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IoT Control'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SlidingContainers(),
            SizedBox(height: 20),
            ControlCards(),
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

class SlidingContainers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          final titles = ['Weather: Sunny', 'News: Latest updates', 'Devices Connected: 10'];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 27, 61, 27),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  titles[index],
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ControlCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            
            children: <Widget>[
              ControlCard(
                icon: Icons.thermostat,
                label: 'Temperature: 25°C',
              ),
              ControlCard(
                icon: Icons.wb_sunny,
                label: 'Moisture: 60%',
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ControlCard(
                icon: Icons.local_drink,
                label: 'Pump',
              ),
              ControlCard(
                icon: Icons.whatshot,
                label: 'Heaters',
              ),
            ],
          ),
          SizedBox(height: 20),
          // Add more control cards as needed
        ],
      ),
    );
  }
}

class ControlCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget control;

  ControlCard({required this.icon, required this.label, this.control = const SizedBox.shrink()});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Icon(icon, size: 50, color: Colors.green),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            control,
          ],
        ),
      ),
    );
  }
}
