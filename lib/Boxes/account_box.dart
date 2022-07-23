import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountBox extends GetxController {

  final _box = GetStorage();
  RxInt amount = 0.obs;

  AccountBox(){
    int? savedAmount = _box.read('amount');
    if ( savedAmount != null) {
      amount(savedAmount);
    }
  }
  
  addAmount(int newAmount) {
    amount(amount.value + newAmount);
    _box.write('amount', amount.value);
  }
}