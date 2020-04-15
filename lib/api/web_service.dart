import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';


abstract class WebService {
  Future<String> executeGetRequest(String url);
}

class DefaultWebService implements WebService {
  http.BaseClient webClient;

  DefaultWebService(){
    // THIS VALUE SHOULD NEVER BE COMMITTED TO GIT EXCEPT AS EMPTY STRING
    // Example value for debug purposes: 192.168.86.30:8888
    String proxy = "";

    if (proxy.isNotEmpty) {
      HttpClient httpClient = new HttpClient();

      httpClient.findProxy = (uri) {
        return "PROXY $proxy";
      };

      // This is a workaround to allow Charles to receive
      // SSL payloads when your app is running on Android.
      httpClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => Platform.isAndroid);

      webClient = IOClient(httpClient);
    } else {
      webClient = IOClient();
    }
  }

  @override
  Future<String> executeGetRequest(String url) async {
    try {
      final result = await webClient.get(url);
      if (result.statusCode == 200) {
        return result.body;
      } else {
        return Future.error(result.statusCode);
      }
    } catch(e) {
      return Future.error(e.toString());
    }
  }
}