import '../export.dart';

class InputSerachContent extends ConsumerWidget {
  const InputSerachContent({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    );
    const padding = EdgeInsets.symmetric(
      horizontal: 10.0,
      vertical: 0,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: TextFormField(
        onChanged: (v) {
          ref.read(homeProvider.notifier).filterData(v);
        },
        decoration: InputDecoration(
          contentPadding: padding,
          isDense: true,
          hintText: 'Enter a name',
          focusedBorder: borderStyle,
          border: borderStyle,
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
