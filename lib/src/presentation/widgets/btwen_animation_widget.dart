import '../export.dart';

enum AnimationWidgetStart { up, down, left, right }

// ignore: must_be_immutable
class TwenAnimationWidget extends StatelessWidget {
  TwenAnimationWidget({
    super.key,
    required this.widget,
    required this.direction,
    this.duration,
    this.cant = 450,
  });
  final Widget widget;
  final int? duration;
  final AnimationWidgetStart direction;
  final double cant;

  double dx = 0.0;
  double dy = 0.0;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: Duration(milliseconds: duration ?? 250),
      builder: (context, value, child) {
        switch (direction) {
          case AnimationWidgetStart.left:
            dx = -cant * value;
            break;
          case AnimationWidgetStart.right:
            dx = cant * value;
            break;
          case AnimationWidgetStart.up:
            dy = -cant * value;
            break;
          case AnimationWidgetStart.down:
            dy = cant * value;
            break;
        }
        return Transform.translate(
          offset: Offset(dx, dy),
          child: widget,
        );
      },
    );
  }
}
