import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/res/color.dart';
import 'package:fyp/res/component/my_appbar.dart';
import 'package:fyp/view/help_&_support/contact_support_form.dart';
import 'package:fyp/view_model/services/session_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          MyAppBar(
              oniconTap: () => PersistentNavBarNavigator.pushNewScreen(context,
                  screen: ContactSupportForm(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.fade),
              title: 'Contact Support',
              icon: Icons.contact_support_outlined),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('contact_support')
                .where('userId', isEqualTo: SessionController().userId)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.data!.docs.length == 0) {
                return Expanded(child: const Center(child: Text('No Data')));
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data!.docs[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        // height: MediaQuery.of(context).size.height * .20,
                        width: double.infinity,
                        padding: const EdgeInsetsDirectional.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.transparent,
                                AppColors.primaryColor
                              ]),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(doc['name'],
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .055,
                                      fontFamily: 'BebasNeue-Regular')),
                              Text(
                                doc['title'],
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                doc['phone'],
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                doc['description'],
                                overflow: TextOverflow.ellipsis,
                              )
                            ]),
                      );
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
