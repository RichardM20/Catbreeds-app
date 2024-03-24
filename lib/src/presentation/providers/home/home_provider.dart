import '../export.dart';

class HomeProvider extends StateNotifier<HomeState> {
  late final Homeusecae _homeusecae;
  HomeProvider(this._homeusecae)
      : super(
          HomeState(
            loading: RequestState.loading,
            errorMessage: '',
            requestResult: RequestResult.initial,
          ),
        );

  Future<void> fetchData() async {
    try {
      final result = await _homeusecae.getData();

      if (result!.data != null) {
        state = state.copyWith(breeds: result.data ?? []);
        state = state.copyWith(breedsSearch: result.data ?? []);
        stateRquest(
          requestResult: RequestResult.success,
          stateRequest: RequestState.loaded,
        );
      } else {
        stateRquest(
          requestResult: RequestResult.failed,
          stateRequest: RequestState.loaded,
          errorMessage: result.errorMessage,
        );
      }
    } catch (e) {
      stateRquest(
        requestResult: RequestResult.failed,
        stateRequest: RequestState.loaded,
        errorMessage: '$e',
      );
    }
  }

  filterData(String name) {
    if (name.isEmpty) {
      state = state.copyWith(breedsSearch: state.breeds);
    } else {
      final result = state.breeds!.where((breed) {
        final breedName = breed.name?.toLowerCase();
        return breedName!.contains(name);
      }).toList();
      state = state.copyWith(breedsSearch: result);
    }
  }

  stateRquest({
    RequestResult? requestResult,
    RequestState? stateRequest,
    String? errorMessage,
  }) {
    state = state.copyWith(
      loading: stateRequest,
      errorMessage: errorMessage,
      requestResult: requestResult,
    );
  }
}

final homeProvider =
    AutoDisposeStateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider(
    Homeusecae(
      HomeRepositoryImp(
        HomeRequestService(
          ApiService(),
        ),
      ),
    ),
  );
});
