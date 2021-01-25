import 'package:flutter/material.dart';
import 'package:wallpaper_app/authentication/auth.dart';
import 'file:///C:/flutter_proj/wallpaper_app/lib/wallpaper_main/views/mainScreen.dart';
class GoogleSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.75,
      height: size.height*0.065,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(30),
      ),
      child: RaisedButton(
        color: Colors.grey[900],
        elevation: 0,
        onPressed: () {
          signInWithGoogle().whenComplete(() =>
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()))
          );
        },
        child: Text(
          'Continue With Google',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0
          ),
        ),
      ),
    );
  }
}
