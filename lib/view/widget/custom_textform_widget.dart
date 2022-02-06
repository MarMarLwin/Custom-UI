import 'package:codigo/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final String? Function(String?) validatorFn;
  final Function(String?) onSavedFn;
  final String initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLength;
  const CustomTextFormField(
      {required this.title,
      required this.hintText,
      required this.validatorFn,
      required this.onSavedFn,
      required this.initialValue,
      required this.keyboardType,
      this.maxLength,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* Container(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            title,
            style: kLabelHintTextStyle,
            textAlign: TextAlign.start,
          ),
        ),*/
        TextFormField(
          decoration: InputDecoration(
              labelText: title,
              labelStyle: kLabelHintTextStyle,
              floatingLabelStyle: kLabelFloatinTextStyle,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              alignLabelWithHint: true),
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
          ],
          onChanged: validatorFn,
          keyboardType: keyboardType,
          obscureText: obscureText,
          initialValue: initialValue,
          validator: validatorFn,
          onSaved: onSavedFn,
        ),
      ],
    );
  }
}
