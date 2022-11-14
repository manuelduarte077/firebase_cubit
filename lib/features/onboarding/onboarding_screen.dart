import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:page_indicator/page_indicator.dart';

// Replace with your client id
final googleClientId = kIsWeb || Platform.isAndroid
    ? 'your-android-and-web-client-id'
    : 'your-ios-client-id';

// Replace with your client id
const facebookClientId = 'your-facebook-client-id';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: _IntroPager(),
    );
  }
}

class _IntroPager extends StatelessWidget {
  final String exampleText =
      'Lorem ipsum dolor sit amet, consecrated advising elit, '
      'sed do eiusmod tempor incididunt ut labore et '
      'dolore magna aliqua. Ut enim ad minim veniam.';

  @override
  Widget build(BuildContext context) {
    return PageIndicatorContainer(
      length: 4,
      indicatorSpace: 10,
      indicatorColor: Colors.indigo,
      indicatorSelectorColor: Colors.indigoAccent,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: PageView(
        children: [
          _DescriptionPage(
            text: exampleText,
            imagePath: 'assets/intro_1.png',
          ),
          _DescriptionPage(
            text: exampleText,
            imagePath: 'assets/intro_2.png',
          ),
          _DescriptionPage(
            text: exampleText,
            imagePath: 'assets/intro_3.png',
          ),
          _LoginPage(),
        ],
      ),
    );
  }
}

class _DescriptionPage extends StatelessWidget {
  const _DescriptionPage({
    required this.text,
    required this.imagePath,
  });

  final String text;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providerConfigs: [
        GoogleProviderConfiguration(clientId: googleClientId),
        const FacebookProviderConfiguration(clientId: facebookClientId),
        const EmailProviderConfiguration(),
      ],
    );
  }
}
