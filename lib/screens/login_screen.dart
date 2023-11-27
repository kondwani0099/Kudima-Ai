import 'package:flutter/material.dart';
import 'package:plantdoc/screens/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/login.png',
              width: 200.0, // Adjust the width as needed
            ),
            SizedBox(height: 20.0),
            Text(
              'User Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 52, 211, 46),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Google login logic here
                // Redirect to HomeScreen for now
                Navigator.of(context).pushReplacementNamed('/home');
              },
              // icon: Image.asset(
              //   'assets/google_icon.png', // Replace with the Google icon asset path
              //   width: 30.0, // Adjust the size of the Google icon
              // ),
              icon: FaIcon(
                        FontAwesomeIcons.google, // Use the Google icon here
                        color: Colors.white,
                      ),
              label: Text(
                'Login with Google',
                style: TextStyle(
                  fontSize: 20.0, // Adjust the button text size
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Set the button's background color to green
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0), // Adjust button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Add rounded corners
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Email login logic here
                // Redirect to HomeScreen for now
                Navigator.of(context).pushReplacementNamed('/home');
              },
              icon: Icon(
                Icons.email,
                size: 30.0, // Adjust the size of the email icon
              ),
              label: Text(
                'Login with Email',
                style: TextStyle(
                  fontSize: 20.0, // Adjust the button text size
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Set the button's background color to green
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0), // Adjust button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Add rounded corners
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
