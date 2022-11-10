import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/core/style/colors.dart';
import 'package:movieapp/features/movies/presentation/controllers/movies_state.dart';
import 'package:movieapp/features/movies/presentation/screens/movie_details_screen.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/enums_state.dart';
import '../controllers/movies_bloc.dart';

class NowPlayingComponent2 extends StatelessWidget {
  const NowPlayingComponent2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: ((previous, current) =>
      previous.nowPlayingState != current.nowPlayingState),
      builder: (context, state) {
        switch(state.nowPlayingState){
          case RequestState.loading:
            return const SizedBox(
              height: 500,
              child: Center(
                  child: SpinKitFadingCircle(
                    size: 90,
                    color: primaryColor,
                  ),
              ),
            );
          case RequestState.loaded:
            return Stack(
              children: [
                SizedBox(
                  //height: size.height - 80,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          FadeIn(
                            duration: const Duration(milliseconds: 500),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 500.0,
                                viewportFraction: 1.0,
                                onPageChanged: (index, reason) {},
                              ),
                              items: state.nowPlayingMovies.map((item) {
                                return Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    GestureDetector(
                                      key: const Key('openMovieMinimalDetail'),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MovieDetailScreen(id: item.id)),
                                        );
                                      },
                                      child: ShaderMask(
                                        shaderCallback: (rect) {
                                          return LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              // fromLTRB
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.85),
                                              Colors.black.withOpacity(0.85),
                                              Colors.transparent,
                                            ],
                                            stops: const [0, 0.1, 0.5, 1],
                                          ).createShader(
                                            Rect.fromLTRB(0, 0, rect.width, rect.height),
                                          );
                                        },
                                        blendMode: BlendMode.dstIn,

                                        child: CachedNetworkImage(
                                          height: 500.0,
                                          imageUrl: Constants.imageURL(item.backgroundPath),
                                          fit: BoxFit.cover,

                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 15),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //Image.asset('assets/images/title_banner.png'),
                                          Text(
                                              item.title,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.vampiroOne(
                                                  color: Colors.white,
                                                  fontSize: 24
                                              )
                                          ),
                                          Text(
                                            'TV Shows based on Books - Social Issues - Drama',
                                            style: GoogleFonts.poppins(
                                                fontSize: 11,
                                                color: Colors.white
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Icon(
                                  Icons.add,
                                  size: 25,
                                  color: Colors.white
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "My List",
                                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 13, left: 8, top: 2, bottom: 2),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Play",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.info_outline,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Info",
                                style: TextStyle(fontWeight: FontWeight.w600,                                    color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset('assets/images/logo.png', height: 35, fit: BoxFit.fitHeight,),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: (){},
                              icon: const Icon(
                                Icons.collections_bookmark,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Image.asset('assets/images/squid_game.jpg', height: 26, width: 26,),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'TV Shows',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          'Movies',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Categories',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            );
          case RequestState.error:
            return SizedBox(
              height: 500,
              child: Center(
                child: Lottie.asset(
                  'assets/images/json_no_connection.json',
                  width: 150,
                  repeat: false,
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
        }
      },
    );
  }
}
