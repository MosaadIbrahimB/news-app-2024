import '../../../../feature/view_news/data/model/ResponseNews.dart';
import '../../../../feature/view_news/data/model/ResponseSources.dart';

abstract class RemoteApi{
  Future<ResponseSources>  getSources({String? category});
  Future<ResponseNews>  getNews( {String ?idSource,String ? q});
}