import 'package:flutter/material.dart';

class RGInput extends StatelessWidget {
  final String placeholder;
  final Widget prefixIcon;

  RGInput({
    this.placeholder,
    this.prefixIcon,
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
