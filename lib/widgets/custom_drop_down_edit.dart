import 'package:flutter/material.dart';

class CustomDropDownEdit extends StatefulWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final Icon? prefix;
  final List<SelectionPopupModel> items;
  final ValueChanged<String?>? onChanged;

  const CustomDropDownEdit({
    required this.hintText,
    this.hintStyle,
    this.prefix,
    required this.items,
    this.onChanged,
  });

  @override
  _CustomDropDownEditState createState() => _CustomDropDownEditState();
}

class _CustomDropDownEditState extends State<CustomDropDownEdit> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            prefixIcon: widget.prefix,
          ),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            widget.onChanged?.call(value);
          },
          items: widget.items
              .map((item) => DropdownMenuItem<String>(
                    value: item.value,
                    child: Text(item.title),
                  ))
              .toList(),
        ),
        SizedBox(height: 8.0),
      ],
    );
  }
}

class SelectionPopupModel {
  final String title;
  final String value;

  SelectionPopupModel({required this.title, String? value})
      : value = value ?? title;
}
