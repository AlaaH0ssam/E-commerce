import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:app/HomeScreen.dart';
import 'onboarding_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    final isOnboardingCompleted =
        await OnboardingService.isOnboardingCompleted();

    if (isOnboardingCompleted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = (index == 2);
              });
            },
            children: [
              _buildIntroPage(
                imagePath: '../assets/images/HomeF.png',
                text: 'Discover all you need in one place',
              ),
              _buildIntroPage(
                imagePath: '../assets/images/HomeF.png',
                text: 'Easy to navigate with the latest editions',
              ),
              _buildIntroPage(
                imagePath: '../assets/images/HomeF.png',
                text: 'Start your journey to make your dream house',
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Skip button
                ElevatedButton(
                  onPressed: () async {
                    await OnboardingService.setOnboardingCompleted();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: const Text('Skip'),
                ),

                // Dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                // Next or Done button
                isLastPage
                    ? ElevatedButton(
                        onPressed: () async {
                          await OnboardingService.setOnboardingCompleted();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        child: const Text('Done'),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text('Next'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroPage({required String imagePath, required String text}) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFEBEDEE), Color(0xFFDAE0E6)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 4,
                backgroundColor: Colors.grey,
              ),
              SizedBox(width: 8),
              CircleAvatar(
                radius: 4,
                backgroundColor: Colors.black,
              ),
              SizedBox(width: 8),
              CircleAvatar(
                radius: 4,
                backgroundColor: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
