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
  final ref = FirebaseDatabase.instance.reference();
  var data;
  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    data = await ref.child('EC').once().then((value) => value.value);
  }

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
    'time': DateTime.now().millisecondsSinceEpoch.toString(),
    'uid': '12q12312323',
    'videourl': 'https:// .... ',
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () async {
                  print('1');

                  data =
                      await ref.child('EC').once().then((value) => value.value);
                  String nextObjectname = data.length.toString();
                  await ref.child('EC').child(nextObjectname).set(message);
                  // .once()
                  // .then((value) => print('Data: ${value.value}'));
                  // var topUserPostsRef = ref.child("EC").child(path)
                  print('2');
                },
              ),
              Text(data.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
