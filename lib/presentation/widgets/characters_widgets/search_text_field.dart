import 'package:flutter/material.dart';
class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {Key? key, required this.onChanged, required this.controller})
      : super(key: key);
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        hintText: 'Search',
        border: InputBorder.none,
      ),
      onChanged: onChanged,
    );
  }
}
