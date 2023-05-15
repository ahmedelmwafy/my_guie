import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    required this.controller,
    required this.hint,
    required this.icon,
    required this.validator,
    required this.keyboardType,
    this.obscureText = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey, // Specify the color of the border
            width: 1.0, // Specify the width of the border
          ),
        ),
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: _obscureText,
        validator: widget.validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hint,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.obscureText == false
              ? const SizedBox()
              : IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
        ),
      ),
    );
  }
}
