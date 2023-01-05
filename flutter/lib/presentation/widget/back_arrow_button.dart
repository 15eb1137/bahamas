import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton(this.onPressed, {Key? key}) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back, color: Colors.black));
  }
}
