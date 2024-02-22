import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;

  Future<void> createNewUserData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kSidebarBackgroundColor,
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0, -75, 0),
                      child: Image.asset(
                        'assets/illustrations/illustration-14.png',
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -170, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Flutter Devcamp 2024",
                            style:
                                kLargeTitleStyle.copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            "Welcome Devcamper's",
                            style: kHeadlineLabelStyle.copyWith(
                                color: Colors.white70),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  transform: Matrix4.translationValues(0, -150, 0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 53.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Log in to",
                          style: kTitle1Style,
                        ),
                        Text(
                          "Start Learning",
                          style: kTitle1Style.apply(
                              color: const Color(0xFF5B4CF0)),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 130.0,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: kShadowColor,
                                      offset: Offset(0, 12),
                                      blurRadius: 16.0,
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5.0,
                                      right: 16.0,
                                      left: 16.0,
                                    ),
                                    child: TextField(
                                      cursorColor: kPrimaryLabelColor,
                                      decoration: InputDecoration(
                                        icon: const Icon(
                                          Icons.email,
                                          color: Color(0xFF5488F1),
                                          size: 20.0,
                                        ),
                                        border: InputBorder.none,
                                        hintText: "Email Address",
                                        hintStyle: kLoginInputTextStyle,
                                      ),
                                      style: kLoginInputTextStyle.copyWith(
                                        color: Colors.black,
                                      ),
                                      onChanged: (textEntered) {
                                        email = textEntered;
                                      },
                                    ),
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 5.0,
                                      right: 16.0,
                                      left: 16.0,
                                    ),
                                    child: TextField(
                                      cursorColor: kPrimaryLabelColor,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        icon: const Icon(
                                          Icons.lock,
                                          color: Color(0xFF5488F1),
                                          size: 20.0,
                                        ),
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: kLoginInputTextStyle,
                                      ),
                                      style: kLoginInputTextStyle.copyWith(
                                        color: Colors.black,
                                      ),
                                      onChanged: (textEntered) {
                                        password = textEntered;
                                      },
                                    ),
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                    fullscreenDialog: false,
                                  ),
                                );
                                // showDialog(
                                //   context: context,
                                //   builder: (context) {
                                //     return AlertDialog(
                                //       title: const Text("Error"),
                                //       content: Text(err.message!),
                                //       actions: [
                                //         TextButton(
                                //           onPressed: () {
                                //             Navigator.of(context).pop();
                                //           },
                                //           child: const Text("Ok!"),
                                //         ),
                                //       ],
                                //     );
                                //   },
                                // );
                              },
                              child: Container(
                                child: Text(
                                  "Login",
                                  style: kCalloutLabelStyle.copyWith(
                                      color: Colors.white),
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.0),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF73A0F4),
                                      Color(0xFF4A47F5),
                                    ],
                                  ),
                                ),
                                height: 47.0,
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Text(
                              "Forgot Password?",
                              style: kCalloutLabelStyle.copyWith(
                                color: const Color(0x721B1E9C),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
