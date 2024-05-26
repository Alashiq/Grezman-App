import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Features/Auth/Controllers/auth_controller.dart';

class SharedApi {
  String baseUrl = "http://10.100.106.242:8000/app/v1/api/";

  Map<String, String> getToken() {
    AuthController authController = Get.find();
    String? token = authController.user?.token ?? "Bad Request";
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + token.toString(),
    };
  }

  Map<String, String> getHeader() {
    return {
      "Content-Type": "application/json",
    };
  }

  Future<http.Response> getAuth({required String urlPath}) async {
    return await http.get(Uri.parse(baseUrl + urlPath), headers: getToken());
  }

  Future<http.Response> putAuth({required String urlPath}) async {
    return await http.put(Uri.parse(baseUrl + urlPath), headers: getToken());
  }

  Future<http.Response> getNoAuth({required String urlPath}) async {
    print(baseUrl + urlPath);
    return await http.get(Uri.parse(baseUrl + urlPath));
  }

  Future<http.Response> postNoAuth(
      {required String urlPath, required bodyData}) async {
    print(baseUrl + urlPath);
    return await http.post(Uri.parse(baseUrl + urlPath),
        body: bodyData, headers: getHeader());
  }

  Future<http.Response> postAuth(
      {required String urlPath, required bodyData}) async {
    return await http.post(Uri.parse(baseUrl + urlPath),
        body: bodyData, headers: getToken());
  }
}
