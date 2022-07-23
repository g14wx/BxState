import 'package:bloc_and_getx_architecture/BloCs/HomeBloc/home_bloc.dart';
import 'package:bloc_and_getx_architecture/Boxes/account_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final accountBox = Get.find<AccountBox>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello')),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return state.map(initialState: (value) {
            return getBody(context);
          }, loading: (value) => const CircularProgressIndicator(),
              complete: (value) => getBody(context),);
        },),
      ),
    );
  }
  Widget getBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Text('this is home ${accountBox.amount.value}')),
        Text('This is home from state ${context.read<HomeBloc>().state.mapOrNull(complete: (value) => value.amount,)}'),
        ElevatedButton(onPressed: (){
          context.read<HomeBloc>().add(const HomeEvent.addAmount(amount: 1));
        }, child: const Text('Add \$1 amount'))
      ],
    );
  }
}
