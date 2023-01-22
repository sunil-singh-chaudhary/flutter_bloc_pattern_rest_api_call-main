part of 'testbloc_bloc.dart';

@immutable
abstract class TestblocState extends Equatable {
  const TestblocState();
}

class TestblocInitial extends TestblocState {
  @override
  List<Object?> get props => [];
}

class TestblocLoading extends TestblocState {
  @override
  List<Object?> get props => [];
}

class TestblocSuccess extends TestblocState {
  List<ProfileModel> list;
  TestblocSuccess(this.list);

  @override
  List<Object?> get props => [list];
}

class TestblocFailed extends TestblocState {
  String msg;
  TestblocFailed(this.msg);

  @override
  List<Object?> get props => [msg];
}
