import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

part 'app.freezed.dart';

final appModelProvider = StateNotifierProvider<AppModelStateNotifier,
    AppModelState>((ref) => AppModelStateNotifier()
  ..init(
    router: GoRouter(
      initialLocation: '/memo',
      routes: [
        GoRoute(
            path: '/memo',
            builder: (context, state) =>
                Memo(lastEdit: DateTime.now())), // TODO: lastEditはデータから呼び出したい
      ],
    ),
    // sharedPreferences: SharedPreferences.getInstance(),
    // inAppReview: InAppReview.instance,
    // analytics: FirebaseAnalytics.instance
  ));

class AppModelStateNotifier extends StateNotifier<AppModelState> {
  AppModelStateNotifier() : super(const AppModelState(null
            // , null, null, null
            ));

  Future<void> init({
    GoRouter? router,
    // Future<SharedPreferences>? sharedPreferences,
    // InAppReview? inAppReview,
    // FirebaseAnalytics? analytics
  }) async =>
      state = state.copyWith(
        router: router,
        // sharedPreferences: await sharedPreferences,
        // inAppReview: inAppReview,
        // analytics: analytics
      );

  // Future<void> requestReview() async {
  //   final inAppReview = state.inAppReview;
  //   if (inAppReview != null) await inAppReview.requestReview();
  // }

  // void setIsDarkMode(bool isDarkModeActive) {
  //   final sharedPreferences = state.sharedPreferences;
  //   if (sharedPreferences != null) {
  //     sharedPreferences.setBool('isDarkMode', isDarkModeActive);
  //   }
  // }

  // Future<void> sendAnalyticsEvent(
  //     String eventName, Map<String, dynamic> params) async {
  //   final analytics = state.analytics;
  //   if (analytics != null) {
  //     await analytics.logEvent(name: eventName, parameters: params);
  //   }
  // }
}

@freezed
abstract class AppModelState with _$AppModelState {
  const factory AppModelState(
    GoRouter? router,
    // SharedPreferences? sharedPreferences,
    // InAppReview? inAppReview,
    // FirebaseAnalytics? analytics
  ) = _AppModelState;
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appModelProvider.select((model) => model.router))!;
    return MaterialApp.router(
      title: '',
      theme:
          ThemeData(primarySwatch: Colors.green, brightness: Brightness.light),
      darkTheme:
          ThemeData(primarySwatch: Colors.green, brightness: Brightness.dark),
      // themeMode: ref.watch(settingModelProvider.select((model) => model.themeMode)),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
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
        style: const TextStyle(color: Colors.white));
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
        icon: const Icon(Icons.more_vert, color: Colors.white));
  }
}

class Memo extends StatelessWidget {
  const Memo({Key? key, this.lastEdit}) : super(key: key);

  final DateTime? lastEdit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // TODO: ユニークなテーマ
        backgroundColor: Colors.black, // TODO: Themeからの呼び出し
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
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
            SizedBox(
                width: MediaQuery.of(context).size.width - 48,
                child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
                    child: const TextField(
                        // TODO: TextController
                        cursorColor: Colors.white,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        maxLines: 1,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration.collapsed(
                            hintText: 'タイトル',
                            hintStyle: TextStyle(color: Colors.white))))),
            SizedBox(
                width: MediaQuery.of(context).size.width - 48,
                child: SizedBox(
                    height: textFieldHeight,
                    child: const TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        expands: true,
                        decoration: InputDecoration.collapsed(
                            hintText: 'メモ',
                            hintStyle: TextStyle(color: Colors.white))))),
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
    return IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back));
  }
}
