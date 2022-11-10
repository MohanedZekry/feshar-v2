import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/core/services/services_locator.dart';
import 'package:movieapp/core/style/colors.dart';
import 'package:movieapp/features/movies/presentation/components/now_playing_componenet_v2.dart';
import 'package:movieapp/features/movies/presentation/components/upcoming_component.dart';
import 'package:movieapp/features/movies/presentation/controllers/movies_bloc.dart';
import 'package:movieapp/features/movies/presentation/controllers/movies_event.dart';
import '../components/popular_component.dart';
import '../components/top_rated_component.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetNowPlayingMovieEvent())
        ..add(GetPopularMovieEvent())..add(GetTopRatedMovieEvent())
        ..add(GetTrendingMovieEvent()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video),
                label: 'Soon',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download),
                label: 'Downloads',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'More',
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const NowPlayingComponent2(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Previews",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('See More',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const UpcomingComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular on Feshar",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('See More',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PopularComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    0.0,
                    16.0,
                    8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Rated",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 0.15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('See More',
                                style: GoogleFonts.poppins(
                                    color: Colors.white
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TopRatedComponent(),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
