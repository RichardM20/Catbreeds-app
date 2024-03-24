import '../export.dart';

class IconSplashPageContent extends StatelessWidget {
  const IconSplashPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return TwenAnimationWidget(
      direction: AnimationWidgetStart.down,
      duration: 600,
      cant: 50,
      widget: SvgPicture.asset(
        height: 150,
        'assets/icons/cat.svg',
      ),
    );
  }
}
