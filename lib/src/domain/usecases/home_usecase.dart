import '../export.dart';

class Homeusecae {
  late final HomeRepositoryImp _homeRepositoryImp;
  Homeusecae(this._homeRepositoryImp);
  Future<ResponseData<List<BreedDataModel>>?> getData() async {
    return await _homeRepositoryImp.getCatBreeds();
  }
}
