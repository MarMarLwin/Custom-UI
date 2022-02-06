import 'package:codigo/constant.dart';
import 'package:codigo/view/widget/custom_textform_widget.dart';
import 'package:codigo/viewmodel/user_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../util.dart';

class AccountCreatView extends GetWidget<UserViewModel> {
  AccountCreatView({Key? key}) : super(key: key);
  static const String routeName = "/createAccount";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => Scaffold(
              appBar: AppBar(
                backgroundColor: kMainBackGroundColor,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          color: kMainBackGroundColor,
                          padding: const EdgeInsets.only(
                            top: 0,
                            left: 20,
                            right: 0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'Almost there!',
                                style: kTitleTextStyle,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  'Complete the form below to create \nyour Ready To Travel account!',
                                  style: kLabelTextStyle,
                                  softWrap: true,
                                ),
                              ),
                              Text(
                                '*Mandatory',
                                style: kLabelHintTextStyle,
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          top: 25,
                          right: 10,
                          child: Image(
                            width: 110,
                            image: AssetImage('images/guitar.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 120,
                              left: 20,
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                CustomTextFormField(
                                    title: 'First Name *',
                                    hintText: '',
                                    maxLength: 50,
                                    validatorFn: (value) {
                                      if (value!.isEmpty) {
                                        return 'First name is required';
                                      }
                                    },
                                    onSavedFn: (value) {
                                      controller.firstname = value;
                                    },
                                    initialValue: '',
                                    keyboardType: TextInputType.text,
                                    obscureText: false),
                                CustomTextFormField(
                                    title: 'Last Name *',
                                    hintText: '',
                                    maxLength: 50,
                                    validatorFn: (value) {
                                      if (value!.isEmpty) {
                                        return 'Last name is required';
                                      }
                                    },
                                    onSavedFn: (value) {
                                      controller.lastname = value;
                                    },
                                    initialValue: '',
                                    keyboardType: TextInputType.text,
                                    obscureText: false),
                                CustomTextFormField(
                                    title: 'Email Address *',
                                    hintText: '',
                                    maxLength: 50,
                                    validatorFn: (value) {
                                      if (value!.isEmpty ||
                                          !Util.isEmail(value)!) {
                                        return 'Email format is incorrect';
                                      }
                                    },
                                    onSavedFn: (value) {
                                      controller.email = value;
                                    },
                                    initialValue: '',
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: false),
                                Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        width: 180,
                                        height: 60,
                                        child: TextFormField(
                                          keyboardType: TextInputType.datetime,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 20, bottom: 0),
                                            suffixIcon: Image(
                                              image:
                                                  AssetImage('images/dob.png'),
                                              height: 10,
                                              fit: BoxFit.scaleDown,
                                            ),
                                            hintText: 'DD/MM/YYYY',
                                            labelText: 'Date of Birth *',
                                            labelStyle: kLabelFloatinTextStyle,
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            floatingLabelStyle:
                                                kLabelFloatinTextStyle,
                                            counterText: '',
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 1),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Date of Birth is required';
                                            }
                                          },
                                          onSaved: (value) {
                                            controller.dob = value;
                                          },
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                10),
                                            DateFormatter(),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: ToggleSwitch(
                                          minHeight: 50,
                                          initialLabelIndex: 0,
                                          totalSwitches: 2,
                                          cornerRadius: 20,
                                          activeFgColor: kButtonGradientColor2,
                                          inactiveFgColor:
                                              kButtonGradientColor2,
                                          radiusStyle: true,
                                          inactiveBgColor: Colors.black12,
                                          activeBgColors: const [
                                            [
                                              kButtonGradientColor1,
                                              kButtonGradientColor1,
                                              kButtonGradientColor2,
                                            ],
                                            [
                                              kButtonGradientColor1,
                                              kButtonGradientColor1,
                                              kButtonGradientColor2,
                                            ]
                                          ],
                                          labels: const ['Female', 'Male'],
                                          onToggle: (index) {
                                            controller.gender = '$index';
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                CustomTextFormField(
                                    title: 'Nationality *',
                                    hintText: '',
                                    maxLength: 50,
                                    validatorFn: (value) {
                                      if (value!.isEmpty) {
                                        return 'Nationality is required';
                                      }
                                    },
                                    onSavedFn: (value) {
                                      controller.nationality = value;
                                    },
                                    initialValue: '',
                                    keyboardType: TextInputType.text,
                                    obscureText: false),
                                CustomTextFormField(
                                    title: 'Country of Residence *',
                                    hintText: '',
                                    maxLength: 50,
                                    validatorFn: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                    },
                                    onSavedFn: (value) {
                                      controller.residence = value;
                                    },
                                    initialValue: '',
                                    keyboardType: TextInputType.text,
                                    obscureText: false),
                                CustomTextFormField(
                                    title: 'Mobile no. (Optional)',
                                    hintText: '',
                                    maxLength: 13,
                                    validatorFn: (value) => null,
                                    onSavedFn: (value) {
                                      controller.phone = value;
                                    },
                                    initialValue: '',
                                    keyboardType: TextInputType.phone,
                                    obscureText: false),
                                /* TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: '+95',
                            labelText: 'Mobile no.(Optional) *',
                            labelStyle: kLabelFloatinTextStyle,
                            floatingLabelStyle:
                                kLabelFloatinTextStyle,
                            counterText: '',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                          ),
                          onSaved: (value) {
                            controller.dob = value;
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(13),
                            MobileTextInputFormatter(),
                          ],
                        ),*/
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, bottom: 10),
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
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                            controller.createAccount(context);
                                          }
                                        },
                                        child: const Text(
                                            'Create my account now',
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
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
