import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/movies/presentation/controllers/movies_bloc.dart';
import 'package:movieapp/features/movies/presentation/controllers/movies_state.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/enums_state.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: ((previous, current) =>
        previous.popularState != current.popularState),
      builder: (context, state) {
        switch(state.popularState){
          case RequestState.loading:
            return const SizedBox(
                height: 170,
                child:  Center(child: CircularProgressIndicator())
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 150.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                        },
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.fill,
                          imageUrl: Constants.imageURL(movie.poster),
                          placeholder: (context, url) =>
                              Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: const SizedBox(
                                  height: 150.0,
                                  width: 120.0,
                                ),
                              ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
