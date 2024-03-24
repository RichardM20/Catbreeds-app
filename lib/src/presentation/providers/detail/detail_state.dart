import 'package:catbreeds_app/src/domain/export.dart';

enum RequestDetailState { loading, loaded }

enum RequestDetailResult { initial, success, failed }

class DetailDataState {
  DetailDataState({
    this.loading,
    this.errorMessage,
    this.breed,
    this.requestResult,
    this.image,
  });

  RequestDetailState? loading;
  RequestDetailResult? requestResult;
  BreedDataModel? breed;
  String? image;

  String? errorMessage;

  DetailDataState copyWith({
    RequestDetailState? loading,
    RequestDetailResult? requestResult,
    String? errorMessage,
    String? image,
    BreedDataModel? breed,
  }) {
    return DetailDataState(
      image: image ?? this.image,
      breed: breed ?? this.breed,
      requestResult: requestResult ?? this.requestResult,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
