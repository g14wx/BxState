import 'package:bloc_and_getx_architecture/Boxes/account_box.dart';
import 'package:bloc_and_getx_architecture/MainEntryApp/my_app.dart';
import 'package:bloc_and_getx_architecture/service_locator_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await GetStorage.init();
  Get.lazyPut(()=>AccountBox());
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
        () => runApp(MyApp()),
    storage: storage,
  );
  runApp(const MyApp());
}
