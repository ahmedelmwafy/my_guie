// ignore_for_file: unnecessary_null_comparison, always_declare_return_types

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_guie/helpers/cash.dart';
import 'package:my_guie/widgets/toast.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://toyshomekw.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response?> getData({
    path,
    queryParameters,
  }) async {
    try {
      return await dio!.get(path,
          queryParameters: queryParameters,
          options: Options(
              validateStatus: (_) => true,
              headers: CashedHelper.getUserToken() != null ||
                      CashedHelper.getUserToken() != ''
                  ? {
                      'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
                      'Accept': 'application/json',
                      'lang': CashedHelper.getLang()
                    }
                  : {'lang': CashedHelper.getLang()}));
    } on SocketException catch (e) {
      log(e.message);
      customToast(e.message);
    } on DioError catch (e) {
      log(e.message.toString());
      String errorMsg = _handleResponse(e.response!);
      customToast(errorMsg);
    }
    return null;
  }

  static Future<Response?> postData({path, data}) async {
    try {
      log(data.toString());
      log(path.toString());
      return await dio!.post(path,
          data: data,
          options: Options(
            contentType: 'application/json',
            headers: CashedHelper.getUserToken() != null ||
                    CashedHelper.getUserToken() != ''
                ? {
                    'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
                    'Accept': 'application/json',
                    'lang': CashedHelper.getLang()
                  }
                : {'lang': CashedHelper.getLang()},
            followRedirects: false,
          ));
    } on SocketException catch (e) {
      log(e.message);
      customToast(e.message);
    } on DioError catch (e) {
      log(e.message.toString());
      log(e.response.toString());
      log(e.response!.statusCode.toString());
      String errorMsg = _handleResponse(e.response!);
      customToast(errorMsg);
    }
    return null;
  }

  static String _handleResponse(Response response) {
    if (response == null) {
      var jsonResponse = 'connection error';
      return jsonResponse;
    }
    switch (response.statusCode) {
      case 400:
        var jsonResponse = 'UnAuth';
        return jsonResponse;
      case 401:
        var jsonResponse = 'UnAuth';
        return jsonResponse;
      case 403:
        var jsonResponse = 'UnAuth';
        return jsonResponse;
      case 404:
        var jsonResponse = 'Not found';
        return jsonResponse;
      case 422:
        var jsonResponse = 'some fileds required! or error with entry data';
        return jsonResponse;
      case 500:
        var jsonResponse = 'server error';
        return jsonResponse;
      default:
        var jsonResponse = 'server error';
        return jsonResponse;
    }
  }
}
