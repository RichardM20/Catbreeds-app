import 'package:catbreeds_app/src/presentation/widgets/image_widget.dart';

import '../export.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({super.key, this.breed});
  final BreedDataModel? breed;
  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 12, vertical: 14);

    const margin = EdgeInsets.symmetric(vertical: 8);
    final decoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(),
      ],
    );
    return Container(
      width: 250,
      height: 170,
      margin: margin,
      padding: padding,
      decoration: decoration,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Text(breed?.name ?? ""),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(context: context, breed: breed, id: breed!.id),
              child: const Text("Mas..."),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Text(breed!.countryCode ?? ""),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Text("${breed!.intelligence ?? 0}"),
          ),
          const Center(
            child: Imagewidget(
              height: 100,
              width: 100,
              urlImage:
                  'https://i.pinimg.com/originals/ed/3b/ee/ed3beefd69c83e86241a31c001dd2f1a.png',
            ),
          ),
        ],
      ),
    );
  }

  onTap({context, breed, id}) {
    GoRouter.of(context).pushNamed(
      'detail-data-page',
      extra: {
        'breed': breed,
        'id': id,
      },
    );
  }
}
