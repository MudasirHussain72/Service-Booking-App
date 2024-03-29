// ignore_for_file: unrelated_type_equality_checks, curly_braces_in_flow_control_structures

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/res/color.dart';
import 'package:fyp/res/component/rectangle_button.dart';
import 'package:fyp/utils/routes/route_name.dart';
import 'package:fyp/view/login/login_screen.dart';
import 'package:fyp/view_model/profile/profile_controller.dart';
import 'package:fyp/view_model/services/session_manager.dart';
import 'package:fyp/view_model/services/theme_settings.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final firestore = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size * 1;
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => ProfileController(),
      child: Consumer<ProfileController>(
        builder: (context, provider, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: StreamBuilder(
                  stream: firestore
                      .doc(SessionController().userId.toString())
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      var document = snapshot.data;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height * .02),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * .01),
                                child: Center(
                                  child: Container(
                                    height: size.width / 4,
                                    width: size.width / 4,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: AppColors.primaryColor,
                                            width: 2)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: provider.image == null
                                          ? document['profileImage'].toString ==
                                                  ""
                                              ? const Icon(Icons.person)
                                              : Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      document!['profileImage']
                                                          .toString()),
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  },
                                                  errorBuilder:
                                                      (context, object, stack) {
                                                    return const Icon(
                                                      Icons.error_outline,
                                                      color:
                                                          AppColors.alertColor,
                                                    );
                                                  })
                                          : Stack(
                                              children: [
                                                Image.file(
                                                    File(provider.image!.path)
                                                        .absolute),
                                                const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                              ],
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  log('clicked');
                                  provider.pickImage(context);
                                },
                                child: CircleAvatar(
                                  radius: size.width * .04,
                                  backgroundColor: AppColors.primaryIconColor,
                                  child: const Icon(Icons.add,
                                      color: AppColors.whiteColor),
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              ProfileController().updateUserInfoDialogAlert(
                                  context, document['userName'], 'userName');
                            },
                            child: ReusableRow(
                              title: 'Name',
                              value: document['userName'] == ''
                                  ? '*** *** ***'
                                  : document['userName'],
                            ),
                          ),
                          ReusableRow(
                            title: 'Email',
                            value: document['email'] == ''
                                ? '*** *** ***'
                                : document['email'],
                          ),
                          ReusableRow(
                            title: 'Phone',
                            value: document['phone'] ?? '*** *** ***',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.moon,
                                  color: AppColors.iconBlueColor,
                                ),
                                label: Text(
                                  'Dark mode',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                              ),
                              Consumer<ThemeChanger>(
                                builder: (context, provider, child) =>
                                    CupertinoSwitch(
                                  value: provider.isDarkMode,
                                  onChanged: (value) {
                                    provider.setTheme(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                              onTap: () {
                                FirebaseAuth auth = FirebaseAuth.instance;
                                auth.signOut().then(
                                  (value) {
                                    SessionController().userId = '';
                                    PersistentNavBarNavigator
                                        .pushNewScreenWithRouteSettings(
                                      context,
                                      settings: const RouteSettings(
                                          name: RouteName.loginView),
                                      screen: const LoginScreen(),
                                      withNavBar: false,
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                    );
                                  },
                                );
                              },
                              child: const RectangleButton(
                                  title: 'Sign Out', iconData: Icons.logout)),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Something went wrong',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}

// reusable row
class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          trailing: Text(value),
        ),
        const Divider()
      ],
    );
  }
}
