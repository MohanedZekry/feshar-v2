class Constants{

  static const baseURL = 'https://api.themoviedb.org/3/';
  static const baseImageURL = 'https://image.tmdb.org/t/p/w500';
  static String imageURL(String path) => '$baseImageURL$path';

  // END POINTS PATH
  /* now_playing?api_key={API_KEY}&page=1 */
  static const MOVIE_NOW_PLAYING_EP = 'movie/now_playing';
  static const MOVIE_POPULAR_EP = 'movie/popular';
  static const MOVIE_TOP_RATED_EP = 'movie/top_rated';
  static const MOVIE_DETAILS_EP = 'movie';

}