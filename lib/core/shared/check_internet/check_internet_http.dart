import 'package:http/http.dart' as http;

class CheckInternetHttp{
  Future<bool> checkInternetConnection() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}