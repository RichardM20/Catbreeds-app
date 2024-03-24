import 'package:catbreeds_app/src/domain/usecases/detail_usecase.dart';

import '../export.dart';

class DetailDataProvider extends StateNotifier<DetailDataState> {
  late final DetailUsecase _detailUsecase;
  DetailDataProvider(this._detailUsecase)
      : super(
          DetailDataState(
            loading: RequestDetailState.loading,
            errorMessage: '',
            image: '',
            requestResult: RequestDetailResult.initial,
          ),
        );

  Future<void> fetchData({
    required String id,
    required BreedDataModel breed,
  }) async {
    try {
      final result = await _detailUsecase.getDetail(id: id);

      if (result.data != null) {
        state = state.copyWith(image: result.data?.url ?? "");
        state = state.copyWith(breed: breed);
        stateRquest(
          requestResult: RequestDetailResult.success,
          stateRequest: RequestDetailState.loaded,
        );
      } else {
        stateRquest(
          requestResult: RequestDetailResult.failed,
          stateRequest: RequestDetailState.loaded,
          errorMessage: result.errorMessage,
        );
      }
    } catch (e) {
      stateRquest(
        requestResult: RequestDetailResult.failed,
        stateRequest: RequestDetailState.loaded,
        errorMessage: '$e',
      );
    }
  }

  initState() {
    stateRquest(
      requestResult: RequestDetailResult.initial,
      stateRequest: RequestDetailState.loading,
    );
  }

  stateRquest({
    RequestDetailResult? requestResult,
    RequestDetailState? stateRequest,
    String? errorMessage,
  }) {
    state = state.copyWith(
      loading: stateRequest,
      errorMessage: errorMessage,
      requestResult: requestResult,
    );
  }
}

final detailProvider =
    StateNotifierProvider<DetailDataProvider, DetailDataState>((ref) {
  return DetailDataProvider(
    DetailUsecase(
      DetailRepositoryImp(
        DetailRequestService(
          ApiService(),
        ),
      ),
    ),
  );
});
