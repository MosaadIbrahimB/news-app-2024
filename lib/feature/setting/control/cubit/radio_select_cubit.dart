import 'package:bloc/bloc.dart';

class RadioSelectCubit extends Cubit<int> {
  RadioSelectCubit() : super(0);

  changeSelect(newSelect) {
    emit(newSelect);
  }
}
