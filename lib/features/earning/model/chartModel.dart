import 'package:charts_flutter/flutter.dart' as charts;

class Model {
  final String day;
  final int  average;
  final charts.Color barColor;


  Model({required this.barColor, required this.average, required this.day});
}