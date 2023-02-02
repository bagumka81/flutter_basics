import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(const MyApp());
}

final List<String> imgList = (!kIsWeb)
    ? [
        'https://github.com/googlefonts/noto-emoji/raw/main/svg/emoji_u002a_20e3.svg',
        'https://github.com/googlefonts/noto-emoji/raw/main/svg/emoji_u0030_20e3.svg',
        'https://github.com/googlefonts/noto-emoji/raw/main/svg/emoji_u0031_20e3.svg',
        'https://github.com/googlefonts/noto-emoji/raw/main/svg/emoji_u0032_20e3.svg',
        'https://github.com/googlefonts/noto-emoji/raw/main/svg/emoji_u0033_20e3.svg',
        'https://github.com/googlefonts/noto-emoji/raw/main/svg/emoji_u0034_20e3.svg',
      ]
    : [
        'svg/emoji_u002a_20e3.svg',
        'svg/emoji_u0030_20e3.svg',
        'svg/emoji_u0031_20e3.svg',
        'svg/emoji_u0032_20e3.svg',
        'svg/emoji_u0033_20e3.svg',
        'svg/emoji_u0034_20e3.svg',
      ];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter basic project',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: //const MyHomePage(title: 'Flutter Demo Home Page'),
          const FullscreenSliderDemo(),
    );
  }
}

class FullscreenSliderDemo extends StatelessWidget {
  const FullscreenSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Row(
        children: [
          SvgPicture.asset('assets/picture-svgrepo-com.svg'),
          const Text("Flutter svg demo"),
        ],
      )),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: SvgPicture.network(item,
                              fit: BoxFit.scaleDown, //BoxFit.cover,
                              height: height,
                              placeholderBuilder: (BuildContext context) =>
                                  Container(
                                      padding: const EdgeInsets.all(30.0),
                                      child:
                                          const CircularProgressIndicator()))),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
