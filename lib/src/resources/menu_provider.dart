import 'package:http/http.dart';
import 'package:whm/src/models/menu.dart';
import 'package:whm/src/utils/constants.dart';

class MenuProvider {
  Client client = Client();

  Future<Menu> fetchMenu() async {
    final Response response = await client.get('http://api.themoviedb.org/3/movie/popular?api_key=$apiKey');

    print(response.body.toString());

    if (response.statusCode == 200) {
      // return MenuModel.fromJson(json.decode(response.body));

      final Map<String, List<String>> menuObject = <String, List<String>>{
        'menu': <String>[
          'Who We are', 'Second', 'Third'
        ]
      };

      return Menu.fromJson(menuObject);
    }
    // If that call was not successful, throw an error.
    throw Exception('Failed to load menu');
  }
}