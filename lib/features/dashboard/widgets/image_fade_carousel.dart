import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:new_app/core/themes/colors.dart';

class ImageFadeCarousel extends StatefulWidget {
  const ImageFadeCarousel({super.key});

  @override
  State<ImageFadeCarousel> createState() => _ImageFadeCarouselState();
}

class _ImageFadeCarouselState extends State<ImageFadeCarousel> {
  final List<String> imageList = [
    "assets/images/temp/im1.jpg",
    "assets/images/temp/im2.jpg",
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % imageList.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).width / 2,
      child: Stack(
        children: imageList.asMap().entries.map(
          (entry) {
            int index = entry.key;
            String imageUrl = entry.value;

            return AnimatedOpacity(
              opacity: _currentIndex == index ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
