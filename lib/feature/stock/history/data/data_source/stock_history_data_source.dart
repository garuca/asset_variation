import 'package:asset_variation/feature/stock/history/domain/entities/stock_history.dart';
import 'package:asset_variation/feature/stock/history/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class StockHistoryDataSource {
  Future<Either<Failure, StockHistory?>?> get();
}
