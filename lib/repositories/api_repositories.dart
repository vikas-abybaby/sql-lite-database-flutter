import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo/repositories/api_urls.dart';
import 'package:todo/Router/routing_service.dart';
import 'package:todo/views/widgets/snackbar.dart';
import 'package:todo/views/widgets/custom_loading.dart';

class Api {
  static final authHeader = {'accept': "application/json"};

  Dio api = Dio(BaseOptions(baseUrl: baseUrl, contentType: "application/json"));
  Future<dynamic> request({
    required String url,
    required RequestMethod method,
    Object? payload,
    BuildContext? context,
    required Map<String, dynamic> header,
    bool? showLogs,
    bool? showLoader,
    bool? showSnackbar,
  }) async {
    if (showLoader ?? true) {
      showLoading();
    }
    if (showLogs ?? true) {
      log("Request url-- $baseUrl$url");
      log("Request methode-- ${method.name}");
      log("header-- $header");
      log("logs-- $showLogs");
      if (payload is FormData) {
        log("Request Body FormData -- ${payload.fields} ${payload.files}");
      } else {
        log("Request Body-- $payload");
      }
    }
    try {
      Response<dynamic> response;
      switch (method) {
        case RequestMethod.get:
          response = await api.get(
            url,
            data: payload,
            options: Options(headers: header),
          );
          break;
        case RequestMethod.post:
          response = await api.post(
            url,
            data: payload,
            options: Options(headers: header),
          );
          break;
        case RequestMethod.patch:
          response = await api.patch(
            url,
            data: payload,
            options: Options(headers: header),
          );
          break;
        case RequestMethod.delete:
          response = await api.delete(url, options: Options(headers: header));
          break;
      }
      if (showLoader ?? true) {
        await RoutingService().goBack();
      }

      if (response.data["result"] is Map &&
          (response.data["result"] as Map).containsKey("response") &&
          response.data["result"]["response"] != null &&
          (response.data["result"]["status"] == 200 ||
              response.data["result"]["status"] == 201)) {
        log("message${response.data["result"]["message"].toString()}");

        if ((response.data["result"]["message"].toString() != "") &&
            (response.data["result"]["message"].toString() != "null") &&
            (showSnackbar ?? false)) {
          SnackBarData.topShowSnackBar(
            response.data["result"]["message"].toString(),
            Colors.green,
          );
        }
        return response.data["result"]["response"];
      } else {
        if ((response.data["result"]["message"] != null) &&
            (response.data["result"]["message"] != "") &&
            (response.data["result"]["message"] != "null")) {
          SnackBarData.topShowSnackBar(
            (response.data["result"]["message"]).toString(),
            Colors.redAccent,
          );
        }
        return (response.data["result"]["response"] is List) ? [] : null;
      }
    } on DioException catch (e) {
      if (showLoader ?? true) {
        await RoutingService().goBack();
      }
      if (e.type == DioExceptionType.connectionError) {
        SnackBarData.topShowSnackBar(
          'Check Your Internet Connection',
          Colors.redAccent,
        );
      } else {
        SnackBarData.topShowSnackBar(
          'Server error :- ${e.message.toString()}',
          Colors.redAccent,
        );
      }
    }
  }
}

enum RequestMethod { get, post, patch, delete }
