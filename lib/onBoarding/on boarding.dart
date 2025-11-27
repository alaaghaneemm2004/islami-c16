import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import '../core/resources/AssetsManager.dart';
import '../ui/home/screen/home_screen.dart';

class obBoarding extends StatefulWidget {
  const obBoarding({super.key});

  @override
  State<obBoarding> createState() => _obBoardingState();
}

class _obBoardingState extends State<obBoarding> {
  PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> slides = [
    {
      "image": "assets/images/Frame 3.png",
      "text": "Welcome To Islami App"
    },
    {
      "image": "assets/images/Frame 3 (1).png",
      "text": '''Welcome To Islami App
      We Are Very Excited To Have You In Our Community'''
    },
    {
      "image": "assets/images/Frame 3 (2).png",
      "text": '''Reading the Quran
      Read, and your Lord is the Most Generous
      '''
    },
    {
      "image": "assets/images/Frame 3 (3).png",
      "text": '''Bearish
      Praise the name of your Lord, the Most High
      '''
    },
    {
      "image": "assets/images/Frame 3 (4).png",
      "text": '''Holy Quran Radio
      You can listen to the Holy Quran Radio through the application for free and easily
      '''
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(AssetsManager.islamiLogo),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: slides.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          slides[index]["image"]!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: height * 0.5,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        slides[index]["text"]!,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.goldColor),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                      foregroundColor: ColorManager.goldColor,
                  ),
                  onPressed: currentPage > 0
                      ? () {
                    _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                      : null,
                  child: Text("Back"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: ColorManager.goldColor,
                  ),
                  onPressed: () {
                    if (currentPage < slides.length - 1) {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  },
                  child: Text(currentPage == slides.length - 1 ? "Finish" : "Next"),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
