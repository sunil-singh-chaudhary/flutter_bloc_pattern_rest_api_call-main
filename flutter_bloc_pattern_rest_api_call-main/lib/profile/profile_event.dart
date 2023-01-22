import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api_call/profile/ProfileModel.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ButtonClicked extends ProfileEvent {
  @override
  List<Object?> get props => [];
}
