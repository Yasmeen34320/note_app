import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hint;
  final Icon hinticon;
  final TextEditingController mycontroller;
  const CustomTextForm(
      {super.key,
      required this.hint,
      required this.mycontroller,
      required this.hinticon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: mycontroller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 20.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          hintText: hint,
          prefixIcon: hinticon,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your username';
          } else if (value.length < 9) {
            return 'Username must be at least 9 characters long';
          } else if (!RegExp(r'^[A-Z][a-zA-Z0-9]*$').hasMatch(value)) {
            return 'Username must start with an uppercase letter and contain only letters and numbers';
          }
          return null;
        },
      ),
    );
  }
}
