import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieAPi {
  final api_key = '3N6J82CM0H76A1L7Q280';

  Future<List<dynamic>> search(String keyword) async {
    String site =
        'https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=$api_key&title=$keyword&detail=Y';
    var response = await http.get(Uri.parse(site));
    if (response.statusCode == 200) {
      var movies =
          jsonDecode(response.body)['Data'][0]['Result'] as List<dynamic>;
      return movies;
    } else {
      return [];
    }
  }
}
