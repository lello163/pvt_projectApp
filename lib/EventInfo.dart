import 'dart:convert';
import 'package:pvt_project/TempAndSky.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pvt_project/profilepage.dart';
import 'package:pvt_project/profilepageview.dart';
import 'Activities.dart';
import 'WeatherData.dart';
import 'package:http/http.dart' as http;
import 'package:weather_icons/weather_icons.dart' as WeatherIcons;
import 'LocationResults.dart';


class EventInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _EventInfoState();
  }
}

class _EventInfoState extends State<EventInfo> {
  //SECTION OF VARIABLES
  String title = "Fika";
  String description = "Description of activity";
  String location = "Stockholm";
  var dateAndTime = new DateTime(2020, 5, 8, 8, 0);
  String testImage = "https://www.visitvarberg.se/images/18.803d73316e35ca147325f5a/1573027844136/g%C3%A4stis%20webb.jpg";
  Color buttonColor = Colors.blueGrey[300];
  WeatherData weatherData;
  TempAndSky tempAndSky;
  LocationResults locationResults;
  var forecastURL = 'https://opendata-download-metfcst.smhi.se/api/category/pmp3g/version/2/geotype/point/lon/18.072/lat/59.3247/data.json';
  var geocodeURL = "https://maps.googleapis.com/maps/api/geocode/json?address=Göteborg&key=AIzaSyCIYW5-ghM8mTSFRgJynHXXnz-bfKhgi_k";

//SECTION OF METHODS
  Future<LocationResults> fetchLocation() async {
    LocationResults results;
    var response = await http.get(geocodeURL);
    if(response.statusCode == 200){
      var dataJson = json.decode((response.body));
      results = new LocationResults.fromJson(dataJson);
    }
    return results;
  }

  Future<WeatherData> fetchWeatherData() async {
    WeatherData wd;
    var response = await http.get(forecastURL);
    if(response.statusCode == 200){
      var dataJson = json.decode(response.body);
      wd = new WeatherData.fromJson(dataJson);
    }
    return wd;
  }

  void updateForecastURL(){
    if(locationResults != null){
      String long = locationResults.results[0].geometry.location.longitude.toString();
      String lat = locationResults.results[0].geometry.location.latitude.toString();
      if(lat.length > 9){
        lat = lat.substring(0,9);
      }
      if(long.length > 9){
        long = long.substring(0,9);
        print(long);
      }
      forecastURL = 'https://opendata-download-metfcst.smhi.se/api/category/pmp3g/version/2/geotype/point/lon/' + long +'/lat/' + lat + '/data.json';
    }
  }

  void getForecast(){
    DateTime lastAvailableForecastDate = DateTime.parse(weatherData.timeSeries[weatherData.timeSeries.length-1].validTime.replaceFirst('T', ' '));
    if(!dateAndTime.isAfter(lastAvailableForecastDate)){
      List<Duration> diff = new List<Duration>();
      for(int i = 0; i < weatherData.timeSeries.length; i++){
        //Retrieve and format time from JSON
        String stringTime = weatherData.timeSeries[i].validTime.replaceFirst('T', ' ');
        DateTime time = DateTime.parse(stringTime);
        diff.add(dateAndTime.difference(time));
      }
      //Find the smallest difference
      var smallestDifference = diff[0];
      Duration zero = new Duration();
      for(int i = 0; i < diff.length ; i++){
        if(diff[i].abs() < smallestDifference){
          smallestDifference = diff[i];
        }
      }
      int location = diff.indexOf(smallestDifference);
      tempAndSky = new TempAndSky(weatherData.timeSeries[location].parameters[1].values[0], weatherData.timeSeries[location].parameters[18].values[0]);
    }
  }

