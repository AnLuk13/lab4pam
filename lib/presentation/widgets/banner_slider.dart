import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../domain/entities/banner_entity.dart';
import 'specialist_banner.dart';

class BannerSlider extends StatefulWidget {
  final List<BannerEntity> banners;

  BannerSlider({required this.banners});

  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    startAutoPlay();
  }

  void startAutoPlay() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        if (_currentPage < widget.banners.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void stopAutoPlay() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          onPanDown: (details) => stopAutoPlay(),
          onPanEnd: (details) => startAutoPlay(),
          child: SizedBox(
            height: 150,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.banners.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                var banner = widget.banners[index];
                return SpecialistBanner(
                  title: banner.title,
                  subtitle: banner.description, // Assuming subtitle is in description
                  imagePath: banner.image,
                  backgroundColor: Colors.black.withOpacity(0.5), // Use a semi-transparent overlay
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: widget.banners.length,
            effect: WormEffect(
              activeDotColor: Colors.white,
              dotColor: Colors.white.withOpacity(0.5),
              dotHeight: 8,
              dotWidth: 8,
              spacing: 16,
            ),
          ),
        ),
      ],
    );
  }
}
