import 'package:flutter/material.dart';
import 'package:uccybercampweatherapp/weatherinfo.dart';

class HomePage extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Muna\'s Weather App'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('images/CLOUDS.png'),
          ),
        ),
        child: Column(
          children: [
            Text(
              'Get Weather Informations on cities in the world',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.tealAccent[400],
                  labelText: ' Search City Name',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WeatherInfo(
                            cityNames: searchController.value.text,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.search_rounded),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
