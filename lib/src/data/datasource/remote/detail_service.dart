import '../../export.dart';

class DetailRequestService {
  late final ApiService _apiService;
  DetailRequestService(this._apiService);

  Future<ResponseData> getBreedDetail({required String breedId}) async {
    final result = await _apiService.detailRequest(breedId: breedId);

    if (result.statusCode == 200 || result.statusCode == 201) {
      final jsonData = jsonDecode(result.body);

      final data = BreedDetailModel.fromJson(jsonData[0]);

      return ResponseData(data: data, isError: false);
    } else {
      return ResponseData(data: result.body, isError: true);
    }
  }
}
