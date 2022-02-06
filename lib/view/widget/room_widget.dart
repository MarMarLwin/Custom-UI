import 'package:codigo/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'images/relax1.jpg',
      'images/relax2.jpg',
      'images/relax3.jpg'
    ];
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: imageList.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              Image(image: AssetImage(imageList[index])),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Deluxe Twin',
                          style: kTitleTextStyle,
                        ),
                        Text(
                          'Twin single beds,cable TV, free wifi',
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red)),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'View Rates',
                        style: kTitleMediumRedTextStyle,
                      ),
                    ),
                  )
                ],
              ),
              const Divider(
                height: 2,
                indent: 5,
                endIndent: 5,
                color: Colors.blueGrey,
              )
            ],
          );
        });
  }
}
