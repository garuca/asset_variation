import 'package:asset_variation/feature/stock/history/data/data_source/stock_history_data_source_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Return list result', () async {
    final result = await StockHistoryDataSourceImpl().get();
    print(Right(result));
  });
}
