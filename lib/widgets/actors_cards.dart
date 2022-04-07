import 'package:flutter/material.dart';

class ActorsCard extends StatelessWidget {
  const ActorsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const ActorCard();
        },
      ),
    );
  }
}

class ActorCard extends StatelessWidget {
  const ActorCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: width * 0.25,
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/loading.gif'),
                  image: NetworkImage('https://via.placeholder.com/500x500')),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Nombre',
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: theme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
