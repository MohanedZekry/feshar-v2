import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movieapp/features/movies/presentation/controllers/movies_bloc.dart';
import 'package:movieapp/features/movies/presentation/controllers/movies_state.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/enums_state.dart';
import '../screens/movie_details_screen.dart';

class UpcomingComponent extends StatelessWidget {
  const UpcomingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: ((previous, current) =>
        previous.upcomingState != current.upcomingState),
      builder: (context, state) {
        switch(state.upcomingState){
          case RequestState.loading:
            return const SizedBox(
              height: 150,
              child: Center(
                child: SpinKitFadingCircle(
                  size: 30,
                  color: primaryColor,
                ),
              ),
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
                  itemCount: state.upcomingMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.upcomingMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(id: movie.id)),
                          );
                        },
                        child: CircleAvatar(
                          radius: 65,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              width: 130.0,
                              height: 130.0,
                              fit: BoxFit.cover,
                              imageUrl: Constants.imageURL(movie.poster),
                              placeholder: (context, url) =>
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: const SizedBox(
                                      height: 130.0,
                                      width: 130.0,
                                    ),
                                  ),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                          ),
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
