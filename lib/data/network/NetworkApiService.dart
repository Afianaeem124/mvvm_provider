import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:mvvm_provider/data/network/BaseApiService.dart';
import 'package:mvvm_provider/data/response/app_exceptions.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }
}

dynamic returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;

    case 400:
      throw BadRequestException(response.body.toString());

    case 500:
    case 404:
      throw UnauthorisedException(response.body.toString());

    default:
      throw FetchDataException('Error occured while communicatin with server' +
          'with status code' +
          response.statusCode.toString());
  }
}
