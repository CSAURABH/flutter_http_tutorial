import 'package:fetch_api_flutter_tutorial/model/users.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Users>?> getUsers() async {
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return usersFromJson(json);
    }
    return null;
  }
}
