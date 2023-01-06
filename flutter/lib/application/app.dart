import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/page/memo_page.dart';
import '../presentation/widget/memo_shelf.dart';

part 'app.freezed.dart';

final appModelProvider =
    StateNotifierProvider<AppModelStateNotifier, AppModelState>(
        (ref) => AppModelStateNotifier()
          ..init(
            router: GoRouter(
              initialLocation: '/shelf',
              routes: [
                GoRoute(
                    path: '/shelf',
                    builder: (context, state) => const MemoShelf(),
                    routes: [
                      GoRoute(
                          path: 'memo',
                          builder: (context, state) =>
                              Memo(lastEdit: DateTime.now(), memoId: 'testId'))
                    ]), // TODO: lastEditはデータから呼び出したい
              ],
            ),
            sharedPreferences: SharedPreferences.getInstance(),
            // inAppReview: InAppReview.instance,
            // analytics: FirebaseAnalytics.instance
          ));

class AppModelStateNotifier extends StateNotifier<AppModelState> {
  AppModelStateNotifier() : super(const AppModelState(null, null));

  Future<void> init({
    GoRouter? router,
    Future<SharedPreferences>? sharedPreferences,
    // InAppReview? inAppReview,
    // FirebaseAnalytics? analytics
  }) async =>
      state = state.copyWith(
        router: router,
        sharedPreferences: await sharedPreferences,
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

  void setMemoText(String memoId, String text) {
    final sharedPreferences = state.sharedPreferences;
    if (sharedPreferences != null) {
      sharedPreferences.setString(memoId, text);
    }
  }

  String? getMemoText(String memoId) {
    final sharedPreferences = state.sharedPreferences;
    if (sharedPreferences != null) {
      return sharedPreferences.getString(memoId);
    } else {
      return null;
    }
  }

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
    SharedPreferences? sharedPreferences,
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
      title: '検索できるメモ帳',
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