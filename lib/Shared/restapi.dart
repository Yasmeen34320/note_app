import 'package:http/http.dart' as http;
import 'dart:convert';

class restapi {
  getrequest(String url) async {
    try {
      // url (link of php so we need a parameter to this function)
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error catch $e");
    }
  }

  posttrequest(String url, Map data) async {
    try {
      // post need a map because it use with insert so i need a data (like username , password (parameter of request))
      var response = await http.post(
        Uri.parse(url),
        body: data,
      );
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error catch $e");
    }
  }
}
