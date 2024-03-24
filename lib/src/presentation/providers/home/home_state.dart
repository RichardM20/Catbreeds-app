import 'package:catbreeds_app/src/domain/export.dart';

enum RequestState { loading, loaded }

enum RequestResult { initial, success, failed }

class HomeState {
  HomeState({
    this.loading,
    this.errorMessage,
    this.breeds,
    this.requestResult,
    this.breedsSearch,
  });

  RequestState? loading;
  RequestResult? requestResult;
  List<BreedDataModel>? breeds;
  List<BreedDataModel>? breedsSearch;
  String? errorMessage;

  HomeState copyWith({
    RequestState? loading,
    RequestResult? requestResult,
    String? errorMessage,
    List<BreedDataModel>? breeds,
    List<BreedDataModel>? breedsSearch,
  }) {
    return HomeState(
      breedsSearch: breedsSearch ?? this.breedsSearch,
      breeds: breeds ?? this.breeds,
      requestResult: requestResult ?? this.requestResult,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
