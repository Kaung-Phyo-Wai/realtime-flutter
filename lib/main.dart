import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyUser {
  MyUser({this.email, this.username});
  String email;
  String username;
}

class MyApp extends StatefulWidget {
  MyApp({this.app});
  final FirebaseApp app;
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final refDatabase = FirebaseDatabase.instance.reference();

  // firebase.database().ref('ReferernceName').once('value',   function(snapshot) {
  //   snapshot.forEach(function(childSnapshot) {
  //     var childKey = childSnapshot.key;
  //     var childData = childSnapshot.val();
  //     // ...
  //   });
  // });
  // Function savedata({String location_to_save, String data}) {
  //   MyUser user = MyUser(email: 'aksdf', username: 'aksdf');
  //   database.child('users').child('hello').set('user.email');
  // }
  var message = {
    'username': 'Kaung',
    'message': 'askdfa',
    'photourl': 'https:// etc',
    'time': DateTime.now(),
    'uid': '12q12312323',
    'videourl': 'https:// .... ',
  };
  @override
  Widget build(BuildContext context) {
    final ref = refDatabase;
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () async {
                  await ref.child('EC').push().set(message);
                  print('1');
                  // await ref
                  //     .once()
                  //     .then((value) => print('Data: ${value.value}'));
                  //     var topUserPostsRef = ref.child("EC").child(path)
                  // print('2');
                },
              ),
              Text('hello'),
            ],
          ),
        ),
      ),
    );
  }
}
