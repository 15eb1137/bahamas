import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../widget/back_arrow_button.dart';
import '../widget/last_edit.dart';
import '../widget/memo_menu_button.dart';
import '../widget/memo_text_field.dart';

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
