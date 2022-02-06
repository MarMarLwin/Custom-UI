import 'package:codigo/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (ctx, index) {
          return DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: [10, 10],
            color: Colors.grey,
            strokeWidth: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'YOUR E-VOUCHER RATE',
                      style: kLabelCategoryTextStyle,
                    ),
                    SizedBox(
                      child: Image(
                        image: AssetImage('images/nextred.png'),
                        alignment: Alignment.bottomRight,
                        width: 30,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
                const Text(
                  'Mobile App Special Voucher',
                  style: kLabelTextStyle,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Image(
                            width: 70,
                            image: AssetImage('images/fnb.png'),
                            fit: BoxFit.contain,
                          ),
                          Text(
                            'Inclusive of Breakfast',
                            softWrap: true,
                            style: kLabelCategoryTextStyle,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Image(
                            width: 70,
                            image: AssetImage('images/fnb.png'),
                            fit: BoxFit.contain,
                          ),
                          Text(
                            'Inclusive of Breakfast',
                            softWrap: true,
                            style: kLabelCategoryTextStyle,
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
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Divider(
                    height: 5,
                    indent: 5,
                    endIndent: 5,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Avg. Nightly / Room From',
                          softWrap: true,
                          style: kLabelCategoryTextStyle,
                        ),
                        Text(
                          'Subject to GST & Service Charges',
                          softWrap: true,
                          style: kLabelHintTextStyle,
                        )
                      ],
                    ),
                    const Text(
                      'SGD',
                      softWrap: true,
                      style: kLabelHintTextStyle,
                    ),
                    const Text(
                      '161.42',
                      softWrap: true,
                      style: kTitleMediumTextStyle,
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.amberAccent,
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    'MEMBERS DEALS',
                    style: kTitleMediumTextStyle,
                  ),
                )
              ],
            ),
          );
        });
  }
}
