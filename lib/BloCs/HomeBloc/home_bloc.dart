import 'package:bloc_and_getx_architecture/Boxes/account_box.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';
part 'home_bloc.g.dart';


@injectable
class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initialState()) {
    final accountBox = Get.find<AccountBox>();
    on<HomeEvent>((event, emit) async {
      await event.map(addAmount: (value) async {
        emit(const HomeState.loading());
        await Future.delayed(Duration(seconds:math.Random().nextInt(3)));
        final amountToAdd = (value.amount ?? 0);
        accountBox.addAmount(amountToAdd);
        emit(HomeState.complete(amount: accountBox.amount.value));
      },);
    });
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    return HomeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    return state.toJson();
  }
}
