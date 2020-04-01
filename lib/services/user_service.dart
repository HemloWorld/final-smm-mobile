import 'package:dio/dio.dart';
import 'package:final_project/constant/constants.dart';

class UserService {
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
      Response response = await Dio().get("$API/u/$id/$type");
      return response.data;
    } catch (e) {
      if(e.response.statusCode == 404) {
        return 404;
      }
      print(e);
    } 
  }

  fetchPresenceByUserId(userId, page) async {
    try {
      Response response = await Dio().get("$API/a/attendance/id?id=$userId&page=$page");

      return response.data;
    } catch (e) {
      print(e);
    }
  }
}