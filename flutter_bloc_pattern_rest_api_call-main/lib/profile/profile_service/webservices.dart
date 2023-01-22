import 'package:http/http.dart' as http;

class WebServices {
  Future callProfileApi() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    var response = await http.get(url);
    //  print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      // print('Response body: ${response.body}');
      return response;
    }

    return null;
  }
}
