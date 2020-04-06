import 'package:dio/dio.dart';
import 'package:final_project/blocs/bloc_state.dart';
import 'package:final_project/constant/constants.dart';

class UserService {
//  var dio = Dio();

//  login(email) async {
//    try {
//      Response response = await Dio().post(API + "/auth", data: {"email" : email});
//      dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
//        var customHeaders = {
//          'Content-Type': 'application/json',
//          'Authorization':'Bearer ${response.data['token']}',
//        };
//        options.headers.addAll(customHeaders);
//        return options;
//      }));
//      id = response.data['token'];
//      return response.data['id'];
//    } catch(e){
//      print(e);
//    }
//  }

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

  fetchPresenceByDate(date) async {
    try {
      Response response = await Dio().get("$API/a/attendance/date?date=$date");
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  postAttendance(userId, date, time) async {
    try {
      Response response = await Dio().post("$API/a/$userId/submit", data: {"date": date, "time": time});
      return response.data;
    } catch (e) {
      if(e.response.statusCode == 404) {
        return 404;
      }
      print(e);
    }
  }
}