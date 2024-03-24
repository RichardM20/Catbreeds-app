import '../export.dart';

class DetailRepositoryImp implements DetailRepository {
  late final DetailRequestService _detailRequestService;
  DetailRepositoryImp(this._detailRequestService);

  @override
  Future<ResponseData<BreedDetailModel>> getBreedDetail({
    required String id,
  }) async {
    try {
      final result = await _detailRequestService.getBreedDetail(breedId: id);
      if (result.isError == false && result.data != null) {
        return ResponseData(data: result.data as BreedDetailModel);
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
