import 'package:catbreeds_app/src/presentation/pages/detail_data_page/widgets/detail_data_content.dart';
import 'package:catbreeds_app/src/presentation/providers/export.dart';

import './export.dart';

class DetailDataPage extends ConsumerStatefulWidget {
  const DetailDataPage({super.key});

  @override
  ConsumerState<DetailDataPage> createState() => _DetailDataPageState();
}

class _DetailDataPageState extends ConsumerState<DetailDataPage> {
  late DetailDataProvider _detailDataProvider;
  @override
  void initState() {
    initializateSetup();
    super.initState();
  }

  initializateSetup() async {
    Map data = {};
    WidgetsBinding.instance.addPostFrameCallback((_) {
      data = GoRouterState.of(context).extra! as Map;
      _detailDataProvider = ref.read(detailProvider.notifier);
      _detailDataProvider.initState();
    });
    await Future.delayed(const Duration(milliseconds: 100));
    _detailDataProvider.fetchData(id: data['id'], breed: data['breed']);
  }

  @override
  Widget build(BuildContext context) {
    final providerReference = ref.watch(detailProvider);

    return Scaffold(
      appBar: appBar(
        context: context,
        nav: true,
        title: providerReference.breed?.id,
      ),
      body: buildBody(providerReference),
    );
  }

  Widget buildBody(DetailDataState provider) {
    if (provider.loading == RequestDetailState.loaded &&
        provider.requestResult == RequestDetailResult.success) {
      return const DetailDataContent();
    } else if (provider.loading == RequestDetailState.loaded &&
        provider.requestResult == RequestDetailResult.failed) {
      return CErrorWidget(errorMessage: provider.errorMessage ?? "Exception");
    }

    return const LoadingWidget();
  }
}
