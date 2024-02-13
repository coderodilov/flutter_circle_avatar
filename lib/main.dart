import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyPage()
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SizedBox(
          // Rasmga size berasiz
          width: 150.0,
          height: 150.0,
          child: ClipOval(
            clipper: MyOvalClipper(),
            child: SvgPicture.network(
              'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/UZ.svg',
              alignment: Alignment.bottomCenter,
              fit: BoxFit.cover,
              placeholderBuilder: (BuildContext context) =>
                  Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator()),
            ),
          ),
        )
      ),
    );
  }
}

class MyOvalClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // Rasmga berilgan size ni 3 dan birini yozasiz 150/50 qlib
    var rect = const Rect.fromLTWH(50, 50, 50.0, 50.0);
    return rect;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }

}


