import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api_call/profile/ProfileModel.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileSuccess extends ProfileState {
  final List<ProfileModel> Listmodel;
  ProfileSuccess(this.Listmodel);

  @override
  List<Object> get props => [Listmodel];
}

class ProfileError extends ProfileState {
  final String msg;

  ProfileError(this.msg);

  @override
  List<Object> get props => [msg];
}
