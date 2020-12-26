import 'package:flutter/material.dart';

class RGButton extends StatelessWidget {
  final String label;

  RGButton({
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Text(label),
    );
  }
}
