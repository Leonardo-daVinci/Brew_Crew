import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({this.uid});
  
  //collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');
  // if the collection is not present in the firestore then it is created automatically

  Future updateUserData(String sugars, String name, int strength) async{
    //if the document with uid is not present then it is automatically created
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }

  //brew list from snapshots
  List<Brew> _brewListFromSnapshots(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0',
      );
    }).toList();
  }

  //userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

  //get collection streams
  Stream< List<Brew>> get brews {
    return brewCollection.snapshots()
    .map(_brewListFromSnapshots);
  }

  //get user document streams
  Stream <UserData> get userdata{
    return brewCollection.document(uid)
    .snapshots().map(_userDataFromSnapshot);
  } 

}