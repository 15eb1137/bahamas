// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../page/search_page.dart';

// class SearchTextFieldExclude extends ConsumerWidget {
//   const SearchTextFieldExclude({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _controller = ref.watch(searchTextFieldExcludeEditingTextProvider);
//     return Row(children: [
//       const CircleAvatar(
//           backgroundColor: Colors.purple, child: Icon(Icons.unfold_less)),
//       Expanded(
//           child: TextField(
//         controller: _controller,
//         onSubmitted: (_) => const SearchPage().registChipData(ref),
//       )),
//       const Text('を含まない')
//     ]);
//   }
// }

// // replace to Search Conditions Domain
// final searchTextFieldExcludeEditingTextProvider =
//     StateProvider<TextEditingController>(
//         (ref) => TextEditingController(text: ''));
