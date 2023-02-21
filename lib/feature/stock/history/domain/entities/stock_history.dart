import 'package:asset_variation/commons/extensions/list.dart';
class StockHistory {
  List<double>? open;
  List<double?>? percentDayMinusOne;
  List<double?>? percentFirstDay;
  List<int>? timestamp;
  StockHistory({this.open, this.timestamp}){
    percentDayMinusOne = open.calcPercentDayMinusOne();
    percentFirstDay = open.calcPercentFirstDay();
  }
}
