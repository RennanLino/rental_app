import 'package:flutter/material.dart';
import 'package:rental_app/config.dart';
import 'package:rental_app/src/utils/hex_color_helper.dart';

class LoginTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const LoginTextField(this.label, this.controller, {super.key});

  @override
  State<StatefulWidget> createState() => _LoginTextField();
}

class _LoginTextField extends State<LoginTextField> {
  late String _label;
  late TextEditingController _controller;

  @override
  void initState() {
    _label = widget.label;
    _controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(
          _label,
          style: TextStyle(color: HexColorHelper.fromHex(textColor)),
        ),
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
