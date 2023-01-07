import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/logger.dart';
import '../../domain/domainModel/sticky/stickies.dart';
import '../../domain/domainModel/sticky/sticky.dart';
import '../../domain/domainModel/sticky/value/sticky_color.dart';
import '../../domain/domainModel/sticky/value/sticky_font_size.dart';
import '../../domain/domainModel/sticky/value/sticky_id.dart';
import '../../domain/domainModel/sticky/value/sticky_last_edit.dart';
import '../../domain/domainModel/sticky/value/sticky_state.dart';
import '../../domain/domainModel/sticky/value/sticky_text.dart';
import '../widget/sticky/sticky_collection_grid.dart';

class StickyCollectionPage extends ConsumerWidget {
  const StickyCollectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: replace to real value
    final dummyStickies = Stickies(children: [
      Sticky(
          id: StickyId('test01'),
          text: StickyText('test01'),
          fontSize: StickyFontSize(16),
          lastEdit: StickyLastEdit(DateTime(2020, 1, 1, 0, 0, 0)),
          color: StickyColor(const Color(0xffff7f7f)),
          state: const StickyState(StickyStateType.editing)),
      Sticky(
          id: StickyId('test02'),
          text: StickyText('test02'),
          fontSize: StickyFontSize(16),
          lastEdit: StickyLastEdit(DateTime(2020, 1, 1, 0, 0, 0)),
          color: StickyColor(const Color(0xff7fbfff)),
          state: const StickyState(StickyStateType.editing)),
      Sticky(
          id: StickyId('test03'),
          text: StickyText('test03'),
          fontSize: StickyFontSize(16),
          lastEdit: StickyLastEdit(DateTime(2020, 1, 1, 0, 0, 0)),
          color: StickyColor(const Color(0xffffff7f)),
          state: const StickyState(StickyStateType.editing)),
      Sticky(
          id: StickyId('test04'),
          text: StickyText('test04'),
          fontSize: StickyFontSize(16),
          lastEdit: StickyLastEdit(DateTime(2020, 1, 1, 0, 0, 0)),
          color: StickyColor(const Color(0xffff7f7f)),
          state: const StickyState(StickyStateType.editing)),
      Sticky(
          id: StickyId('test05'),
          text: StickyText('test05'),
          fontSize: StickyFontSize(16),
          lastEdit: StickyLastEdit(DateTime(2020, 1, 1, 0, 0, 0)),
          color: StickyColor(const Color(0xff7fbfff)),
          state: const StickyState(StickyStateType.editing)),
      Sticky(
          id: StickyId('test06'),
          text: StickyText('test06'),
          fontSize: StickyFontSize(16),
          lastEdit: StickyLastEdit(DateTime(2020, 1, 1, 0, 0, 0)),
          color: StickyColor(const Color(0xffffff7f)),
          state: const StickyState(StickyStateType.editing)),
      Sticky(
          id: StickyId('test07'),
          text: StickyText('test07'),
          fontSize: StickyFontSize(16),
          lastEdit: StickyLastEdit(DateTime(2020, 1, 1, 0, 0, 0)),
          color: StickyColor(const Color(0xffff7f7f)),
          state: const StickyState(StickyStateType.editing)),
      Sticky(
          id: StickyId('test08'),
          text: StickyText('test08'),
          fontSize: StickyFontSize(16),
          lastEdit: StickyLastEdit(DateTime(2020, 1, 1, 0, 0, 0)),
          color: StickyColor(const Color(0xff7fbfff)),
          state: const StickyState(StickyStateType.editing)),
      Sticky(
          id: StickyId('test09'),
          text: StickyText('test09'),
          fontSize: StickyFontSize(16),
          lastEdit: StickyLastEdit(DateTime(2020, 1, 1, 0, 0, 0)),
          color: StickyColor(const Color(0xffffff7f)),
          state: const StickyState(StickyStateType.editing))
    ]);
    logger.i('Here is StickyCollectionPage.');

    return Scaffold(
      body: StickyCollectionGrid(dummyStickies),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.go('/sticky'), child: const Icon(Icons.add)),
    );
  }
}
