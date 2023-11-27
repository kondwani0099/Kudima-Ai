import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWithEmailScreen extends StatefulWidget {
  @override
  _LoginWithEmailScreenState createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/login.png',
                  width: 200.0,
                ),
              ),
              TextFormField(
                controller: _emailController,
                 decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _passwordController,
                //decoration: InputDecoration(labelText: 'Password'),
                 decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _loginWithEmail(_email!, _password!);
                  }
                },
                child: Container(
                  width: 200,
                  height: 60,
                  child: Center(
                    child: Text(
                      'Login with Email',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to the sign-up screen
                  // You can define the sign-up screen separately
                 Navigator.of(context).pushNamed('/signup'); 
                },
                child: Text('Don\'t have an account? Sign Up'),
              ),
              TextButton(
                onPressed: () {
                  _resetPassword(_email!);
                },
                child: Text('Forgot Password? Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loginWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Navigate to the home screen or any other desired screen upon successful login
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign in with Email and Password: $e'),
        ),
      );
    }
  }

  Future<void> _resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset link sent to your email.'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send password reset link: $e'),
        ),
      );
    }
  }
}
