import 'package:flutter/material.dart';
import 'package:school_bus/data/onboard_data.dart';
import 'package:school_bus/pages/home_page.dart';
import 'package:school_bus/widgets/elevated_button.dart';

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
        mainAxisSize: MainAxisSize.min,
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
                return Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          _onboardData[index]["title"] ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(height: 28),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            _onboardData[index]["subtitle"] ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[700]),
                          ),
                        ),
                        // SizedBox(height: 28),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            _onboardData[index]["image"] ?? "",
                            // fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.95,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TheElevatedButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    curve: Curves.easeIn,
                  );
                },
                buttonText: "Back",
              ),
              Row(
                  children: List.generate(
                _onboardData.length,
                (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 12,
                    width: _currentPage == index ? 24 : 12,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.blue
                          : Colors.grey[400],
                      borderRadius: BorderRadius.circular(6),
                    ),
                  );
                },
              )),
              _currentPage == _onboardData.length - 1
                  ? TheElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      buttonText: "Get Started",
                    )
                  : TheElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          curve: Curves.easeIn,
                        );
                      },
                      buttonText: "Next",
                    )
            ],
          )
        ],
      ),
    );
  }
}
