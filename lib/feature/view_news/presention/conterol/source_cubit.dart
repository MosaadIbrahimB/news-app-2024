import 'package:bloc/bloc.dart';
import 'package:news_app_2024/feature/view_news/presention/conterol/source_state.dart';

import '../../../../core/shared/check_internet/check_internet_http.dart';
import '../../../../core/shared/network/remote_data/remot_api.dart';
import '../../data/model/ResponseSources.dart';
import '../../data/model/Sources.dart';

class SourceCubit extends Cubit<SourceState>{
  RemoteApi remoteApi ;
  SourceCubit({required this.remoteApi}):super(SourceStateInitial());

  getSources({String ? category})async{
    if(await CheckInternetHttp().checkInternetConnection()){
      emit(SourceStateLoading());
      try{
        ResponseSources  data=  await remoteApi.getSources(category: category);
        List<Sources>list=data.sources??[];
        emit(SourceStateSucceed(list));
      }catch (e){
        ResponseSources  data=  await remoteApi.getSources();
        emit(SourceStateFailure(data.message??"55"));
      }

    }else{
      emit(SourceStateFailure("No Internet"??"55"));
    }


  }

}
