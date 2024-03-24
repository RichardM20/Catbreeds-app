import '../export.dart';

class DetailUsecase {
  late final DetailRepositoryImp _detailRepositoryImp;
  DetailUsecase(this._detailRepositoryImp);
  Future<ResponseData<BreedDetailModel>> getDetail({required String id}) async {
    return await _detailRepositoryImp.getBreedDetail(id: id);
  }
}
