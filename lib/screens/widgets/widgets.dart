import 'package:flutter/material.dart';

class InformationText extends StatelessWidget {
  const InformationText({
    Key? key,
    required this.field,
    required this.value,
    required this.alignment,
  }) : super(key: key);
  final String field, value;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(field),
        Text(
          value,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}