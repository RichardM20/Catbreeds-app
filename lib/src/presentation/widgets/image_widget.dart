import '../export.dart';

class Imagewidget extends StatelessWidget {
  const Imagewidget(
      {super.key, this.urlImage, required this.width, required this.height});
  final String? urlImage;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      height: height,
      width: width,
      placeholder: const AssetImage('assets/gif/loading.gif'),
      image: NetworkImage(
        urlImage ??
            'https://i.pinimg.com/originals/ed/3b/ee/ed3beefd69c83e86241a31c001dd2f1a.png',
      ),
    );
  }
}
