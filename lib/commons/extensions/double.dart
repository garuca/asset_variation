extension CalcPercent on double {
  double calcPercent(valueFinal) {
    return ((this * 100) / valueFinal - 100);
  }
  String percentFormat() {
    return "${toStringAsFixed(2)}%";
  }
}