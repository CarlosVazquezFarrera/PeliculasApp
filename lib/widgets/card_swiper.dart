import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 26),
      child: SizedBox(
        width: double.infinity,
        height: height * 0.6,
        child: Swiper(
          loop: false,
          itemCount: 10,
          viewportFraction: 0.8,
          scale: 0.9,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => {print("ghola")},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  fit: BoxFit.fill,
                  placeholder: AssetImage('assets/loading.gif'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
