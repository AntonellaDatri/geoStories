import 'package:flutter/material.dart';
import 'package:geo_stories/components/Ui/text_field_container.dart';
import 'package:geo_stories/constants.dart';

class RoundedTextboxField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final maxLength;

  const RoundedTextboxField({
    Key key,
    this.hintText,
    this.onChanged,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
          child: TextField(
            maxLines: null,
            maxLength: maxLength,
            onChanged: onChanged,
            cursorColor: kColorOrange,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
    );

  }
}
