import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallpaper_app/screens/profileView/profile_data.dart';

Future<bool> createProfile(String name,String phone,String mail)async{
  try{
    String uid = FirebaseAuth.instance.currentUser.uid;
    var number = double.parse(phone);
    DocumentReference documentReference = FirebaseFirestore.instance.
      collection('Wallpaper App UsersProfile Data').
      doc(uid).
      collection('Profile Data').
      doc(name);
    FirebaseFirestore.instance.runTransaction((transaction) async{
      DocumentSnapshot snapshot = await transaction.get(documentReference);
        if(!snapshot.exists)
        {
          documentReference.set({
            'Name':name,
            'Unique Id':uid,
            'Phone No':phone,
            'Email':mail
          });
        }
    });
    return true;
  }catch(e){
      return false;
  }
}
////////////////////////////////////////////////////////////////////
bool validate(String name,String mail,String email){
  if(name==null || mail==null || email==null)
    {
      print('empty');
      return false;
    }
  else{
    print('fill');
    return true;
  }
}
////////////////////////////////////////////////////////////////////
Future<bool> checkIfProfile_Exist()async{
  try{
    String uid = FirebaseAuth.instance.currentUser.uid;
    final snapShot = await FirebaseFirestore.instance
        .collection('Wallpaper App UsersProfile Data')
        .doc(uid)
        .get();
        String string = snapShot.toString();
        print(string);
         if(snapShot.exists)
        {
          print('true');
          return true;
        }
         else{
           return false;
         }
  }catch(e){
    print ('false');
    return false;
  }
}
//////////////////////////////////////////////////////////////////////
