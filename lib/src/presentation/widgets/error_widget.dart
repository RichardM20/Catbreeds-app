import '../export.dart';

class CErrorWidget extends StatelessWidget {
  const CErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
      ),
    );
  }
}
