import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/authentication/auth.dart';
import 'package:wallpaper_app/components/profilecreate_func.dart';
import 'package:wallpaper_app/main.dart';
import 'package:wallpaper_app/screens/profileView/profileView.dart';
import 'package:wallpaper_app/userProfile.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _name;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(title: Text('Wallpapers',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
          backgroundColor: Colors.grey[900],
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey[900]
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
                        return Center(

                        );
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
                                        )
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
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              )
            ],
          ),
        ),
        body: Center(),
      ),
    );
  }
}
//return Scaffold(
//       backgroundColor: Colors.grey[900],
//       appBar: AppBar(
//         backgroundColor: Colors.grey[900],
//         automaticallyImplyLeading: false,
//         actions: <Widget>[
//           IconButton(
//             color: Colors.white,
//             icon: Icon(Icons.person,),
//             onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileView()));
//             },
//           ),
//            IconButton(
//                 color: Colors.white,
//                 icon: Icon(Icons.logout,),
//                 onPressed: (){
//                   FirebaseAuth.instance.signOut().whenComplete(() =>
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()))
//                   );
//                 },
//               )
//         ],
//         title: Text('Wallpapers',
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold
//         ),),
//         centerTitle: true,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//         ),
//       ),
//     );