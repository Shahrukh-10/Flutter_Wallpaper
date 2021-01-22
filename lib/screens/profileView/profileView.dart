import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/profileView/profile_data.dart';
import 'package:wallpaper_app/userProfile.dart';


class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          Container(
            child: Flexible(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.
                collection('Wallpaper App UsersProfile Data').
                doc(FirebaseAuth.instance.currentUser.uid).
                collection('Profile Data').
                snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot )
                {
                  if(!snapshot.hasData)
                  {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    children: snapshot.data.docs.map((document) {
                      return Container(
                        child: Container(
                            width: size.width,
                            height: size.height,
                            child: Column(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage('assets/images/ninja1.png'),
                                        radius: 70.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                              child: Divider(
                                                color: Colors.white,
                                                height: 1.5,
                                              )
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                                            child: Text(
                                              'PROFILE',style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                            ),
                                            ),
                                          ),
                                          Expanded(
                                              child: Divider(
                                                color: Colors.white,
                                                height: 1.5,
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'NAME',
                                              style: TextStyle(
                                                letterSpacing: 2.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                              '${document.data()['Name']}',
                                              style: TextStyle(
                                                  color: Colors.amberAccent[200],
                                                  letterSpacing: 2.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28.0
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30.0),
                                  Container(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'PHONE NO',
                                              style: TextStyle(
                                                letterSpacing: 2.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                              '${document.data()['Phone No']}',
                                              style: TextStyle(
                                                  color: Colors.amberAccent[200],
                                                  letterSpacing: 2.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28.0
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30.0),
                                  Container(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.email_rounded,
                                          color: Colors.grey[400],
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(
                                          '${document.data()['Email']}',
                                          style: TextStyle(
                                            letterSpacing: 2.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                            ),
                          )
                      );
                    }
                    ).toList(),
                  );

                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//Container(
//           width: size.width,
//           height: size.height,
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: CircleAvatar(
//                       backgroundImage: AssetImage('assets/images/ninja1.png'),
//                       radius: 70.0,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                             child: Divider(
//                               color: Colors.white,
//                               height: 1.5,
//                             )
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
//                           child: Text(
//                             'PROFILE',style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold
//                           ),
//                           ),
//                         ),
//                         Expanded(
//                             child: Divider(
//                               color: Colors.white,
//                               height: 1.5,
//                             )
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//           ),
//         ),