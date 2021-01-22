
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<UserCredential> signInWithGoogle() async{
  final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  return await _auth.signInWithCredential(credential);
}
Future signOut() async{
 await _googleSignIn.signOut();
}

Future<bool> SignIn(String email,String password)async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    return true;
  }
  catch(e)
  {
    print(e.toString());
    return false;
  }

}
Future<bool> SignUp(String email,String password)async{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password);
    return true;
  }
  catch(e)
  {
    print(e.toString());
    return false;
  }

}