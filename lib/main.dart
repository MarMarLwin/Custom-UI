import 'package:codigo/service/AppDatabase.dart';
import 'package:codigo/view/home_view.dart';
import 'package:codigo/view/riverfront/riverfront_view.dart';
import 'package:codigo/view/travel/account_create_view.dart';
import 'package:codigo/view/movies/movies_list_view.dart';
import 'package:codigo/view/travel/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'constant.dart';
import 'helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ScreenUtilInit(
        designSize: orientation == Orientation.portrait
            ? const Size(375, 812)
            : const Size(812, 375),
        builder: () => GetMaterialApp(
          initialBinding: Binding(),
          theme: ThemeData(
              //fontFamily: 'SourceSansPro',
              primarySwatch: primaryThemeColor),
          home: const HomeView(),
          debugShowCheckedModeBanner: false,
          title: 'Ready To Travel',
        ),
      ),
    );
  }
}
