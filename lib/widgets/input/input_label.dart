import 'package:flutter/material.dart';

class LabelInput extends StatelessWidget {
  final String label;
  final Function onChanged;
  LabelInput({
    @required this.label,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            this.label,
          ),
        ),
        TextField(
          style: Theme.of(context).textTheme.subtitle,
          onChanged: (text) {
            this.onChanged(text);
          },
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            // fillColor: Colors.grey[100],
            // filled: true,
          ),
        ),
      ],
    );
  }
}
