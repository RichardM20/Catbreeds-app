import 'package:http/http.dart' as http;

class ApiService {
  final Map<String, String> _header = {
    'Content-Type': 'application/json',
    'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39'
  };

  Future<http.Response> breedRequest() async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds'),
      headers: _header,
    );
    return response;
  }

  Future<http.Response> detailRequest({
    required String breedId,
  }) async {
    final response = await http.get(
      Uri.parse(
        'https://api.thecatapi.com/v1/images/search?breed_ids=$breedId',
      ),
      headers: _header,
    );
    return response;
  }
}
