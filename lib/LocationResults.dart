class LocationResults {
  final List<LocationResult> results;

  LocationResults({this.results});

  factory LocationResults.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['results'] as List;
    List<LocationResult> listOfResults = list.map((i) => LocationResult.fromJson(i)).toList();

    return LocationResults(
      results: listOfResults,
    );
  }
}

class LocationResult {
  final Geometry geometry;
  final String formattedAddress;

  LocationResult({this.geometry, this.formattedAddress});

  factory LocationResult.fromJson(Map<String, dynamic> parsedJson){
    return LocationResult(
      geometry: Geometry.fromJson(parsedJson['geometry']),
      formattedAddress: parsedJson['formatted_address']
    );
  }
}

class Geometry {
  final Location location;

  Geometry({this.location});

  factory Geometry.fromJson(Map<String, dynamic> parsedJson){
    return Geometry(
      location: Location.fromJson(parsedJson['location']),
    );
  }

}

class Location {
  final double latitude;
  final double longitude;

  Location({this.latitude, this.longitude});

  factory Location.fromJson(Map<String, dynamic> parsedJson){
    return Location(
      latitude : parsedJson['lat'],
      longitude : parsedJson['lng'],
    );
  }
}