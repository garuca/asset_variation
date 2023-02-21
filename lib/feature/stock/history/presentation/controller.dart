import 'package:asset_variation/data_service.dart';
import 'package:asset_variation/feature/stock/history/domain/entities/stock_history.dart';
import 'package:asset_variation/feature/stock/history/domain/use_cases/get_stock_history.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class Controller extends GetxController
    with StateMixin<Tuple4<List<double>,List<double?>?,List<double?>?, List<int>>> {
  final GetStockHistory getStockHistory;

  Controller(this.getStockHistory);
  @override
  void onInit() async {
    super.onInit();

    final response = await getStockHistory();
    response.fold(
      (failure) => change(const Tuple4([], [],[],[]), status: RxStatus.error(failure.error)),
      (success) => changeStockHistory(success!),
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  final Rx<StockHistory> stockHistory = StockHistory().obs;

  void changeStockHistory(StockHistory value) {
    change(Tuple4(value.open!,value.percentDayMinusOne,value.percentFirstDay,value.timestamp!), status: RxStatus.success());
  }
}
