import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hint;
  final Icon hinticon;
  final String? Function(String?) valid;
  final TextEditingController mycontroller;
  const CustomTextForm(
      {super.key,
      required this.hint,
      required this.mycontroller,
      required this.hinticon , required this.valid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator:valid,
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

      ),
    );
  }
}
