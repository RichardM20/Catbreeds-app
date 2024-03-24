import 'package:go_router/go_router.dart';

import 'export.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    navigationMethod();
    super.initState();
  }

  void navigationMethod() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacementNamed(
        'home-page',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: size.height * 0.4,
            child: const TitleSplashPage(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: size.height * 0.05,
            child: const IconSplashPageContent(),
          )
        ],
      ),
    );
  }
}
