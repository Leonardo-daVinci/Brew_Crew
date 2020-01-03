import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

 final AuthService _authService = AuthService();
 final _formKey = GlobalKey<FormState>();

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
        title: Text('Register to Brew Crew '),
        actions: <Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),

      body: Container(
        padding:EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey, //Used to associate validation with form
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              TextFormField(
                decoration:TextInputDecoration.copyWith(hintText: 'Email'),
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
                  if(_formKey.currentState.validate()){ //validate() invokes validator for each field (expects null for each case)
                    dynamic result = await _authService
                    .registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() => error = 'Suppy valid email!');
                    }
                  }
                },
                color:Colors.brown[500],
                child: Text(
                  'Register',
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