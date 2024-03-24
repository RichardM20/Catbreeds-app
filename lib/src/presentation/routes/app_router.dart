import 'package:catbreeds_app/src/presentation/export.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash-page',
  errorBuilder: (context, state) => const NotFoundPage(),
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/splash-page',
      name: '/splash-page',
      builder: (context, state) => const SplashPage(),
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
        context: context,
        state: state,
        child: const SplashPage(),
        type: TransitionType.fade,
      ),
    ),
    GoRoute(
      path: '/home-page',
      name: 'home-page',
      builder: (context, state) => const HomePage(),
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
        context: context,
        state: state,
        child: const HomePage(),
        type: TransitionType.scale,
      ),
    ),
    GoRoute(
      path: '/detail-data-page',
      name: 'detail-data-page',
      pageBuilder: (context, state) =>
          RouterTransitionFactory.getTransitionPage(
        context: context,
        state: state,
        child: const DetailDataPage(),
        type: TransitionType.scale,
      ),
      builder: (context, state) => const DetailDataPage(),
    ),
  ],
);
