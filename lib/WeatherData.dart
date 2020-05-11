class WeatherData {
  final String approvedTime;
  final String referenceTime;
  final List<WeatherHour> timeSeries;

  WeatherData({this.approvedTime, this.referenceTime, this.timeSeries});

  factory WeatherData.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['timeSeries'] as List;
    List<WeatherHour> weatherHoursList = list.map((i) => WeatherHour.fromJson(i)).toList();

    return WeatherData(
      approvedTime: parsedJson['approvedTime'],
      referenceTime: parsedJson ['referenceTime'],
      timeSeries: weatherHoursList
    );
  }
}

class WeatherHour {
  final String validTime;
  final List<Parameters> parameters;

  WeatherHour({this.validTime, this.parameters});

  factory WeatherHour.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['parameters'] as List;
    List<Parameters> parametersList = list.map((i) => Parameters.fromJson(i)).toList();

    return WeatherHour(
      validTime: parsedJson['validTime'],
      parameters: parametersList
    );
  }
}

class Parameters {
  final String name;
  final String unit;
  final List values;

  Parameters({this.name, this.unit, this.values});

  factory Parameters.fromJson(Map<String, dynamic> parsedJson){

    return Parameters(
        name: parsedJson['name'],
        unit: parsedJson['unit'],
        values: parsedJson['values'],
    );
  }
}

