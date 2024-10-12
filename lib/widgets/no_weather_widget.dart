import 'package:flutter/material.dart';

class NoWeatherWidget extends StatelessWidget {
  const NoWeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Start search for the weather',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          Text(
            'with the search icon 🔍',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ],
      ),
    );
  }
}
