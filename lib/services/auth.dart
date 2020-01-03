import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user object based on FirebaseUser
  User _userFromFirebase (FirebaseUser user){
    return user!=null ? User(uid: user.uid) : null;
  }

  //Auth change user stream 
  //everytime some user signin or signout, we get result in the stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
    //.map( (FirebaseUser user) => _userFromFirebase(user));
    .map(_userFromFirebase);
  }

  //Anonymous signin method
  Future signinAnonymous() async {
    try {
      
      AuthResult result =await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebase(user);

    }catch (e) {
      print(e.message);
      return null;
    }
  }

  //register method with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth
      .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);

    }catch (e) {
      print(e.message);
      return null;
    }
  }

  //signin with email and password
Future signinWithEmailAndPassword(String email, String password) async {
  try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email:email, password:password);
    FirebaseUser user = result.user;
    return _userFromFirebase(user);
  }catch (e) {
    print(e.message);
    return null;
  }
}
  //signout method
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.message);
      return null;
    }
  }

}