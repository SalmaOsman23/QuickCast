import 'package:flutter/material.dart';
import 'package:quick_cast/views/search_view.dart';
import 'package:quick_cast/widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchView();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: const NoWeatherBody(),
    );
  }
}
