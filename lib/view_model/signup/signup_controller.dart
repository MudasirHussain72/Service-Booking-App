import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fyp/model/user_model.dart';
import 'package:fyp/utils/routes/route_name.dart';
import 'package:fyp/utils/utils.dart';
import 'package:fyp/view_model/services/session_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  // status lodaing
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // sign up func
  void signUpUser(
    BuildContext context,
    String username,
    String email,
    String password,
    bool isBarber,
  ) async {
    setLoading(true);
    final prefs = await SharedPreferences.getInstance();

    try {
      // ignore: unused_local_variable
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        UserModel user = UserModel(
          userName: username,
          email: value.user!.email,
          profileImage: '',
          isBarber: isBarber,
          uid: value.user!.uid,
          deviceToken: '',
        );
        SessionController().userId = value.user!.uid.toString();
        await prefs.setBool('isBarber', isBarber);
        db.collection('users').doc(user.uid).set(user.toJson());
        setLoading(false);
        if (isBarber == true) {
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.createShopView, (route) => false);
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.customerdashboardView, (route) => false);
        }
        await Utils.toastMessage("Account created successfully");
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(error.toString());
        //
        setLoading(false);
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }

  @override
  notifyListeners();
}
