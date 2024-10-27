// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:news_app_2024/core/shared/constant/api_constant.dart';
// import 'package:news_app_2024/core/shared/network/remote_data/remot_api.dart';
//
// import '../../../../feature/view_news/data/model/ResponseSources.dart';
//
// class ApiManagerDio implements RemoteApi {
//   @override
//   Future<ResponseSources> getSources() async {
//     Dio dio = Dio();
//     Response response = await dio.get(
//         "https://${ConstantManger.baseUrl}/${ConstantManger.endPointSources}",
//         queryParameters: {"apiKey": ConstantManger.apiKey});
//     ResponseSources responseSources =
//         ResponseSources.fromJson(jsonDecode(response.data));
//     return responseSources;
//   }
//
//   @override
//   Future<ResponseSources> getData(String idSource) {
//     throw UnimplementedError();
//   }
// }
