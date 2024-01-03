import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fyp/utils/routes/route_name.dart';
import 'package:fyp/view_model/services/session_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;

  // for checking if Shop exists or not?
  static Future<bool> shopExists() async {
    return (await firestore
            .collection('shops')
            .doc(SessionController().userId)
            .get())
        .exists;
  }

  // for adding device token in db
  addDeviceToken(String collectionName, String docId, String deviceToken) {
    FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docId)
        .set({'deviceToken': deviceToken});
  }

  // for checking if Shop doc exists in booking collection or not?
  static Future<bool> shopInBookingsExists(shopUid) async {
    return (await firestore.collection('bookings').doc(shopUid).get()).exists;
  }
}

class SplashServices {
  void isLogin(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final prefs = await SharedPreferences.getInstance();
    final bool? isBarber = prefs.getBool('isBarber');
    final user = auth.currentUser;

    if (user != null && isBarber == true) {
      SessionController().userId = user.uid.toString();
      await prefs.setBool('isBarber', true);
      // Timer(
      //     const Duration(seconds: 2),
      //     () => Navigator.pushNamedAndRemoveUntil(
      //         context, RouteName.barberdashboardView, (route) => false));
      if (await APIs.shopExists()) {
        Timer(
            const Duration(seconds: 2),
            () => Navigator.pushNamedAndRemoveUntil(
                context, RouteName.barberdashboardView, (route) => false));
      } else {
        Timer(
            const Duration(seconds: 2),
            () => Navigator.pushNamedAndRemoveUntil(
                context, RouteName.createShopView, (route) => false));
      }
    } else if (user != null && isBarber == false) {
      SessionController().userId = user.uid.toString();
      await prefs.setBool('isBarber', false);
      Timer(
          const Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(
              context, RouteName.customerdashboardView, (route) => false));
    } else {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(
              context, RouteName.loginView, (route) => false));
    }
  }
}
