import '../export.dart';

class TitleSplashPage extends StatelessWidget {
  const TitleSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TwenAnimationWidget(
      direction: AnimationWidgetStart.up,
      duration: 600,
      cant: 50,
      widget: const Text(
        "CatBreeds",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
