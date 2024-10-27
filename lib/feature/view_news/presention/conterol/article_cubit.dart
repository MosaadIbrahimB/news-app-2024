import 'package:bloc/bloc.dart';
import 'package:news_app_2024/core/shared/network/remote_data/remot_api.dart';

import 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState>{
RemoteApi remoteApi;
  ArticleCubit(this.remoteApi):super(ArticleStateInitial());

getArticle(String idSource,String ?q)async{
  emit(ArticleStateLoading());
  await remoteApi.getNews(idSource: idSource,q: q);
}


}



