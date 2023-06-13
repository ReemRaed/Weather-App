class weatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  // String weatherStateName;

  weatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
  });

  factory weatherModel.fromJson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];
    return weatherModel(
        date: data['location']['localtime'],
        temp: jsondata['avgtemp_c'],
        maxTemp: jsondata['maxtemp_c'],
        minTemp: jsondata['maxtemp_c']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'Date = $date temp=$temp maxtemp=$maxTemp ';
  }
}
