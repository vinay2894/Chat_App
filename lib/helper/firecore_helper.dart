import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ig_database/helper/fire_auth_helper.dart';
import 'package:ig_database/models/add_user.dart';
import 'package:ig_database/models/chat_model.dart';
import 'package:ig_database/models/user_mmodel.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static final FirestoreHelper firestoreHelper = FirestoreHelper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String usercollection = "Users";
  String Friends = "friend";

  Future<void> adduser({required UserModal userModal}) async {
    await firestore
        .collection(usercollection)
        .doc(userModal.email)
        .set(userModal.toMap)
        .then(
          (value) => log("created"),
        );
  }

  Future<void> updateUser(
      {required UserModal userModal, required String email}) async {
    await firestore
        .collection(usercollection)
        .doc(email)
        .update(userModal.toMap);
  }

  Future<void> deleteUser(
      {required UserModal userModal, required String email}) async {
    await firestore
        .collection(usercollection)
        .doc(email)
        .update(userModal.toMap);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    String email =
        AuthHelper.authHelper.firebaseAuth.currentUser!.email as String;
    return firestore
        .collection(usercollection)
        .where('email', isEqualTo: email)
        .snapshots();
  }

  GetUser({required UserModal userModal}) {
    firestore.collection(usercollection).add(userModal.toMap).then(
          (value) => log(userModal.name),
        );
  }

  Future<void> addFriend({required UserModal userModal}) async {
    String email =
        AuthHelper.authHelper.firebaseAuth.currentUser!.email as String;
    FriendModel friendModel = FriendModel(
      id: userModal.id,
      name: userModal.name,
      email: userModal.email,
    );
    await firestore
        .collection(usercollection)
        .doc(email)
        .set(friendModel.toMap())
        .then(
          (value) => log("friend added"),
        );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFriendsList() {
    String email =
        AuthHelper.authHelper.firebaseAuth.currentUser!.email as String;
    return firestore
        .collection(usercollection)
        .doc(email)
        .collection('friends')
        .snapshots();
  }

  Future<void> sendChat(
      {required ChatModal chatModal,
      required String senderId,
      required String recieverId}) async {
    Map<String, dynamic> data = chatModal.toMap;

    data.update('type', (value) => 'sent');

    await firestore
        .collection(usercollection)
        .doc(senderId)
        .collection(recieverId)
        .doc(chatModal.time.millisecondsSinceEpoch.toString())
        .set(data);

    data.update('type', (value) => 'rec');

    await firestore
        .collection(usercollection)
        .doc(recieverId)
        .collection(senderId)
        .doc(chatModal.time.millisecondsSinceEpoch.toString())
        .set(data);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChat(
      {required String senderId, required String recieverId}) {
    return firestore
        .collection(usercollection)
        .doc(senderId)
        .collection(recieverId)
        .snapshots();
  }
}
