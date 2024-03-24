import '../export.dart';

class DetailDataContent extends ConsumerWidget {
  const DetailDataContent({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final provideReference = ref.watch(detailProvider);
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Imagewidget(
            width: size.width,
            height: size.width,
            urlImage: provideReference.image,
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InformationTextContent(
                    title: 'Description',
                    info: provideReference.breed?.description ?? "",
                  ),
                  const SizedBox(height: 12),
                  InformationTextContent(
                    title: 'Origin',
                    info: provideReference.breed?.origin ?? "",
                  ),
                  const SizedBox(height: 12),
                  InformationTextContent(
                    title: 'Temperament',
                    info: "${provideReference.breed?.temperament ?? 0}",
                  ),
                  const SizedBox(height: 12),
                  InformationTextContent(
                    title: 'Life span',
                    info: provideReference.breed?.lifeSpan ?? "",
                  ),
                  const SizedBox(height: 12),
                  InformationTextContent(
                    title: 'Intelligence',
                    info: "${provideReference.breed?.intelligence ?? 0}",
                  ),
                  const SizedBox(height: 12),
                  InformationTextContent(
                    title: 'Adaptability',
                    info: "${provideReference.breed?.adaptability ?? 0}",
                  ),
                  const SizedBox(height: 12),
                  InformationTextContent(
                    title: 'EnergyLevel',
                    info: "${provideReference.breed?.energyLevel ?? 0}",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
