part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.addAmount({int? amount}) = _HomeEvent;
}
