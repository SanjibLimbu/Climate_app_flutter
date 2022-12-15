import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHandler {
  String url;
  NetworkHandler(this.url);

  Future getData() async{
    http.Response response = await http.get(
      Uri.parse(
        url,
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);



      // double temperature = decodedData['main']['temp'];
      // int condition = decodedData['weather'][0]['id'];
      // String cityName = decodedData['name'];
      
    }
    else{
      print(response.statusCode);
    }

  }

}
