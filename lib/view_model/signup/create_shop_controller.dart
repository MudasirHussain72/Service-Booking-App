import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/model/shop_model.dart';
import 'package:fyp/utils/routes/route_name.dart';
import 'package:fyp/utils/utils.dart';
import 'package:fyp/view_model/services/session_manager.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

class CreateShopController with ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  // status lodaing
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //create shop func
  void createShop(
    BuildContext context,
    String shopName,
    String phone,
    String latitude,
    String longitude,
    String address,
    String fromTime,
    String toTime,
    String serviceCategory,
  ) async {
    setLoading(true);
    try {
      ShopModel shop = ShopModel(
          shopName: shopName,
          phone: phone,
          address: address,
          shopImage: '',
          latitude: latitude,
          longitude: longitude,
          fromTime: fromTime,
          toTime: toTime,
          deviceToken: '',
          uid: SessionController().userId,
          serviceCategory: serviceCategory);
      db.collection('shops').doc(shop.uid).set(shop.toJson());
      final geo = GeoFlutterFire();
      GeoFirePoint myLocation = geo.point(
          latitude: double.parse(latitude), longitude: double.parse(longitude));
      await db
          .collection('shops')
          .doc(shop.uid)
          .update({'name': 'random name', 'position': myLocation.data});
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.barberdashboardView, (route) => false);
      await Utils.toastMessage("Account created successfully");
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }

  late TabController controller;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  setTabIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  List<String> tabText = [
    'Plumber',
    'Car Washer',
    'Car Mechanic',
    'Electrician',
    // 'science',
    // 'sports',
    // 'technology',
  ];

  String _selectedTapOption = 'Plumber';
  String get selectedTapOption => _selectedTapOption;

  setSelectedTabOption(String value) {
    _selectedTapOption = value;
    notifyListeners();
  }

  @override
  notifyListeners();
}
