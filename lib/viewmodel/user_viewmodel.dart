import 'package:codigo/model/user_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../util.dart';

class UserViewModel extends GetxController {
  String? firstname,
      lastname,
      email,
      dob,
      gender,
      nationality,
      residence,
      phone;
  final Rxn<UserAccount>? _user = Rxn<UserAccount>();

  String? get user => _user?.value?.email;

  @override
  void onInit() {
    super.onInit();
  }

  void createAccount(BuildContext context) async {
    Get.snackbar('Success', 'Successfully create account!');
    //Util.showAlert(context, 'Successfully create account!', 'Success');
  }
}
