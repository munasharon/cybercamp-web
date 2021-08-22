import 'package:flutter/material.dart';
import 'package:uccybercampweatherapp/api.dart';
import 'package:uccybercampweatherapp/json2dart.dart';

class WeatherInfo extends StatefulWidget {
  final String cityNames;
  const WeatherInfo({Key? key, required this.cityNames}) : super(key: key);

  get searchName => null;
 

  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  ApiService service = ApiService();
  var response;

  @override
  void initState() {
    super.initState();
    response = service.get(
      searchName: widget.searchName,
      appId: 'ac247619091df7350cee374d21f4755',
    );
  }
     
  @override
  Widget build(BuildContext context) {
      return FutureBuilder<dynamic>(
      future: response,
      initialData: DailyForecast.initialData(),
      builder: (context, snapshot) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder<dynamic>(builder: (context, snapshot) {
      var weatherInfo = DailyForecast.fromJson(snapshot.data);
      return Scaffold(
        appBar: AppBar(
          title: Text('Weather Info'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            
          final DailyForecast weatherData = DailyForecast.fromJson(snapshot.data);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple[800],
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.chevron_left_outlined,
                size: 46,
                    ),
            ),
          ),
            // first container
            Container(
              height: size.height / 2.5,
              width: size.width,
              color: Colors.cyan,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.ac_unit_rounded),
                  Text(''),
                ],
              ),
            ),
            // second container
            Container(
              height: size.height / 2,
              width: size.width,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  // Container three
                  Container(
                    height: (size.height / 2) / 1.5,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                  '${weatherInfo.name},${weatherInfo.country}'),
                              Text('min temp:,max temp'),
                            ],
                          ),
                        ),
                        Text('4'),
                      ],
                    ),
                  ),
                  // Container four
                  Container(
                    height: (size.height / 2) - (size.height / 2) / 1.5,
                    width: size.width,
                    color: Colors.blueAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bottomContainer(
                            color: Colors.redAccent,
                            attribute: 'Pressure',
                            attributeDigit: weatherInfo.pressure),
                        bottomContainer(
                            color: Colors.yellowAccent,
                            attribute: 'Wind Speed',
                            attributeDigit: weatherInfo.windSpeed),
                        bottomContainer(
                          color: Colors.lightGreenAccent,
                          attribute: 'Humidity',
                          attributeDigit: weatherInfo.humidity,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
              ),
        ),
      );
    });
  }

Widget: bottomContainerinitialData ({
    required Color color,
    required String attribute,
    required dynamic attributeDigit,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      color: color,
      child: Column(
        children: [
          Text('$attribute'),
          Text('$attributeDigit'),
        ],
      ),
    );
  });
  };
  )
}
