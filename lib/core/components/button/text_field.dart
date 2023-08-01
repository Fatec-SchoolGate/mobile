import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {

  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final String? hintText;
  final bool obscureText;
  final void Function(String value)? onChanged;
  final void Function(String? value)? onSaved;

  TextInputField({
    super.key,
    this.obscureText = false,
    this.prefixIconData,
    this.suffixIconData,
    this.hintText,
    this.onChanged,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor)
        ),
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Theme.of(context).primaryColor,
        ),
        suffixIcon: Icon(
          suffixIconData,
          size: 18,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}