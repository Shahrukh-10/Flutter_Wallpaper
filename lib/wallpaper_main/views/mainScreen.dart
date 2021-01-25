import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/authentication/auth.dart';
import 'package:wallpaper_app/components/drawer%20fields.dart';
import 'package:wallpaper_app/components/profilecreate_func.dart';
import 'package:wallpaper_app/components/roundedButton.dart';
import 'package:wallpaper_app/components/signInwithGoogle.dart';
import 'package:wallpaper_app/screens/profileView/createProfile.dart';
import 'package:wallpaper_app/screens/profileView/profile_data.dart';
import 'package:wallpaper_app/main.dart';
import 'package:wallpaper_app/screens/profileView/profileView.dart';
import 'package:wallpaper_app/screens/profileView/userProfile.dart';
import 'package:wallpaper_app/screens/uploadImage/uploadImageFunc.dart';
import 'file:///C:/flutter_proj/wallpaper_app/lib/screens/profileView/userProfile.dart';
import 'package:wallpaper_app/wallpaper_main/views/home.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _name;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          elevation: 0.0,
          title: Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "Wallpaper ",
                style: TextStyle(color: Colors.white, fontFamily: 'Overpass'),
              ),
              Text(
                "Wizard",
                style: TextStyle(color: Colors.blue, fontFamily: 'Overpass'),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.grey[500],
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                  ),
                  child: Scaffold(
                    backgroundColor: Colors.grey[900],
                    body: StreamBuilder(
                      stream: FirebaseFirestore.instance.
                      collection('Wallpaper App UsersProfile Data').
                      doc(FirebaseAuth.instance.currentUser.uid).
                      collection('Profile Data').
                      snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot )
                      {
                        if(!snapshot.hasData)
                        {
                          return Center();
                        }
                        return ListView(
                          children: snapshot.data.docs.map((document) {
                            return Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0,80,0,0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 45,
                                          ),
                                          SizedBox(width:10),
                                          Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Hello',
                                                style: TextStyle(
                                                  letterSpacing: 2.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(height: 0),
                                              Text(
                                                  '${document.data()['Name']}',
                                                  style: TextStyle(
                                                  letterSpacing: 2.0,
                                                  fontSize: 20,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                            );
                          }
                          ).toList(),
                        );

                      },
                    ),
                  ),
                  ),
                Hero(
                  tag: '0',
                  child: Container(
                    child: Column(
                      children: [
                        Drawer_Fields(
                            press: ()async{

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()));
                            },
                            fieldname: 'View Profile',
                            icon: Icon(
                              Icons.people,
                            )
                        ),
                        Drawer_Fields(
                            press: ()async{

                            },
                            fieldname: 'View Profile',
                            icon: Icon(
                              Icons.people,
                            )
                        ),
                        Drawer_Fields(
                            press: ()async{
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateProfile()));
                            },
                            fieldname: 'Create Profile',
                            icon: Icon(
                              Icons.person,
                            )
                        ),
                        Drawer_Fields(
                          press: ()async{
                            await signOut();
                            await FirebaseAuth.instance.signOut().then((value) =>
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()))
                            );


                          },
                          fieldname: 'Logout',
                          icon: Icon(
                            Icons.logout,
                          )
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
            child: Home(),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          onPressed: pickAndUploadImage,
          icon: Icon(Icons.cloud_upload),
          label: Text('Image'),
        ),
      ),
    );
  }
}
