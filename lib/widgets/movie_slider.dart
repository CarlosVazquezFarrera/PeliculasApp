import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.3,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 8),
            child: Text('Populares'),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 15,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => const _Movie()),
          )
        ],
      ),
    );
  }
}

class _Movie extends StatelessWidget {
  const _Movie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        GestureDetector(
          onTap: () => {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage('https://via.placeholder.com/300x400')),
          ),
        ),
        const Text(
          'Elit est eu enim voluptate ad Lorem minim ',
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        )
      ]),
    );
  }
}
