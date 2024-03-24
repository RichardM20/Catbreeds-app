import '../export.dart';

abstract class DetailRepository {
  Future<ResponseData<BreedDetailModel>> getBreedDetail({required String id});
}
