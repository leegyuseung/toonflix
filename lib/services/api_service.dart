import 'package:http/http.dart' as http; // namespace 설정

class ApiService {
  final String baseURL = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseURL/$today');
    final response = await http.get(url); // Future 타입 -> 비동기
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
