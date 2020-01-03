import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();
   final _formKey = GlobalKey<FormState>();

  //textfields state
  String email ='';
  String password ='';
  String error ='';


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
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              TextFormField(
                decoration: TextInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty? 'Enter email address' :null,
                onChanged: (val){
                   setState(() => email = val);
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: TextInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length<6 ? 'Password must be at least 6 characters' :null,
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    dynamic result = await _authService
                    .signinWithEmailAndPassword(email, password);
                    if(result== null){
                      setState(() =>error = 'Cannot sign in! ');
                    }
                  }
                },
                color:Colors.brown[500],
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
              ),
               SizedBox(height: 20,),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                )
              ),
        ],
        ),
        )
      ),
    );
  }
}