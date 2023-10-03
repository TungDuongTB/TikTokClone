
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok/database/models/user.dart';
class UserRepository {
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future<User?> getUserByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await usersCollection
          .where('Email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> userData =
        querySnapshot.docs[0].data() as Map<String, dynamic>;

        return User(
          querySnapshot.docs[0].id,
          userData['Fullname'],
          userData['ProfileImageUrl'],
          userData['Email'],
          userData['Phone'],
          userData['Password'],
          userData['Gender'],
          userData['Age'],
        );
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting user by email: $e');
      return null;
    }
  }
  Future<void> updateUserRecord(User user) async{
    await usersCollection.doc(user.id).update(user.toJson());
  }
}
