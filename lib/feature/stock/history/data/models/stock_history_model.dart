import 'package:asset_variation/feature/stock/history/domain/entities/stock_history.dart';

class StockHistoryModel {
  Chart? chart;

  StockHistoryModel({this.chart});

  StockHistoryModel.fromJson(Map<String, dynamic> json) {
    chart = json['chart'] != null ? Chart.fromJson(json['chart']) : null;
  }

  StockHistory toStockHistory() {
    return StockHistory(
        open: chart?.result?[0].indicators?.quote?[0].open,
        timestamp: chart?.result?[0].timestamp);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chart != null) {
      data['chart'] = chart!.toJson();
    }
    return data;
  }
}

class Chart {
  List<Result>? result;
  dynamic error;

  Chart({this.result, this.error});

  Chart.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    return data;
  }
}

class Result {
  Meta? meta;
  List<int>? timestamp;
  Indicators? indicators;

  Result({this.meta, this.timestamp, this.indicators});

  Result.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    timestamp = json['timestamp'].cast<int>();
    indicators = json['indicators'] != null
        ? Indicators.fromJson(json['indicators'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['timestamp'] = timestamp;
    if (indicators != null) {
      data['indicators'] = indicators!.toJson();
    }
    return data;
  }
}

class Meta {
  String? currency;
  String? symbol;
  String? exchangeName;
  String? instrumentType;
  int? firstTradeDate;
  int? regularMarketTime;
  int? gmtOffset;
  String? timezone;
  String? exchangeTimezoneName;
  double? regularMarketPrice;
  double? chartPreviousClose;
  double? previousClose;
  int? scale;
  int? priceHint;
  CurrentTradingPeriod? currentTradingPeriod;
  List<List>? tradingPeriods;
  String? dataGranularity;
  String? range;
  List<String>? validRanges;

  Meta(
      {this.currency,
      this.symbol,
      this.exchangeName,
      this.instrumentType,
      this.firstTradeDate,
      this.regularMarketTime,
      this.gmtOffset,
      this.timezone,
      this.exchangeTimezoneName,
      this.regularMarketPrice,
      this.chartPreviousClose,
      this.previousClose,
      this.scale,
      this.priceHint,
      this.currentTradingPeriod,
      this.tradingPeriods,
      this.dataGranularity,
      this.range,
      this.validRanges});

  Meta.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    symbol = json['symbol'];
    exchangeName = json['exchangeName'];
    instrumentType = json['instrumentType'];
    firstTradeDate = json['firstTradeDate'];
    regularMarketTime = json['regularMarketTime'];
    gmtOffset = json['gmtoffset'];
    timezone = json['timezone'];
    exchangeTimezoneName = json['exchangeTimezoneName'];
    regularMarketPrice = json['regularMarketPrice'];
    chartPreviousClose = json['chartPreviousClose'];
    previousClose = json['previousClose'];
    scale = json['scale'];
    priceHint = json['priceHint'];
    currentTradingPeriod = json['currentTradingPeriod'] != null
        ? CurrentTradingPeriod.fromJson(json['currentTradingPeriod'])
        : null;
    dataGranularity = json['dataGranularity'];
    range = json['range'];
    validRanges = json['validRanges'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency'] = currency;
    data['symbol'] = symbol;
    data['exchangeName'] = exchangeName;
    data['instrumentType'] = instrumentType;
    data['firstTradeDate'] = firstTradeDate;
    data['regularMarketTime'] = regularMarketTime;
    data['gmtoffset'] = gmtOffset;
    data['timezone'] = timezone;
    data['exchangeTimezoneName'] = exchangeTimezoneName;
    data['regularMarketPrice'] = regularMarketPrice;
    data['chartPreviousClose'] = chartPreviousClose;
    data['previousClose'] = previousClose;
    data['scale'] = scale;
    data['priceHint'] = priceHint;
    if (currentTradingPeriod != null) {
      data['currentTradingPeriod'] = currentTradingPeriod!.toJson();
    }
    data['dataGranularity'] = dataGranularity;
    data['range'] = range;
    data['validRanges'] = validRanges;
    return data;
  }
}

class CurrentTradingPeriod {
  Pre? pre;
  Pre? regular;
  Pre? post;

  CurrentTradingPeriod({this.pre, this.regular, this.post});

  CurrentTradingPeriod.fromJson(Map<String, dynamic> json) {
    pre = json['pre'] != null ? Pre.fromJson(json['pre']) : null;
    regular = json['regular'] != null ? Pre.fromJson(json['regular']) : null;
    post = json['post'] != null ? Pre.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pre != null) {
      data['pre'] = pre!.toJson();
    }
    if (regular != null) {
      data['regular'] = regular!.toJson();
    }
    if (post != null) {
      data['post'] = post!.toJson();
    }
    return data;
  }
}

class Pre {
  String? timezone;
  int? start;
  int? end;
  int? gmtOffset;

  Pre({this.timezone, this.start, this.end, this.gmtOffset});

  Pre.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'];
    start = json['start'];
    end = json['end'];
    gmtOffset = json['gmtoffset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timezone'] = timezone;
    data['start'] = start;
    data['end'] = end;
    data['gmtoffset'] = gmtOffset;
    return data;
  }
}

class Indicators {
  List<Quote>? quote;

  Indicators({this.quote});

  Indicators.fromJson(Map<String, dynamic> json) {
    if (json['quote'] != null) {
      quote = <Quote>[];
      json['quote'].forEach((v) {
        quote!.add(Quote.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (quote != null) {
      data['quote'] = quote!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quote {
  List<double>? low;
  List<double>? open;
  List<double>? high;
  List<int>? volume;
  List<double>? close;

  Quote({this.low, this.open, this.high, this.volume, this.close});

  Quote.fromJson(Map<String, dynamic> json) {
    low = json['low'].cast<double>();
    open = json['open'].cast<double>();
    high = json['high'].cast<double>();
    volume = json['volume'].cast<int>();
    close = json['close'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['low'] = low;
    data['open'] = open;
    data['high'] = high;
    data['volume'] = volume;
    data['close'] = close;
    return data;
  }
}
