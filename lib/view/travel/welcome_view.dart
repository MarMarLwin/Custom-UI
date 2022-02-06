import 'package:codigo/constant.dart';
import 'package:codigo/view/travel/account_create_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => Scaffold(
              body: Stack(
                children: <Widget>[
                  const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        child: Image(
                          image: AssetImage('images/welcome.png'),
                          fit: BoxFit.contain,
                        ),
                      )),
                  const Positioned(
                    top: 200,
                    left: 0,
                    right: 0,
                    child: Image(
                      image: AssetImage('images/clouds.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Welcome to \nReady To Travel',
                              softWrap: true,
                              style: kMainTitleTextStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                  'Sign up with Facebook for the most fulfilling trip planning experience with us! ',
                                  softWrap: true,
                                  style: kLabelTextStyle),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 25, bottom: 0),
                              child: Material(
                                elevation: 2.0,
                                borderRadius: kBorderRadius,
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      borderRadius: kBorderRadius,
                                      color: kButtonColor),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        child: Align(
                                          child: TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                                'Log in with Facebook',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        right: 10,
                                        top: 10,
                                        bottom: 10,
                                        child: Align(
                                          child: Icon(
                                            Icons.facebook,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 0),
                              child: Material(
                                elevation: 2.0,
                                borderRadius: kBorderRadius,
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      borderRadius: kBorderRadius,
                                      color: kButtonColor),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                        'Log in with email address',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 0),
                              child: Material(
                                elevation: 2.0,
                                borderRadius: kBorderRadius,
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    borderRadius: kBorderRadius,
                                    gradient: LinearGradient(colors: [
                                      kButtonGradientColor1,
                                      kButtonGradientColor2
                                    ]),
                                  ),
                                  child: TextButton(
                                    onPressed: () =>
                                        {Get.off(AccountCreatView())},
                                    child: const Text('Create a new account',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ));
  }
}
