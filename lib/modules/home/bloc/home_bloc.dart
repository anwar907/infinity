import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinity/app/data/models/content_models.dart';
import 'package:infinity/app/data/provider/content_provider.dart';
import 'package:infinity/app/data/provider/image_provider.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEventImage>(fetchEventDataImage);
    on<HomeEventContent>(fetchEventDataConent);
  }

  Future<void> fetchEventDataImage(
      HomeEventImage event, Emitter<HomeState> emit) async {
    try {
      final dataImage = await ImageProviders().fetchRandomImage();
      emit(HomeState(imageUrl: dataImage, status: InitialState.success));
    } catch (e) {
      emit(state.copyWith(status: InitialState.failure));
    }
  }

  Future<void> fetchEventDataConent(
      HomeEventContent event, Emitter<HomeState> emit) async {
    try {
      final dataConent = await ContentProvider().fetchDataContent();

      emit(HomeState(textDataModels: dataConent, status: InitialState.success));
    } catch (e) {
      emit(state.copyWith(status: InitialState.failure));
    }
  }
}
