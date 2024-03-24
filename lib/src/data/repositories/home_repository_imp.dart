import '../export.dart';

class HomeRepositoryImp implements HomeRepository {
  late final HomeRequestService _homeRequestService;
  HomeRepositoryImp(this._homeRequestService);
  @override
  Future<ResponseData<List<BreedDataModel>>?> getCatBreeds() async {
    try {
      final result = await _homeRequestService.getCatBreeds();

      if (result.isError == false && result.data != null) {
        return ResponseData(data: result.data as List<BreedDataModel>);
      } else {
        return ResponseData(errorMessage: result.errorMessage, isError: true);
      }
    } catch (e) {
      return ResponseData(
        errorMessage: '$e',
        isError: true,
      );
    }
  }
}
