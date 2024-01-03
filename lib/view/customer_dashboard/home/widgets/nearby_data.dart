import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/res/component/shop_display_card.dart';
import 'package:fyp/view_model/customer_dashboard/customer_home/customer_home_controller.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:provider/provider.dart';

class NearbyData extends StatefulWidget {
  const NearbyData({super.key});

  @override
  State<NearbyData> createState() => _NearbyDataState();
}

class _NearbyDataState extends State<NearbyData> {
  final geo = GeoFlutterFire();
  final firestore = FirebaseFirestore.instance.collection('shops');
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size * 1;
    var provider = Provider.of<CustomerHomeController>(context, listen: true);
    GeoFirePoint center = geo.point(
      latitude: provider.latitude,
      longitude: provider.longitude,
    );
    log(provider.latitude.toString());
    log(provider.longitude.toString());
    // firestore.where("isBarber", isEqualTo: true);
    double radius = 5000;
    String field = 'position';
    Stream<List<DocumentSnapshot>> streamNearBy = geo
        .collection(collectionRef: firestore)
        .within(center: center, radius: radius, field: field);
    // return StreamBuilder(
    //   stream: streamNearBy,
    //   builder: (BuildContext context,
    //       AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
    //     if (!snapshot.hasData) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else {
    //       // return Expanded(
    //       //     child: ListView.builder(
    //       //   itemCount: snapshot.data?.length ?? 0,
    //       //   scrollDirection: Axis.horizontal,
    //       //   itemBuilder: (context, index) => Padding(
    //       //     padding: const EdgeInsets.only(bottom: 40, top: 20, left: 20),
    //       //     child: ShopDisplayCard(snap: snapshot.data![index]),
    //       //   ),
    //       // ));
    //       List<DocumentSnapshot>? data = snapshot.data;

    //       if (data != null) {
    //         List<DocumentSnapshot> filteredData = data.where((snapshot) {
    //           final Map<String, dynamic>? snapshotData =
    //               snapshot.data() as Map<String, dynamic>?;

    //           // Perform a null check and type check before accessing the 'category' field
    //           return snapshotData != null &&
    //               snapshotData.containsKey('category') &&
    //               snapshotData['category'] == 'electric';
    //         }).toList();
    //         return Expanded(
    //           child: ListView.builder(
    //             itemCount: filteredData.length,
    //             scrollDirection: Axis.horizontal,
    //             itemBuilder: (context, index) => Padding(
    //               padding: const EdgeInsets.only(bottom: 40, top: 20, left: 20),
    //               child: ShopDisplayCard(snap: filteredData[index]),
    //             ),
    //           ),
    //         );
    //       }
    //       return Text('data');
    //     }
    //   },
    // );
    return Consumer<CustomerHomeController>(
        builder: (context, value, child) => StreamBuilder(
              stream: streamNearBy,
              builder: (BuildContext context,
                  AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<DocumentSnapshot>? data = snapshot.data;

                  if (data != null) {
                    List<DocumentSnapshot> filteredData =
                        data.where((snapshot) {
                      final Map<String, dynamic>? snapshotData =
                          snapshot.data() as Map<String, dynamic>?;

                      // Perform a null check and type check before accessing the 'category' field
                      return snapshotData != null &&
                          snapshotData.containsKey('serviceCategory') &&
                          snapshotData['serviceCategory'] ==
                              value.selectedTapOption;
                      // 'electric';
                    }).toList();
                    log(value.selectedTapOption);
                    if (filteredData.isEmpty) {
                      return Container(
                        height: size.height / 2.5,
                        width: size.width / 1.7,
                        child: Center(
                          child: Text(
                              'No shops found for the selected category.',
                              textAlign: TextAlign.center),
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: filteredData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(
                              bottom: 40, top: 20, left: 20),
                          child: ShopDisplayCard(snap: filteredData[index]),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text('No data available.'),
                    );
                  }
                }
              },
            ));
  }
}
