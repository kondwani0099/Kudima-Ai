import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  final GoogleSignInProvider googleSignInProvider = GoogleSignInProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/login.png',
              width: 200.0,
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
              onPressed: () async {
                final user = await googleSignInProvider.loginWithGoogle();
                if (user != null) {
                  Navigator.of(context).pushReplacementNamed('/home');
                } else {
                  // Handle Google login error
                }
              },
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
              label: Text(
                'Login with Google',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Email login logic here
                // Redirect to HomeScreen for now
                Navigator.of(context).pushReplacementNamed('/loginwithemail');
              },
              icon: Icon(
                Icons.email,
                size: 30.0,
              ),
              label: Text(
                'Login with Email',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleSignInProvider {
  final googleSignIn = GoogleSignIn();
  final auth = FirebaseAuth.instance;
  

  Future<User?> loginWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
