import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate an initialization process with a delay
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false; // Hide the spinner after initialization
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/splash.jpg',
                width: 200.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Welcome to LI Plant Doc',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20.0),
            if (isLoading)
              CircularProgressIndicator() // Display the loading spinner
            else
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 69, 39),
                  borderRadius: BorderRadius.circular(70),
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
