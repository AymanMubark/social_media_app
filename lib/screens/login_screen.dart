import 'package:flutter/material.dart';
import 'package:social_media_app/widgets/curve_clipper.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipPath(
                clipper: CurveClipper(),
                child: Image(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: double.infinity,
                  image: AssetImage('assets/images/login_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'FRENZY',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 34,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 10,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Username',
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    fillColor: Colors.white,
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 10,
                  ),
                  onPressed: () => Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomeScreen())),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Don\'t have an account? Sign up',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
