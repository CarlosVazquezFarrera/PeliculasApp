import 'package:flutter/material.dart';
import 'package:peliculas/theme/app_theme.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      body: Center(
          child: CustomScrollView(
        slivers: [
          const _CustomAdppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            const _InfoAndPoster(),
            const _OverView(),
            const _OverView(),
            const _OverView(),
            const _OverView(),
            const ActorsCard()
          ]))
        ],
      )),
    );
  }
}

class _InfoAndPoster extends StatelessWidget {
  const _InfoAndPoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).textTheme;

    return Padding(
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
            padding: const EdgeInsets.only(bottom: 15),
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

class _OverView extends StatelessWidget {
  const _OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const Text(
        'Aute ullamco eu eu sunt quis elit aliqua dolor. Ea fugiat eiusmod aliquip qui ea sint nisi occaecat pariatur ad reprehenderit. Culpa anim nostrud consequat tempor qui aliquip adipisicing veniam excepteur ipsum eu occaecat nostrud.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
