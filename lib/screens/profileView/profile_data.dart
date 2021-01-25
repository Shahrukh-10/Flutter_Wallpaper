import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ProfileData extends StatefulWidget {
  @override
  _ProfileDataState createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        padding: EdgeInsets.fromLTRB(8.0, 35.0, 8.0, 0.0),
                        child: Container(
                          child: Card(
                            color: Colors.amberAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 60.0,
                                ),
                                Divider(
                                  height: 20.0,
                                ),
                                SizedBox(height: 10.0,),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Name : ${document.id}',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),),
                                        SizedBox(height: 5.0,),
                                        Text('Address : ${document.data()['Address']}',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),),
                                        SizedBox(height: 5.0,),
                                        Text('Phone No : ${document.data()['Phone No']}',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Name : ${document.id}',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),),
                                        SizedBox(height: 5.0,),
                                        Text('Address : ${document.data()['Address']}',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),),
                                        SizedBox(height: 5.0,),
                                        Text('Phone No : ${document.data()['Phone No']}',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
