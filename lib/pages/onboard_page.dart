import 'package:flutter/material.dart';
import 'package:school_bus/data/onboard_data.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int _currentPage = 0;
  final _pageController = PageController();
  final _onboardData = OnboardData.onboardData;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _onboardData[index]["title"] ?? "",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text(
                        _onboardData[index]["subtitle"] ?? "",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      // Image.asset(
                      //   _onboardData[index]["image"] ?? "",
                      //   fit: BoxFit.cover,
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Back"),
              ),
              TextButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                child: Text("Next"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
