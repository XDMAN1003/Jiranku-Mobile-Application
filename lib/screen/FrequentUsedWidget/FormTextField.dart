import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  // ignore: avoid_init_to_null
  FormTextField({label, obscureText = false, validator, onChange, initialValue = ""})
      : _label = label,
        _initialValue = initialValue,
        _obscureText = obscureText,
        _validator = validator,
        _onChange =  onChange;

  final String _label;
  final bool _obscureText;
  final String _initialValue;
  final String? Function(String?)? _validator;
  final void Function(dynamic) _onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          initialValue: _initialValue,
          decoration: InputDecoration(
            labelText: '$_label',
            border: OutlineInputBorder(),
          ),
          onChanged: _onChange,
          obscureText: _obscureText,
          validator: _validator,
        ),
      ],
    );
  }
}
