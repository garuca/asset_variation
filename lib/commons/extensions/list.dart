import 'package:asset_variation/commons/extensions/double.dart';

extension ListCalcPercent on List<double>? {
  List<double?>? calcPercentFirstDay() {
    List<double?> list = [];
    if (this != null) {
      for (int i = 0; i < this!.length; i++) {
        if (i != 0) {
          list.add(this![i].calcPercent(this![0]));
        }else{
          list.add(null);
        }
      }
    }
    return list;
  }

  List<double?>? calcPercentDayMinusOne() {
    List<double?> list = [];
    if (this != null) {
      for (int i = 0; i < this!.length; i++) {
        if (i != 0) {
          list.add(this![i].calcPercent(this![i - 1]));
        } else {
          list.add(null);
        }
      }
    }
    return list;
  }
}
