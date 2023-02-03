import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wild_movies_flutter/core/blocs/home_bloc/home_bloc.dart';
import 'package:wild_movies_flutter/gui/widgets/header_text_widget.dart';
import 'package:wild_movies_flutter/gui/widgets/item_recomendations_widget.dart';

class RecomendationsSection extends StatelessWidget {
  const RecomendationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderTextWidget(text: 'Recomendaciones'),
            const SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: state.popularesMovies!.results!.length,
              itemBuilder: (context, index) {
                return ItemRecomendations(movie: state.popularesMovies!.results![index],);
              }
            )
          ],
        );
      },
    );
  }
}
