part of 'home_bloc.dart';

enum InitialState { initial, success, failure }

class HomeState extends Equatable {
  const HomeState(
      {this.imageUrl, this.textDataModels, this.status = InitialState.initial});

  final List<Uint8List>? imageUrl;
  final TextDataModels? textDataModels;
  final InitialState status;

  HomeState copyWith(
      {List<Uint8List>? imageUrl,
      TextDataModels? textDataModels,
      InitialState? status}) {
    return HomeState(
        imageUrl: imageUrl ?? this.imageUrl,
        textDataModels: textDataModels ?? this.textDataModels,
        status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [imageUrl, textDataModels, status];
}
