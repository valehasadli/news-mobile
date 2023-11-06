import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Aggregator'),
      ),
      body: Center(  // This will center the child widget on the screen
        child: Text(
          'Welcome to the News Aggregator App!', // The text you want to display
          style: Theme.of(context).textTheme.headline4, // Optional: Applying a text theme
          textAlign: TextAlign.center, // Optional: Centering the text inside the Text widget
        ),
      ),
    );
  }
}
