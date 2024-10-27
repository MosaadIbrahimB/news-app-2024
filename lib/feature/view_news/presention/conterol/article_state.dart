import '../../data/model/ResponseNews.dart';

abstract class ArticleState{}
class ArticleStateInitial extends ArticleState{}
class ArticleStateLoading extends ArticleState{}
class ArticleStateSucceed extends ArticleState{
  List<Articles>?list;

  ArticleStateSucceed(this.list);
}
class ArticleStateFailure extends ArticleState{
  String msg;
  ArticleStateFailure(this.msg);
}