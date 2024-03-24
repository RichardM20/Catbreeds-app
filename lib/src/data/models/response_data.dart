class ResponseData<T> {
  bool isError;
  T? data;
  String? errorMessage;
  ResponseData({this.data, this.errorMessage, this.isError = false});
}