  @override
  void initState() {
    fetchLocation().then((value){
      setState(() {
        locationResults = value;
        updateForecastURL();
        fetchWeatherData().then((value){
          setState(() {
            weatherData = value;
            getForecast();
          });
        });
      });
    });
    super.initState();
  }
//MAIN BUILD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Title"),
        actions: <Widget>[
          weatherInfo(context),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 15.0),
              child: imageBox(context, testImage) ,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: dateAndTimeRow(context),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: locationRow(context, location),
            ),
            descriptionBox(context, description),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: button(context, "Go to group chat"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: button(context, "Schedule"),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: button(context, "Unregister from activity")
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomMenu(context),
    );
  }

  //SECTION OF WIDGETS
  Widget weatherIcon(BuildContext context) {
    switch(tempAndSky.getSky()){
      case Sky.SUN:
        return Icon(
          WeatherIcons.WeatherIcons.day_sunny
        );
        break;
      case Sky.PARTIAL_CLOUD:
        return Icon(
            WeatherIcons.WeatherIcons.day_sunny_overcast
        );
        break;
      case Sky.CLOUD:
        return Icon(
            WeatherIcons.WeatherIcons.cloud
        );
        break;
      case Sky.RAIN:
        return Icon(
            WeatherIcons.WeatherIcons.day_rain
        );
        break;
      case Sky.SNOW:
        return Icon(
            WeatherIcons.WeatherIcons.day_snow
        );
        break;
      case Sky.SLEET:
        return Icon(
            WeatherIcons.WeatherIcons.day_sleet
        );
        break;
      case Sky.FOG:
        return Icon(
            WeatherIcons.WeatherIcons.day_fog
        );
        break;
    }
    return Icon(
        WeatherIcons.WeatherIcons.day_sunny
    );
  }

  Widget weatherInfo(BuildContext context){
    if(tempAndSky != null){
        return Container(
          child: Row(
            children: <Widget>[
              weatherIcon(context),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(tempAndSky.temp.toString() + " C"),
              )
            ],
          ),
        );
    } else {
      return Container(
        child: Row(
          children: <Widget>[
            Icon(
              Icons.remove_circle_outline,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("- C"),
            )
          ],
        ),
      );
    }
  }

  Widget imageBox(BuildContext context, String imageAddress){
    return Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
        ),
        child: Image(image: NetworkImage(imageAddress), width: 300, height: 300)
    );
  }

  Widget button(BuildContext context, String text){
    return Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text, style: TextStyle(
            fontWeight: FontWeight.bold,
          )),
        )
    );
  }
  
  Widget dateAndTimeRow(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 82,
          height: 22,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1)
          ),
          child: Center(child: Text(dateAndTime.day.toString() + "/" + dateAndTime.month.toString() + "/" + dateAndTime.year.toString())),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Icon(
            Icons.calendar_today,
            size: 30.0,
            color: Colors.black,
          ),
        ),
        Container(
          width: 134,
          height: 20,
          decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.black),
              )
          ),
          child: Text(dateAndTime.hour.toString() + ":" + dateAndTime.minute.toString()),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.access_time,
            color: Colors.black,
            size: 30,
          ),
        )

      ],
    );
  }
  
  Widget bottomMenu(BuildContext context){
    return BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.black,
              iconSize: 30,
               onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
            ),
            IconButton(
              icon: Icon(Icons.message),
              color: Colors.black,
              iconSize: 30,
              onPressed: (){
                print("MESSAGE PAGE");
              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              color: Colors.blue[700],
              iconSize: 30,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Activities()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.location_on),
              color: Colors.black,
              iconSize: 30,
              onPressed: (){
                print("MAP PAGE");
              },
            ),
          ],
        )
    );
  }

  Widget descriptionBox(BuildContext context, String description){
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(description, style: TextStyle(
          fontSize: 18,
        )),
      ),
    );
  }
  
  Widget locationRow(BuildContext context, String location){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
            Icons.location_on,
            color: Colors.black,
            size: 30.0
        ),
        Container(
            height: 24,
            width: 270,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black)
                )
            ),
            child: Text(location, style: TextStyle(
              fontSize: 20,
            )
            )
        )
      ],
    );
  }
}