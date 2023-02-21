import 'dart:convert';

import 'package:asset_variation/feature/stock/history/data/data_source/stock_history_data_source.dart';
import 'package:asset_variation/feature/stock/history/data/models/stock_history_model.dart';
import 'package:asset_variation/feature/stock/history/domain/entities/stock_history.dart';
import 'package:asset_variation/feature/stock/history/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class StockHistoryDataSourceImpl implements StockHistoryDataSource {
  StockHistoryDataSourceImpl();

  @override
  Future<Either<Failure, StockHistory?>> get() async {
    const String baseUrl = "query2.finance.yahoo.com";
    const String apiComplement = "v8/finance/chart/PETR4.SA";
    try {
      http.Response response =
          await http.get(Uri.https(baseUrl, apiComplement, {
        "interval": "1d",
        "range": "30d",
      }));
      print(Uri.https(baseUrl, apiComplement, {
        "interval": "1d",
        "range": "30d",
      }));
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        return Right(StockHistoryModel.fromJson(decoded).toStockHistory());
      } else {
        return Left(
            Error(jsonDecode(response.body)["chart"]["error"]["description"]));
      }
    } catch (e) {
      return Left(Error(e.toString()));
    }
  }
}
