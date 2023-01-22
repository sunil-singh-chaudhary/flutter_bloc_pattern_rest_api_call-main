import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api_call/profile/ProfileModel.dart';
import 'package:flutter_bloc_api_call/profile/profile_service/webservices.dart';
import 'package:meta/meta.dart';

part 'testbloc_event.dart';
part 'testbloc_state.dart';

class TestblocBloc extends Bloc<TestblocEvent, TestblocState> {
  final webservice_api_call = WebServices();

  TestblocBloc() : super(TestblocInitial()) {
    on<FetchServiceCLickListner>((event, emit) => _callMyApi(event, emit));
  }

  void _callMyApi(
      FetchServiceCLickListner event, Emitter<TestblocState> emit) async {
    emit(TestblocLoading());

    var responseInList = await webservice_api_call.callProfileApi();

    if (responseInList == null) {
      emit(TestblocFailed("response have error"));
    } else {
      List list_of_data = jsonDecode(responseInList.body);
      //if get list from api use List not var here else var use
      var data = list_of_data.map((e) => ProfileModel.fromJson(e)).toList();

      emit(TestblocSuccess(data));
    }

    // List createliststring =
    // responseInList.map((e) => ProfileModel.fromJson(e)).toList();

    // emit(TestblocSuccess(createliststring));
  }
}
