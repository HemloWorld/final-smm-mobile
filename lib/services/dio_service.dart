import 'package:dio/dio.dart';

class DioService {
  getHttp() async {
    try {
      Response response = await Dio().get("http://192.168.43.243:3000/p/");
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}