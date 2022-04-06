import 'package:flutter/material.dart';
import 'package:peliculas/theme/app_theme.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)!.settings.arguments.toString();
    final double width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
          child: CustomScrollView(
        slivers: [
          const _CustomAdppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage(
                          width: width * 0.33,
                          placeholder: const AssetImage('assets/loading.gif'),
                          image: const NetworkImage(
                              'https://via.placeholder.com/300x400')),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('movie.tittle', style: theme.headline5),
                      Text('movie.originalTittle', style: theme.subtitle1),
                      Row(
                        children: [
                          const Icon(Icons.star_border_outlined),
                          const SizedBox(width: 5),
                          Text('movie.average', style: theme.caption)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ]))
        ],
      )),
    );
  }
}

class _CustomAdppBar extends StatelessWidget {
  const _CustomAdppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SliverAppBar(
      backgroundColor: AppTheme.colorPrimary,
      expandedHeight: height * 0.23,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
            color: Colors.black12,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: const Text('Nombre')),
        background: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/500x500'),
            fit: BoxFit.cover),
      ),
    );
  }
}
