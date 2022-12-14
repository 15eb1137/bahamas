import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';

import '../infrastructure/isar_helper.dart';
import '../presentation/page/search_page.dart';
import '../presentation/page/sticky_collection_page.dart';
import '../presentation/page/sticky_single_page.dart';

part 'app.freezed.dart';

final appModelProvider = StateNotifierProvider<AppModelStateNotifier,
    AppModelState>((ref) => AppModelStateNotifier()
  ..init(
    router: GoRouter(
      initialLocation: '/sticky/new',
      routes: [
        GoRoute(
            path: '/sticky/new',
            builder: ((context, state) =>
                const StickySinglePage(stickyId: null))),
        GoRoute(
            path: '/sticky/:stickId',
            builder: ((context, state) =>
                StickySinglePage(stickyId: state.params['stickId']))),
        GoRoute(
            path: '/stickies',
            builder: ((context, state) => const StickyCollectionPage())),
        GoRoute(
            path: '/stickiesResult',
            builder: ((context, state) =>
                const StickyCollectionPage(isResult: true))),
        GoRoute(
            path: '/search', builder: ((context, state) => const SearchPage())),
      ],
    ),
    // inAppReview: InAppReview.instance,
    // analytics: FirebaseAnalytics.instance,
    isarInstance: IsarHelper().setUp(),
  ));

class AppModelStateNotifier extends StateNotifier<AppModelState> {
  AppModelStateNotifier() : super(const AppModelState(null, null));

  Future<void> init({
    GoRouter? router,
    // InAppReview? inAppReview,
    // FirebaseAnalytics? analytics,
    Future<Isar>? isarInstance,
  }) async =>
      state = state.copyWith(
        router: router,
        // inAppReview: inAppReview,
        // analytics: analytics,
        isarInstance: await isarInstance,
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
    // InAppReview? inAppReview,
    // FirebaseAnalytics? analytics,
    Isar? isarInstance,
  ) = _AppModelState;
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appModelProvider.select((model) => model.router))!;
    return MaterialApp.router(
      title: '????????????????????????',
      supportedLocales: const [Locale('ja', 'JP')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
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
