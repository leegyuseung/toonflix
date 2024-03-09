import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart'; // namespace 설정

class ApiService {
  List<WebtoonModel> webtoonInstances = [];
  static const String baseURL =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$baseURL/$today');
    final response = await http.get(url); // Future 타입 -> 비동기
    if (response.statusCode == 200) {
      final List<dynamic> webtoons =
          jsonDecode(response.body); // dynamic 타입 -> 어떤 타입이든 수용
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
