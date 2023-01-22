part of 'testbloc_bloc.dart';

@immutable
abstract class TestblocEvent extends Equatable {
  const TestblocEvent();
}

class FetchServiceCLickListner extends TestblocEvent {
  @override
  List<Object?> get props => [];
}
