import 'package:flutter/material.dart';
import 'package:kl71/screens/home/view/home.dart';

class OnboardingPage1 extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const OnboardingPage1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green, Colors.black],
          ),
        ),
        child: const _OnboardingPageView(
          pages: [
            _OnboardingPage(
              text: 'Welcome to KL71',
              nextPageRoute: OnboardingPage2(),
            ),
            _OnboardingPage(
              text: 'Page 2',
              isLastPage: true,
              nextPageRoute: HomePage(),
              showSignInButton: true,
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage2 extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const OnboardingPage2({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.green],
          ),
        ),
        child: const _OnboardingPageView(
          pages: [
            _OnboardingPage(
              text: 'Page 2',
              previousPageRoute: OnboardingPage1(),
              nextPageRoute: HomePage(),
              showSignInButton: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPageView extends StatefulWidget {
  final List<Widget> pages;

  const _OnboardingPageView({required this.pages});

  @override
  _OnboardingPageViewState createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<_OnboardingPageView> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: widget.pages,
        ),
        Positioned(
          bottom: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.pages.length,
              (index) => _buildDotIndicator(index),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: ElevatedButton(
            onPressed: () {
              if (_currentPageIndex < widget.pages.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
            },
            child: Text(
              _currentPageIndex < widget.pages.length - 1 ? 'Next' : 'Skip',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDotIndicator(int index) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _currentPageIndex ? Colors.green : Colors.black,
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final String text;
  final bool isLastPage;
  final Widget? previousPageRoute;
  final Widget? nextPageRoute;
  final bool showSignInButton;

  const _OnboardingPage({
    required this.text,
    this.isLastPage = false,
    this.previousPageRoute,
    this.nextPageRoute,
    this.showSignInButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedText(
            text: text,
          ),
          const SizedBox(height: 20),
          if (showSignInButton)
            ElevatedButton(
              onPressed: () {
                // Add your sign-in logic here
              },
              child: const Text('Sign In'),
            ),
        ],
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  final String text;

  const AnimatedText({Key? key, required this.text}) : super(key: key);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Text(
        widget.text,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
