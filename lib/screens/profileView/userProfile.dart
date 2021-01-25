import 'package:flutter/material.dart';
import 'package:wallpaper_app/components/profile_text_field.dart';
import 'package:wallpaper_app/components/profilecreate_func.dart';
import 'package:wallpaper_app/components/roundedButton.dart';
import 'file:///C:/flutter_proj/wallpaper_app/lib/wallpaper_main/views/mainScreen.dart';

class ProfileCreate extends StatelessWidget {
  String _mail;
  String _phone;
  String _name;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async=> false,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('Create Profile',
          style: TextStyle(
            color: Colors.white
          ),),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: size.height,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(17,20,0,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Profile_text_field(
                      icon: Icon(Icons.person,color: Colors.white,),
                      label: 'Name',
                      onChanged: (name){
                        _name='$name';
                      },
                    ),
                    SizedBox(height: 20,),
                    Profile_text_field(
                      icon: Icon(Icons.phone_enabled_outlined,color: Colors.white,),
                      label: 'Phone No',
                      onChanged: (phone){
                        _phone='$phone';
                      },
                    ),
                    SizedBox(height: 20,),
                    Profile_text_field(
                      icon: Icon(Icons.email,color: Colors.white,),
                      label: 'Email',
                      onChanged: (mail){
                        _mail='$mail';
                      },
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:130),
                      child: RaisedButton(
                        color: Colors.red[900],
                        onPressed: ()async{
                          dynamic val= validate(_name, _mail, _phone);
                          if(val)
                          {
                            dynamic result = await createProfile(_name,_phone,_mail);
                            if(result){
                              print('profile created');
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                            }
                            else{
                              print('profile not created');
                            }
                          }
                          else{
                              return AlertDialog(
                                    title: Text('AlertDialog Title'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text('This is a demo alert dialog.'),
                                          Text('Would you like to approve of this message?'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Approve'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );

                          }

                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text('Create Profile',
                        style: TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                        ),

                      ),
                    ),
                    SizedBox(height: 350,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('# INSTRUCTION',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          Text('1. Fill all fields',
                            style: TextStyle(
                                color: Colors.white30,
                                fontSize: 6,
                                fontWeight: FontWeight.bold
                            ),),
                          SizedBox(height: 2,),
                          Text('2. Enter only number in phone no',
                            style: TextStyle(
                                color: Colors.white30,
                                fontSize: 6,
                                fontWeight: FontWeight.bold
                            ),),
                          SizedBox(height: 2,),
                          Text('3. Follow these instruction to create profile',
                            style: TextStyle(
                                color: Colors.white30,
                                fontSize: 6,
                                fontWeight: FontWeight.bold
                            ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
