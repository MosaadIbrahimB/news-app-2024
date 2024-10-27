import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_2024/core/shared/constant/api_constant.dart';
import 'package:news_app_2024/core/shared/network/remote_data/remot_api.dart';

import '../../../../feature/view_news/data/model/ResponseNews.dart';
import '../../../../feature/view_news/data/model/ResponseSources.dart';

class ApiManagerHttp implements RemoteApi {
  @override
  Future<ResponseSources> getSources({String? category}) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.endPointSources,
        {"apiKey": ApiConstant.apiKey, "category": category});
    http.Response responseString = await http.get(url);
    var responseJson = jsonDecode(responseString.body);
    ResponseSources responseSources = ResponseSources.fromJson(responseJson);
    return responseSources;
  }

  @override
  Future<ResponseNews> getNews( {String? idSource, String? q}) async {
    Uri url = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.endPointEverything,
      {
        "sources": idSource,
        "q": q,
        "apiKey": ApiConstant.apiKey,
      },
    );
    http.Response responseString = await http.get(url);
    var json = jsonDecode(responseString.body);
    ResponseNews responseNews = ResponseNews.fromJson(json);
    return responseNews;
  }
}
