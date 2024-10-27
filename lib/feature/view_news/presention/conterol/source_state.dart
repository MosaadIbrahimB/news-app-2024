import '../../data/model/Sources.dart';

abstract class SourceState{}
class SourceStateInitial extends SourceState{}
class SourceStateLoading extends SourceState{}
class SourceStateSucceed extends SourceState{
  List<Sources?> list;

  SourceStateSucceed(this.list);
}
class SourceStateFailure extends SourceState{
  String msg;
  SourceStateFailure(this.msg);
}