
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'app_config.dart';

@Injectable()
class BaseApi {
  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer ${AppConfig.API_KEY}"
      };

  Future<T> get<T>(
      String path, T Function(http.Response response) callBack) async {
    http.Response response =
        await http.get(Uri.parse("${AppConfig.BASE_URL}$path"), headers: headers);
    if (response.statusCode == 200) {
      return callBack(response);
    } else {
      throw Exception("Something went Wrong..!!!");
    }
  }
}
