import 'package:dio/dio.dart';
import 'package:final_project/constant/constants.dart';

class DioService {
  getHttp() async {
    try {
      Response response = await Dio().get(API + "/p/");
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  fetchById(id, type) async {
    try {
      Response response = await Dio().get(API + "/p" + "/$id" + "/$type");
      return response.data;
    } catch (e) {
      // ini ngecheck errornya 404 atau bukan, kalo iya kirim sinyal ke yang manggil
      if(e.response.statusCode == 404) {
        return 404;
      }
      print(e);
    } 
  }
}