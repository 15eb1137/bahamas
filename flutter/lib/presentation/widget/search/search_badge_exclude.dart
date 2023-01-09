// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../page/search_page.dart';

// class SearchBadgeExclude extends ConsumerWidget {
//   final String id;
//   final String text;
//   const SearchBadgeExclude({super.key, required this.id, required this.text});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) => InputChip(
//         padding: const EdgeInsets.all(2.0),
//         avatar: const CircleAvatar(
//             backgroundColor: Colors.purple, child: Icon(Icons.unfold_less)),
//         label: Text(text),
//         onDeleted: () {
//           ref.read(chipsDataProvider.notifier).state = ref
//               .read(chipsDataProvider)
//               .where((chipData) => chipData['id'] != id)
//               .toList();
//           ScaffoldMessenger.of(context)
//               .showSnackBar(const SnackBar(content: Text('検索条件を外しました。')));
//         },
//       );
// }
