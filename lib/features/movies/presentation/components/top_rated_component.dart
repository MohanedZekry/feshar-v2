import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/enums_state.dart';
import '../controllers/movies_bloc.dart';
import '../controllers/movies_state.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: ((previous, current) =>
        previous.topRatedState != current.topRatedState),
      builder: (context, state) {
        switch(state.topRatedState){
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
                  itemCount: state.topRatedMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.fill,
                          imageUrl: Constants.imageURL(movie.poster),
                          placeholder: (context, url) =>
                              Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: const SizedBox(
                                  height: 170.0,
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
