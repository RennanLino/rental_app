import 'package:flutter/material.dart';
import 'package:rental_app/config.dart';
import 'package:rental_app/src/utils/hex_color_helper.dart';

class LoginTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool hideText;

  const LoginTextField(this.label, this.controller, this.hideText, {super.key});

  @override
  State<StatefulWidget> createState() => _LoginTextField();
}

class _LoginTextField extends State<LoginTextField> {
  late String _label;
  late TextEditingController _controller;
  late bool _hideText;

  @override
  void initState() {
    _label = widget.label;
    _controller = widget.controller;
    _hideText = widget.hideText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: _hideText,
      decoration: InputDecoration(
        label: Text(_label, style: Theme.of(context).textTheme.bodyMedium),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: HexColorHelper.fromHex(borderColor),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: HexColorHelper.fromHex(borderColor),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
