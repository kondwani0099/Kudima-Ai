import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  //final googleUser = ModalRoute.of(context)!.settings.arguments as User?;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kudima Ai'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications action
            },
          ),
        ],
      ),
        drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('John Doe'), // Replace with user's name
              accountEmail: Text('johndoe@example.com'), // Replace with user's email
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpeg'), // Replace with your user profile image
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.black, Colors.green],
                ),
              ),
            ),
//             UserAccountsDrawerHeader(
//   accountName: Text(googleUser.displayName ?? 'John Doe'),
//   accountEmail: Text(googleUser.email ?? 'johndoe@example.com'),
//   currentAccountPicture: CircleAvatar(
//     backgroundImage: googleUser.photoURL != null
//         ? NetworkImage(googleUser.photoURL!)
//         : AssetImage('assets/profile.jpeg'),
//   ),
//   decoration: BoxDecoration(
//     gradient: LinearGradient(
//       begin: Alignment.bottomLeft,
//       end: Alignment.topRight,
//       colors: [Colors.black, Colors.green],
//     ),
//   ),
// ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Handle About action
                Navigator.of(context).pushReplacementNamed('/aboutus');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                // Handle Contact Us action
                Navigator.of(context).pushReplacementNamed('/contactus');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('FAQ'),
              onTap: () {
                // Handle FAQ action
                Navigator.of(context).pushReplacementNamed('/faq');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share App'),
              onTap: () {
                // Handle Share App action
                 final link = 'https://lapansiindustries.com/kudimaapp.html'; // Replace with your actual web link
            Share.share('Check out our app: $link',
                subject: 'Download the App'); // Customize the message and subject
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out'),
              onTap: () {
                // Handle Sign Out action
                 _signOut(context); // Call the sign-out function
              },
            ),
          ],
        ),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       ListTile(
      //         title: Text('About Us'),
      //         onTap: () {
      //           // Handle About Us action
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Logout'),
      //         onTap: () {
      //           // Handle Logout action
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            createCard(
              "IoT Devices",
              FontAwesomeIcons.cogs,
              () {
                Navigator.of(context).pushReplacementNamed('/iotdevices');
              },
            ),
            createCard(
              "Marketplace",
              FontAwesomeIcons.shoppingCart,
              () {
                launchURL('https://amatradestore.com');
              },
            ),
            createCard(
              "Tutorial/Definitions",
              FontAwesomeIcons.book,
              () {
                launchURL('https://lapansiindustries.com/kudimaapp.html');
              },
            ),
            createCard(
              "Tips",
              FontAwesomeIcons.lightbulb,
              () {
                Navigator.of(context).pushReplacementNamed('/tips');
              },
            ),
            createCard(
              "Detect Disease",
              FontAwesomeIcons.camera,
              () {
                Navigator.of(context).pushReplacementNamed('/plant');
              },
            ),
            createCard(
              "Community",
              FontAwesomeIcons.users,
              () {
                launchURL('https://chat.whatsapp.com/Bk8R1j47k1X3thAlbdcAnw');
              },
            ),
          ],
        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle chatbot action
          Navigator.of(context).pushReplacementNamed('/chatbot');
        },
        child: Icon(Icons.chat),
      ),
    );
  }

  Widget createCard(String title, IconData icon, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5.0, // Add box shadow
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color.fromARGB(255, 156, 245, 161), width: 1.0), // Add green border
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Colors.green,
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void _signOut(BuildContext context) async {
  try {
    // Add your sign-out logic here, for example, if you are using Firebase:
    await FirebaseAuth.instance.signOut();
    
    // After successful sign-out, navigate back to the login screen or any other screen you prefer.
    Navigator.of(context).pushReplacementNamed('/loginn');
  } catch (e) {
    // Handle sign-out error
    print('Sign Out Error: $e');
    // You can also show an error message or alert dialog to the user.
  }
}

}
