import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper_app/authentication/auth.dart';
import 'package:wallpaper_app/components/already_had_acc.dart';
import 'package:wallpaper_app/components/roundedButton.dart';
import 'package:wallpaper_app/components/rounded_pass_field.dart';
import 'package:wallpaper_app/components/rounded_text_field.dart';
import 'package:wallpaper_app/components/signInwithGoogle.dart';
import 'package:wallpaper_app/screens/homeScreen/background.dart';
import 'package:wallpaper_app/screens/homeScreen/body.dart';
import 'file:///C:/flutter_proj/wallpaper_app/lib/wallpaper_main/views/mainScreen.dart';
import 'file:///C:/flutter_proj/wallpaper_app/lib/screens/profileView/userProfile.dart';

class Register extends StatelessWidget {
  String _email;
  String _pass;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async=> false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Background(),
              Text(
                  'Welcome to Wallpaper Wizard',
                  style:TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                  )
              ),
              SizedBox(height: 20,),
              Rounded_text_field(
                onChanged: (email){
                  _email='$email';
                },
              ),
              SizedBox(height: 5,),
              Rounded_pass_field(
                onChanged: (pass){
                  _pass='$pass';
                },
              ),
              SizedBox(height: 5,),
              RoundedButton(
                press: ()async{
                  dynamic result = await SignUp(_email,_pass);
                  if(result)
                  {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> ProfileCreate()));
                  }
                  else{
                  }
                },
              ),
              SizedBox(height: 3,),
              AlreadyhadAccount(
                login: false,
                press: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> Body()));
                },
              ),
              SizedBox(height: 30,),
              GoogleSignIn(),
              SizedBox(height: 5,),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'To get Code of this '
                      ),
                      TextSpan(
                          style: TextStyle(
                              color: Colors.blue[900]
                          ),
                          text: "App",
                          recognizer: TapGestureRecognizer()..onTap =  () async{
                            var url = 'https://github.com/Shahrukh-10/Flutter-Apps';
                            if (await canLaunch(url)) {
                              await launch(url);
                            }
                          }
                      ),
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
