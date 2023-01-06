import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/app.dart';

class MemoTextField extends ConsumerStatefulWidget {
  const MemoTextField(this.memoId, {Key? key}) : super(key: key);

  final String memoId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MemoTextField();
}

class _MemoTextField extends ConsumerState<MemoTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final savedText =
        ref.read(appModelProvider.notifier).getMemoText(widget.memoId);
    _controller = TextEditingController(text: savedText);
    if (kDebugMode) {
      print('Memo ID: ${widget.memoId}, Saved Text: $savedText');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        onChanged: (value) {
          if (kDebugMode) {
            print('Memo Id: ${widget.memoId}, Value: $value');
          }
          ref
              .watch(appModelProvider.notifier)
              .setMemoText(widget.memoId, value);
        },
        cursorColor: Colors.black,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        textInputAction: TextInputAction.newline,
        expands: true,
        decoration: const InputDecoration.collapsed(
            hintText: '内容', hintStyle: TextStyle(color: Colors.black)));
  }
}
