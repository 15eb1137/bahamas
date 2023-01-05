import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MemoShelf extends StatelessWidget {
  const MemoShelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.go('/shelf/memo'),
        child: Hero(
            tag: 'memo_000001',
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 48,
                child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
                    child: const Text('Test Title',
                        style:
                            TextStyle(fontSize: 24, color: Colors.white))))));
  }
}
