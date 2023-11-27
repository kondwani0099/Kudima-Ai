import 'package:flutter/material.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          // Add any additional app bar actions if needed
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 25.0), // Adds 16 logical pixels of vertical space

          buildUserProfile(),
          buildListTile(
            'Change Appearance',
            Icon(Icons.palette), // Customize the icon as needed
          ),
          buildListTile(
            'About App',
            Icon(Icons.info), // Customize the icon as needed
          ),
          buildListTileWithArrow(
            'User Accounts',
            'Enable users to create accounts to save their plant profiles, disease history, and receive personalized care recommendations.',
          ),
          // Add a "Delete Account" tile
          buildListTileWithIcon(
            'Delete Account',
            Icon(Icons.delete, color: Colors.red), // Customize the icon and color
            () {
              // Add the logic to delete the user's account
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green, // Set the selected item color
        unselectedItemColor: Colors.black, // Set the unselected item color
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

  Widget buildUserProfile() {
    return Column(
      children: [
        CircleAvatar(
          radius: 70.0,
          backgroundImage: AssetImage('assets/profile.jpeg'), // Replace with your user profile image
        ),
        SizedBox(height: 16.0),
        Text(
          'John Doe', // Replace with user's name
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'johndoe@example.com', // Replace with user's email
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget buildListTile(String title, Icon icon) {
  return Padding(
    padding: EdgeInsets.only(top: 8.0, bottom: 8.0), // Adjust the values as needed
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 150, 233, 152)), // Add a green border
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 243, 242, 242).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: icon,
        title: Text(title),
        onTap: () {
          // Add the logic for the list tile's functionality
        },
      ),
    ),
  );
}

   Widget buildListTileWithIcon(String title, Icon icon, VoidCallback onTap) {
    return Padding(
    padding: EdgeInsets.only(top: 8.0, bottom: 8.0), // Adjust the values as needed
     child:Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 177, 231, 179)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 243, 242, 242).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: icon,
        title: Text(title),
        onTap: onTap,
      ),
    ),
    );
  }

  Widget buildListTileWithArrow(String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 119, 226, 123)), // Add a green border
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 248, 244, 244).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Add the logic for the list tile's functionality
        },
      ),
    );
  }
}
