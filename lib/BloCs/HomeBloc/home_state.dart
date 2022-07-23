part of 'home_bloc.dart';

@immutable
@freezed
class HomeState with _$HomeState {
  const factory HomeState.initialState() = _InitialState;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.complete({required int amount}) = _Complete;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
