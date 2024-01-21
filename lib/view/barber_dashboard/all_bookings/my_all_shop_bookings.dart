import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/res/color.dart';
import 'package:fyp/res/component/my_appbar.dart';
import 'package:fyp/utils/utils.dart';
import 'package:fyp/view/barber_dashboard/all_bookings/widgets/my_shop_booking_card.dart';
import 'package:fyp/view_model/services/session_manager.dart';
import 'package:http/http.dart' as http;

class MyAllShopBookings extends StatefulWidget {
  const MyAllShopBookings({super.key});

  @override
  State<MyAllShopBookings> createState() => _MyAllShopBookingsState();
}

class _MyAllShopBookingsState extends State<MyAllShopBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            MyAppBar(
                oniconTap: () {},
                title: 'Bookings',
                icon: CupertinoIcons.calendar),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('bookings')
                    .doc(SessionController().userId)
                    .collection('bookings')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot doc = snapshot.data!.docs[index];
                              return InkWell(
                                onLongPress: () {
                                  if (doc['serviceStatus'] == false) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                          title: const Text(
                                              'Have you served in this Service OR Booking?'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: const <Widget>[
                                                Text(
                                                    'If yes then set pending status to completed'),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Cancel',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .hintColor))),
                                            TextButton(
                                                onPressed: () {
                                                  FirebaseFirestore.instance
                                                      .collection('bookings')
                                                      .doc(SessionController()
                                                          .userId)
                                                      .collection('bookings')
                                                      .doc(doc[
                                                          'bookingDocumentId'])
                                                      .update({
                                                    'serviceStatus': true,
                                                  }).then((value) async {
                                                    // FirebaseFirestore.instance
                                                    //       .collection(
                                                    //           'deviceTokens')
                                                    //       .doc( ).
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            'deviceTokens')
                                                        .doc(doc['userId'])
                                                        .get()
                                                        .then((value) async {
                                                      log("%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n" +
                                                          value['deviceToken']);
                                                      var data = {
                                                        'to': value[
                                                            'deviceToken'],
                                                        'priority': 'high',
                                                        // 'android': {
                                                        'notification': {
                                                          'title': 'Hello Dear',
                                                          // 'body':
                                                          //     'Booking from ${widget.userName} for ${widget.serviceName}',
                                                          'body':
                                                              'Booking completed',
                                                          'android_channel_id':
                                                              "Messages",
                                                          'count': 10,
                                                          'notification_count':
                                                              12,
                                                          'badge': 12,
                                                          "click_action":
                                                              'asif',
                                                          'color': '#eeeeee',
                                                        },
                                                        // },
                                                        'data': {
                                                          'type': 'msg',
                                                          // 'id': '12456',
                                                        }
                                                      };
                                                      await http.post(
                                                          Uri.parse(
                                                              'https://fcm.googleapis.com/fcm/send'),
                                                          body:
                                                              jsonEncode(data),
                                                          headers: {
                                                            'Content-Type':
                                                                'application/json; charset=UTF-8',
                                                            'Authorization':
                                                                'key=AAAAPYagRB8:APA91bE1FGVhmf_aJKRHcXMZt3qTqfrXdcv-U_ZmHY32u9XfoBcFeyNc9_qXhjS5X9oEH0um4Z9odrwRVxXMT6kjtLdw_0JzEbFo0_MpOUWv1NJNppSOmnNTMTEH0ky9Q-7r5H2uCV6y'
                                                          }).then((value) {
                                                        log(value.statusCode
                                                            .toString());
                                                      });
                                                    });

                                                    Navigator.pop(context);
                                                    Utils.flushBarDoneMessage(
                                                        'Service completed successfully',
                                                        BuildContext,
                                                        context);
                                                  });
                                                },
                                                child: Text('Ok',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .hintColor)))
                                          ]),
                                    );
                                  } else {
                                    Utils.flushBarErrorMessage(
                                        'Cannot update Completed Booking',
                                        BuildContext,
                                        context);
                                  }
                                },
                                child: MyShopBookingCard(snap: doc),
                              );
                            }));
                  }
                })
          ],
        ),
      )),
    );
  }
}
