import '../export.dart';

abstract class HomeRepository {
  Future<ResponseData<List<BreedDataModel>>?> getCatBreeds();
}
