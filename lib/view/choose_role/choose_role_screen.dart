import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fyp/res/component/round_button.dart';
import 'package:fyp/view/signup/signup_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 1;
    return Scaffold(
      body: Stack(
        children: [
          Transform.rotate(
            angle: -pi / 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/firstScreenBG.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "IN-Remote Services",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        // "Watch your favoirite series or movies on\nonly one platform.You can watch it\nanytime and anywhere",
                        'IN-Remote Services at your fingerprints\nBook your next service with ease',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: size.height * .03),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Register your account for",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    RoundButton(
                        title: 'Discover Services',
                        onPress: () {
                          // SignupController().setisBarber(false);
                          // Navigator.pushNamed(context, RouteName.signupView);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen(
                                      isBarberRole: false,
                                    )),
                          );
                        }),
                    SizedBox(height: size.height * .02),
                    RoundButton(
                      title: 'Set Up your Bussiness',
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen(
                                    isBarberRole: true,
                                  )),
                        );
                      },
                    ),
                    SizedBox(height: size.height * .01),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
