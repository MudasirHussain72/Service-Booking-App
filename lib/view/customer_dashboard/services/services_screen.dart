import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/res/component/my_appbar.dart';
import 'package:fyp/res/component/round_button.dart';
import 'package:fyp/res/component/shop_service_display_card.dart';
import 'package:fyp/view/customer_dashboard/services/widgets/choose_service_bottomsheet.dart';
import 'package:fyp/view_model/services/session_manager.dart';

class DisplayServicesScreen extends StatefulWidget {
  final shopName;
  final shopUid;
  final shopAddress;
  const DisplayServicesScreen(
      {super.key,
      required this.shopUid,
      required this.shopName,
      required this.shopAddress});

  @override
  State<DisplayServicesScreen> createState() => _DisplayServicesScreenState();
}

class _DisplayServicesScreenState extends State<DisplayServicesScreen> {
  String? userName;
  Future<void> _getUserName() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(SessionController().userId)
        .get()
        .then((value) {
      setState(() {
        userName = value.data()!['userName'].toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shopName),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
          child: Column(children: [
            MyAppBar(
                oniconTap: () {},
                title: '${widget.shopName} services',
                icon: Icons.edit_calendar),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('shops')
                    .doc(widget.shopUid)
                    .collection('services')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Expanded(
                        child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        DocumentSnapshot doc = snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 40, top: 20, left: 20),
                          child: ShopServicesDisplayCard(snap: doc),
                        );
                      },
                    ));
                  }
                  // return Text('data');
                }),
            RoundButton(
              title: 'Book Appointment',
              onPress: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                    ),
                    context: context,
                    builder: (context) => ChooseBookServiceBottomSheet(
                          userName: userName,
                          shopAddress: widget.shopAddress,
                          shopUid: widget.shopUid,
                          shopName: widget.shopName,
                        ));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
