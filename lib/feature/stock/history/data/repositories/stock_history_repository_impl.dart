import 'package:asset_variation/feature/stock/history/data/data_source/stock_history_data_source.dart';
import 'package:asset_variation/feature/stock/history/domain/entities/stock_history.dart';
import 'package:asset_variation/feature/stock/history/domain/errors/errors.dart';
import 'package:asset_variation/feature/stock/history/domain/repositories/stock_history_repository.dart';
import 'package:dartz/dartz.dart';

class StockHistoryRepositoryImpl implements StockHistoryRepository {
  final StockHistoryDataSource dataSource;

  StockHistoryRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, StockHistory?>> get() async {
    final result = await dataSource.get();
    return result;
  }
}
