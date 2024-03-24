import '../../export.dart';

class HomeRequestService {
  late final ApiService _apiService;
  HomeRequestService(this._apiService);

  Future<ResponseData> getCatBreeds() async {
    List<BreedDataModel> catsBreeds;
    final response = await _apiService.breedRequest();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final dataParsed =
          (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();

      catsBreeds = dataParsed
          .map<BreedDataModel>((json) => BreedDataModel.fromJson(json))
          .toList();

      return ResponseData(data: catsBreeds, isError: false);
    } else {
      return ResponseData(data: response.body, isError: true);
    }
  }
}
