import 'package:codigo/constant.dart';
import 'package:codigo/model/category.dart';
import 'package:codigo/model/category.dart';
import 'package:codigo/model/category.dart';
import 'package:codigo/model/category.dart';
import 'package:codigo/view/widget/custom_rectangle_widget.dart';
import 'package:codigo/view/widget/rate_widget.dart';
import 'package:codigo/view/widget/room_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../model/category.dart';

class RiverFrontView extends StatefulWidget {
  RiverFrontView({Key? key}) : super(key: key);
  @override
  _RiverFrontViewState createState() => _RiverFrontViewState();
}

class _RiverFrontViewState extends State<RiverFrontView> {
  List<String> imageList = [
    'images/relax1.jpg',
    'images/relax2.jpg',
    'images/relax3.jpg'
  ];
  List<Category> categoryList = Category().getList();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => Scaffold(
            backgroundColor: kMainBackGroundColor,
            appBar: AppBar(
              elevation: 0,
              actions: const [
                Image(
                  image: AssetImage('images/currency.png'),
                  width: 35,
                  fit: BoxFit.contain,
                ),
                Image(
                  image: AssetImage('images/chatactive.png'),
                  fit: BoxFit.contain,
                  width: 40,
                )
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 5, top: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: const Text(
                              'Furama Riverfront, Singapore',
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: kTitleMediumTextStyle,
                            ),
                          ),
                          const SizedBox(
                            child: Image(
                              image: AssetImage('images/nextred.png'),
                              alignment: Alignment.bottomRight,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 5, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: const Text(
                              '405 Havelock Road, Singapore 169633',
                              style: kLabelTextStyle,
                              softWrap: true,
                            ),
                          ),
                          const SizedBox(
                            child: Image(
                              image: AssetImage('images/currentlocation.png'),
                              alignment: Alignment.bottomRight,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.1,
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: imageList.length,
                          itemBuilder: (ctx, index) {
                            return SizedBox(
                              child: Image(
                                image: AssetImage(imageList[index]),
                                fit: BoxFit.fitHeight,
                              ),
                            );
                          }),
                    ),
                    Container(
                      height: 80,
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          itemCount: categoryList.length,
                          itemBuilder: (ctx, index) {
                            return SizedBox(
                                width: MediaQuery.of(context).size.width / 5.2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          categoryList[index].iconData!),
                                    ),
                                    Text(
                                      categoryList[index].title!,
                                      style: kLabelCategoryTextStyle,
                                    )
                                  ],
                                ));
                          }),
                    ),
                    ToggleSwitch(
                      minHeight: 50,
                      minWidth: 500,
                      initialLabelIndex: 0,
                      totalSwitches: 2,
                      cornerRadius: 20,
                      activeFgColor: Colors.black87,
                      inactiveFgColor: Colors.black87,
                      inactiveBgColor: Colors.grey,
                      radiusStyle: true,
                      activeBgColors: const [
                        [Colors.white38, Colors.blueGrey],
                        [Colors.blueGrey, Colors.white38],
                      ],
                      labels: const ['By Room', 'By Rates'],
                      onToggle: (index) {
                        setState(() {
                          byRoom = index == 0 ? true : false;
                        });
                      },
                    ),
                    // ClipPath(
                    //     clipper: RectangleClipper(),
                    //     child: Image(
                    //       height: 50,
                    //       image: AssetImage('images/relax1.jpg'),
                    //     )),
                    Visibility(
                        visible: byRoom,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            child: const RoomWidget())),
                    Visibility(
                        visible: !byRoom,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            child: const RateWidget())),
                  ],
                ),
              ),
            )));
  }
}
