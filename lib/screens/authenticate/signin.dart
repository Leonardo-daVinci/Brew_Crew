import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor:Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In to Brew Crew '),
      ),

      body: Container(
        padding:EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RaisedButton(
          child:Text('Sign In Anon'),
          onPressed: () async {
            dynamic result = await _authService.signinAnonymous();
            if(result == null){
              print("Error signin");
            }else{
              print("Success signin");
              print(result.uid);
            }
          },

        )
      ),
    );
  }
}