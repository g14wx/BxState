import 'package:bloc_and_getx_architecture/BloCs/HomeBloc/home_bloc.dart';
import 'package:bloc_and_getx_architecture/Presentation/Pages/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) =>
            BlocProvider(
              create: (context) => HomeBloc(),
              child: Home(),
            )
      },
      initialRoute: "/",
    );
  }
}
