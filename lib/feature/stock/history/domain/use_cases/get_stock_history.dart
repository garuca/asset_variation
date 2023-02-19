import 'package:asset_variation/feature/stock/history/domain/entities/stock_history.dart';
import 'package:asset_variation/feature/stock/history/domain/errors/errors.dart';
import 'package:asset_variation/feature/stock/history/domain/repositories/stock_history_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetStockHistory {
  Future<Either<Failure, StockHistory>> call();
}

class GetStockHistoryImpl implements GetStockHistory {
  final StockHistoryRepository repository;

  GetStockHistoryImpl(this.repository);

  @override
  Future<Either<Failure, StockHistory>> call() async {
    return repository.get();
  }
}
