import 'package:flutter/material.dart';

class RGInput extends StatelessWidget {
  final String placeholder;
  final Widget prefixIcon;
  final TextEditingController controller;
  final String Function(String) validator;
  final TextInputType keyboardType;
  final void Function(String) onFieldSubmitted;

  RGInput({
    this.placeholder,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            offset: Offset(0, 1),
            color: Theme.of(context).textTheme.bodyText2.color.withOpacity(0.1),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        autocorrect: false,
        keyboardType: keyboardType,
        obscureText: keyboardType == TextInputType.visiblePassword,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          hintText: placeholder,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(style: BorderStyle.none, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
      ),
    );
  }
}
