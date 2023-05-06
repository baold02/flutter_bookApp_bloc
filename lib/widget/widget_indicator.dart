import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/banner_model.dart';

class IndicatorWidget extends StatefulWidget {
  const IndicatorWidget({Key? key}) : super(key: key);

  @override
  State<IndicatorWidget> createState() => _IndicatorWidgetState();
}

class _IndicatorWidgetState extends State<IndicatorWidget> {
  final controller = CarouselController();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget buildImage(String urlImage, int index) => ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.network(urlImage, fit: BoxFit.cover));

    return   Column(
      children: [
        CarouselSlider.builder(
            carouselController: controller,
            itemCount: list.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = list[index].thumbnailUrl;
              return buildImage(urlImage, index);
            },
            options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) =>
                    setState(() => _selectedIndex = index))),
        const SizedBox(height: 10,),
        buildIndicator()
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    effect: const ExpandingDotsEffect(
        dotWidth: 10, dotHeight: 10, activeDotColor: Colors.orange),
    activeIndex: _selectedIndex,
    count: list.length,
  );

  void animateToSlide(int index) => controller.animateToPage(index);
}
