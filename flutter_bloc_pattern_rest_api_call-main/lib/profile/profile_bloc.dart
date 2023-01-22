import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api_call/profile/profile_service/webservices.dart';
import 'package:flutter_bloc_api_call/profile/profile_state.dart';
import 'package:flutter_bloc_api_call/profile/profile_event.dart';
import 'ProfileModel.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _service = WebServices();

  ProfileBloc() : super(ProfileInitial()) {
    on<ButtonClicked>((event, emit) => _callApi(event, emit));
  }

  _callApi(ButtonClicked event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());

    var response = await _service.callProfileApi();
    if (response == null) {
      emit(ProfileError('Error'));
    } else {
      List list_of_data = jsonDecode(response.body);
      //if get list from api use List not var here else var use
      var data = list_of_data.map((e) => ProfileModel.fromJson(e)).toList();

      emit(ProfileSuccess(data));
    }
  }
}
