import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Text("Profile Screen"),
      // ),
      body: Center(
        child: InkWell(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: Text("Sign out"),
        ),
      ),
    );
  }
}
