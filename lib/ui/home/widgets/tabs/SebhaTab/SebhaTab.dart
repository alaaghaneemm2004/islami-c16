import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../../core/resources/AssetsManager.dart';
import '../../../../../core/resources/ColorManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  int index = 0;
  double angle = 0;

  List<String> tsabeh = [
    'الحمد لله',
    'الله اكبر',
    'سبحان الله'
  ];

  void _incrementCounter() {
    setState(() {
      count++;
      angle += pi / 12;

      if (count == 33) {
        count = 0;
        index++;
        if (index >= tsabeh.length) {
          index = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Image.asset('assets/images/sebha.png', fit: BoxFit.fill),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff202020),
                Colors.transparent,
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AssetsManager.islamiLogo,
                width: width * 0.75,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                style: TextStyle(
                  color: ColorManager.whiteColor,
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Image.asset('assets/images/Mask group.png', width: 73, height: 86),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: _incrementCounter,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: angle,
                      child: Image.asset('assets/images/SebhaBody 1.png'),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          tsabeh[index],
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: ColorManager.whiteColor,
                          ),
                        ),
                        Text(
                          '$count',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
