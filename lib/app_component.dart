import 'dart:html';
import 'dart:math';
import 'package:angular/angular.dart';
import 'package:chartjs/chartjs.dart';

@Component(
  selector: 'my-app',
  template: '''
    <h1>Hello {{name}}</h1>
    <div style="width:500px;height: 400px;">
        <canvas #myCanvas id="canvas"></canvas>
    </div>
  ''',
)
class AppComponent implements AfterViewInit{
  var name = 'ChartJS';

  @ViewChild('myCanvas')
  HtmlElement canvas;
  
  final rnd = Random();
  final months = <String>[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June"
  ];

  @override
  void ngAfterViewInit() {
    var data = LinearChartData(
      labels: months,
      datasets: <ChartDataSets>[
        ChartDataSets(
          label: "My First dataset",
          backgroundColor: "rgba(220,220,220,0.2)",
          data: months.map((_) => rnd.nextInt(100)).toList(),
        ),
        ChartDataSets(
          label: "My Second dataset",
          backgroundColor: "rgba(151,187,205,0.2)",
          data: months.map((_) => rnd.nextInt(100)).toList(),
        )
      ],
    );

    var config = ChartConfiguration(
      type: 'line',
      data: data,
      options: ChartOptions(responsive: true),
    );

    var _ = Chart(canvas, config);
  }
}
