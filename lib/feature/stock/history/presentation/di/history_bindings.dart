import 'package:asset_variation/feature/stock/history/data/data_source/stock_history_data_source.dart';
import 'package:asset_variation/feature/stock/history/data/data_source/stock_history_data_source_impl.dart';
import 'package:asset_variation/feature/stock/history/data/repositories/stock_history_repository_impl.dart';
import 'package:asset_variation/feature/stock/history/domain/entities/stock_history.dart';
import 'package:asset_variation/feature/stock/history/domain/repositories/stock_history_repository.dart';
import 'package:asset_variation/feature/stock/history/domain/use_cases/get_stock_history.dart';
import 'package:get/get.dart';

class HistoryBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStockHistory>(() => GetStockHistoryImpl(Get.find()));
    Get.lazyPut<StockHistoryRepository>(() => StockHistoryRepositoryImpl(Get.find()));
    Get.lazyPut<StockHistoryDataSource>(() => StockHistoryDataSourceImpl());
    Get.lazyPut<StockHistory>(() => StockHistory());

  }
}