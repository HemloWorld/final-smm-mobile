import 'package:dio/dio.dart';

class DioService {
  getHttp() async {
    try {
      Response response = await Dio().get("http://10.34.5.201:3000/p/");
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}