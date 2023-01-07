import 'package:flutter/material.dart';

class SearchBadgeStartWith extends StatelessWidget {
  final String text;
  const SearchBadgeStartWith({super.key, required this.text});

  @override
  Widget build(BuildContext context) => InputChip(
        padding: const EdgeInsets.all(2.0),
        avatar: const CircleAvatar(
            backgroundColor: Colors.red, child: Icon(Icons.start)),
        label: Text(text),
        onDeleted: () => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('検索条件を外しました。'))),
      );
}
