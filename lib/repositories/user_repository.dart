import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:uncanny_woods/databases/db_firestore.dart';
import 'package:uncanny_woods/models/user.dart';
import 'package:uncanny_woods/services/auth_service.dart';

class UserRepository extends ChangeNotifier {
  static User? _userData;
  late FirebaseFirestore db;
  late AuthService auth;

  UserRepository({required this.auth}) {
    _startRepository();
    _userData = User(
      username: '',
      email: '',
      dateOfBirth: DateTime.now(),
      senha: '',
    );
  }

  _startRepository() async {
    await _startFirestore();
    await _readData();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _readData() async {
    if (auth.usuario != null) {
      try {
        final snapshot =
            await db.collection('users/${auth.usuario!.uid}/data').get();

        final doc = snapshot.docs.first;
        User user = User(
          username: doc.get('username'),
          email: doc.get('email'),
          dateOfBirth: doc.get('dateOfBirth').toDate(),
          senha: doc.get('senha'),
        );
        _userData = user;
        notifyListeners();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  saveData(User user) async {
    try {
      await db
          .collection('users/${auth.usuario!.uid}/data')
          .doc(user.email)
          .set({
        'username': user.username,
        'email': user.email,
        'dateOfBirth': user.dateOfBirth,
        'senha': user.senha,
      });
      _userData = user;
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  updateUserData(User user, String email) {
    FirebaseFirestore.instance
        .collection('users/${auth.usuario!.uid}/data')
        .doc(email)
        .update({
      'username': user.username,
      'email': user.email,
      'dateOfBirth': user.dateOfBirth,
      'senha': user.senha,
    });
    _userData = user;
    notifyListeners();
  }

  User? get userData => _userData;
}
