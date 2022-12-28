// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiModel {
  static SharedPreferences? prefs;
  static Dio? dio;

  ApiModel._sharedInstance();
  static final ApiModel _shared = ApiModel._sharedInstance();
  factory ApiModel() => _shared;



  static Future updateHeader({
    SharedPreferences? pref,
    String? newToken,
  }) async 
  {
    dio = Dio();
    if (pref != null) {
      prefs = pref;
    }
    if (newToken != null) {
      prefs!.setString('first_token', newToken);
    }
    String token = prefs!.getString('first_token') ?? "";
    print("token in postting ===>> $token");
    dio!.options.headers['Authorization'] = 'Bearer $token';
    dio!.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    dio!.options.headers['Connection'] = 'keep-alive';
    dio!.options.contentType = Headers.formUrlEncodedContentType;
  }

  static Future post(Map<String, dynamic> params, String url) async {
    String token = prefs!.getString(AppConstants.token) ?? "";
    Response response;
    print("post token ===>>> $token");
    dio!.options.headers["Content-Type"] = "application/json";
    dio!.options.headers["Authorization"] = "Bearer $token";
    try {
      response = await dio!.post(url, data: params);
      print('trying to upload...');
      print("post login url ===>>> $url");
      print("api field values ===>>> $params");
      print("api model response ===>>> $response");
      print("api data response ===>>> ${response.data}");
      return response.data;
    } catch (e) {
      print(e.toString());
      return {"code": -999, "message": "$url|$e"};
    }
  }

  static Future get(String url) async {
    String? token = prefs!.getString(AppConstants.token);

    Response response;
    dio!.options.headers["Content-Type"] = "application/json";
    dio!.options.headers["Authorization"] = "Bearer $token";

    try {
      print("get data url ===>>> $url");
      response = await dio!.get(url);
      if (response.statusCode == 200) {
        print("token ===>>> $token");
        print("getting get responnse ===>>> $response");
        print("getting get responnse data ===>>> ${response.data}");
        return response.data;
      } else {
        return {"code": -999, "desc": "connection failed"};
      }
    } catch (e) {
      print(e.toString());
      return {"code": -999, "message": "$url|$e"};
    }
  }

  /* 
  * Post FormData
  * In Sender from
  * In User Login
  */

  static Future postFormData(Map<String, dynamic> body, String url) async {
    Response response;
    try {
      var formData = FormData.fromMap(body);

      response = await dio!.post(url, data: formData);

      print('trying to upload...');
      print('geeting url when posting data ==> $url');
      print('getting body response when posting data ===> $body');
      print("getting post responnse ===>>> $response");
      print("api model response ===>>> ${response.data}");
      return response.data;
    } catch (e) {
      print("posting data error is here ===>>> ${e.toString()}");
      return {"message": "$url|$e"};
    }
  }

  /* 
  * Delete Data
  * 
  */

  static Future deteleData(Map<String, dynamic> body, String url) async {
    Response response;
    try {
      var formData = FormData.fromMap(body);
      response = await dio!.delete(url, data: formData);
      print('trying to upload the formdata...');
      print('geeting url when posting data ==> $url');
      print('getting body response when posting data ===> $body');
      print("getting post responnse ===>>> $response");
      print("getting post responnse ===>>> ${response.data}");
      return response.data;
    } catch (e) {
      print("posting data error is here ===>>> ${e.toString()}");
      return {"message": "$url|$e"};
    }
  }
}



