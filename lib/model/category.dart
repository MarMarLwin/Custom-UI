import 'package:flutter/cupertino.dart';

class Category {
  final String? iconData;
  final String? title;
  Category({this.iconData, this.title});

  getList() {
    return [
      Category(iconData: 'images/theme.png', title: 'Amenities'),
      Category(iconData: 'images/workout.png', title: 'Facilities'),
      Category(iconData: 'images/fnb.png', title: 'F&B'),
      Category(iconData: 'images/kidsfamily.png', title: 'Kids/family'),
      Category(iconData: 'images/wellness.png', title: 'Wellness')
    ];
  }
}
