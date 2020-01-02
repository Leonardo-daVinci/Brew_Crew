import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();

  //textfields state
  String email ='';
  String password ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor:Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In to Brew Crew '),
        actions: <Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person),
            label: Text('Register'),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),

      body: Container(
        padding:EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (val){
                   setState(() => email = val);
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () async{
                  print(email);
                  print(password);
                },
                color:Colors.brown[500],
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),

              )
        ],
        ),
        )
      ),
    );
  }
}