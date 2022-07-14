import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = 40.0,
  Color background = Colors.blue,
  bool textAllCaps = true,
  double cornerRaduis = 20,
  @required Function onPressed,
  @required String title,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerRaduis), color: background),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          textAllCaps ? title.toUpperCase() : title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget defaultTextFormField({
  @required TextEditingController controller,
  @required TextInputType inputType,
  @required Function validator,
  @required String hintText,
  IconData prefixIcon,
  Function onSubmit,
  Function onTextChanged,
}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(Icons.remove_red_eye)),
      keyboardType: inputType,
      obscureText: (inputType == TextInputType.visiblePassword) ? true : false,
      onFieldSubmitted: onSubmit,
      onChanged: onTextChanged,
    );
