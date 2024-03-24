import '../export.dart';

class InformationTextContent extends StatelessWidget {
  const InformationTextContent({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title:\n',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: info == 'Life span' ? '${info}years' : info,
            style: TextStyle(
              color: Colors.grey[900],
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
