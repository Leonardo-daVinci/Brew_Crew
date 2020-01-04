import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brewlist.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider< List<Brew>>.value(
      value: DatabaseService().brews,
          child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon:Icon(Icons.person),
              onPressed: () async{
                await _authService.signOut();
              },
              label: Text('Logout'),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}