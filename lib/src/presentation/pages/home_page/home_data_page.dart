import './export.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late HomeProvider _homeProvider;
  @override
  void initState() {
    initializateSetup();
    super.initState();
  }

  initializateSetup() async {
    _homeProvider = ref.read(homeProvider.notifier);
    _homeProvider.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final providerReference = ref.watch(homeProvider);

    return Scaffold(
      appBar: appBar(
        title: 'CatBreeds',
        nav: false,
      ),
      body: buildBody(providerReference),
    );
  }

  Widget buildBody(HomeState provider) {
    if (provider.loading == RequestState.loaded &&
        provider.requestResult == RequestResult.success) {
      return const ListDataContent();
    } else if (provider.loading == RequestState.loaded &&
        provider.requestResult == RequestResult.failed) {
      return CErrorWidget(errorMessage: provider.errorMessage ?? "Exception");
    }

    return const LoadingWidget();
  }
}
