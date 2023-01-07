import 'package:flutter/material.dart';

class SearchTextFieldStartWith extends StatelessWidget {
  final void Function(String text) addStartWithChip;
  const SearchTextFieldStartWith({super.key, required this.addStartWithChip});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.start)),
      Expanded(child: TextField(onSubmitted: (text) => addStartWithChip(text))),
      const Text('から始まる')
    ]);
  }
}
