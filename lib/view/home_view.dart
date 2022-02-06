import 'package:codigo/constant.dart';
import 'package:codigo/view/riverfront/riverfront_view.dart';
import 'package:codigo/view/travel/welcome_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'movies/movies_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => Scaffold(
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () => Get.to(const WelcomeView()),
                        child: const Text(
                          'Test 1',
                          style: kTitleMediumTextStyle,
                        )),
                    ElevatedButton(
                        onPressed: () => Get.to(const MoviesListView()),
                        child: const Text(
                          'Test 2',
                          style: kTitleMediumTextStyle,
                        )),
                    ElevatedButton(
                        onPressed: () => Get.to(RiverFrontView()),
                        child: const Text(
                          'Test 3',
                          style: kTitleMediumTextStyle,
                        ))
                  ],
                ),
              ),
            ));
  }
}
