import '../export.dart';

class CricleFraction extends StatelessWidget {
  final int value;

  const CricleFraction({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 1; i <= 5; i++)
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i <= value
                  ? Colors.deepPurple
                  : Colors.deepPurpleAccent.shade100,
            ),
            padding: const EdgeInsets.all(4),
            child: Text(
              '$i',
              style: TextStyle(
                color: Colors.deepPurpleAccent.shade100,
              ),
            ),
          ),
      ],
    );
  }
}
