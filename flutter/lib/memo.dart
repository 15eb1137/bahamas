import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'app.dart';

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

class LastEdit extends StatelessWidget {
  LastEdit({Key? key, DateTime? now, DateTime? lastEdit})
      : now = now ?? DateTime.now(),
        lastEdit = lastEdit ?? DateTime(1900),
        super(key: key);

  final DateTime now; // TODO: Providerにする
  final DateTime lastEdit;

  @override
  Widget build(BuildContext context) {
    final dateOnlyNow = DateTime(now.year, now.month, now.day);
    final dateOnlyLastEdit =
        DateTime(lastEdit.year, lastEdit.month, lastEdit.day);
    final bool isToday = dateOnlyNow.isAtSameMomentAs(dateOnlyLastEdit);
    final bool isYesterday = dateOnlyNow
        .subtract(const Duration(days: 1))
        .isAtSameMomentAs(dateOnlyLastEdit);
    final bool editedInThisYear = lastEdit.year == now.year;
    String _text;

    if (isToday) {
      _text = DateFormat.Hm().format(lastEdit);
    } else if (isYesterday) {
      _text = '昨日${DateFormat.Hm().format(lastEdit)}';
    } else if (!editedInThisYear) {
      _text = DateFormat('yyyy年M月d日').format(lastEdit);
    } else {
      _text = DateFormat('M月d日').format(lastEdit);
    }
    return Text('編集${isToday || isYesterday ? '時刻' : '日時'}: $_text',
        style: const TextStyle(color: Colors.black));
  }
}

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class MemoMenuButton extends StatelessWidget {
  const MemoMenuButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context, builder: (context) => const ModalBottomSheet());
        },
        icon: const Icon(Icons.more_vert, color: Colors.black));
  }
}

class MemoModel {}

class Memo extends ConsumerWidget {
  Memo({Key? key, this.lastEdit, String? memoId})
      : memoId = memoId ?? const Uuid().v4(),
        super(key: key);

  final String memoId;
  final DateTime? lastEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print('Memo ID: $memoId');
    }
    return Scaffold(
        // TODO: ユニークなテーマ
        backgroundColor: Colors.white, // TODO: Themeからの呼び出し
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: BackArrowButton(() {})),
        body: Builder(builder: ((context) {
          final double textFieldHeight = MediaQuery.of(context).size.height -
              Scaffold.of(context).appBarMaxHeight! -
              MediaQuery.of(context).viewInsets.bottom -
              118; // Contentsの高さの合計（変数化できず）
          if (kDebugMode) {
            print('textFieldHeight: $textFieldHeight');
          }
          return Center(
              child: Column(children: [
            Hero(
                tag: 'memo_000001',
                child: SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
                        child: TextField(
                            onChanged: (value) {
                              if (kDebugMode) {
                                print('save title: $value');
                              }
                            },
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                fontSize: 24, color: Colors.black),
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration.collapsed(
                                hintText: '題名',
                                hintStyle: TextStyle(color: Colors.black)))))),
            SizedBox(
                width: MediaQuery.of(context).size.width - 48,
                child: SizedBox(
                    height: textFieldHeight, child: MemoTextField(memoId))),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const SizedBox(),
              LastEdit(lastEdit: lastEdit), // TODO: 中央に配置したい
              const MemoMenuButton()
            ]),
          ]));
        })));
  }
}

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
