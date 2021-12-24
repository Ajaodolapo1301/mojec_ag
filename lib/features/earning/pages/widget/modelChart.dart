import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mojec_agent/features/earning/model/chartModel.dart';
class ModelChart extends StatelessWidget {

  final List<Model> data;

  ModelChart({required this.data});
  @override
  Widget build(BuildContext context) {

    List<charts.Series<Model, String>> series =
    [
      charts.Series(
        id: 'weekly',
        data: data,
        domainFn: (Model series, _ ) => series.day,
        measureFn: (Model series, _)=> series.average,
        colorFn: (Model series, _)=> series.barColor
      )
    ];
    return Container(
      height: 200,
      child: Column(
        children: <Widget>[
          Expanded(
            child: charts.BarChart(series, animate: true,),
          )
        ],
      ),
    );
  }
}
