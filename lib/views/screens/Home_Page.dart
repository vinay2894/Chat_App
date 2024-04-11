import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ig_database/helper/fire_auth_helper.dart';
import 'package:ig_database/helper/firecore_helper.dart';
import 'package:ig_database/models/add_user.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = AuthHelper.authHelper.firebaseAuth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
        ),
        actions: [
          IconButton(
            onPressed: () {
              AuthHelper.authHelper.signOut().then(
                    (value) => Navigator.of(context).pushReplacementNamed('/'),
                  );
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: StreamBuilder(
            stream: FirestoreHelper.firestoreHelper.getFriendsList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                QuerySnapshot<Map<String, dynamic>>? data = snapshot.data;
                List<QueryDocumentSnapshot<Map<String, dynamic>>>? alldocs =
                    data?.docs;

                List<FriendModel> allFriends = alldocs
                        ?.map(
                          (e) => FriendModel.fromMap(data: e.data()),
                        )
                        .toList() ??
                    [];
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
