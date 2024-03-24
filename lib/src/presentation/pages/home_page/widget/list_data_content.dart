import 'package:catbreeds_app/src/presentation/pages/splash_page/export.dart';

import '../export.dart';

class ListDataContent extends ConsumerWidget {
  const ListDataContent({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final providerReference = ref.watch(homeProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TwenAnimationWidget(
              widget: const InputSerachContent(),
              duration: 300,
              cant: 10,
              direction: AnimationWidgetStart.up,
            ),
            const SizedBox(height: 12),
            if (providerReference.breedsSearch != null &&
                providerReference.breedsSearch!.isEmpty)
              const Text("No data"),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                      providerReference.breedsSearch!.length, (index) {
                    return CardItemWidget(
                      breed: providerReference.breedsSearch![index],
                    );
                  }),
                ),
              ),
            )
          ]),
    );
  }
}
