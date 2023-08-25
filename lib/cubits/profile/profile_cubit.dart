import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:meta/meta.dart';

import '../../data/models/universal_data.dart';
import '../../data/models/user/user_model.dart';
import '../../data/repositories/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepository}) : super(ProfileInitial());

  final ProfileRepository profileRepository;

  getUserData() async {
    emit(ProfileLoadingState());
    UniversalData response = await profileRepository.getUserData();
    if (response.error.isEmpty) {
      debugPrint("DATA:${response.data}");
      emit(ProfileSuccessState(userModel: response.data as UserModel),);
    } else {
      emit(ProfileErrorState(errorText: response.error));
    }
  }
}