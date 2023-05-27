import 'package:hive_flutter/hive_flutter.dart';

import '../model/movie_item.dart';

class HiveDataBase {
  final _myBox = Hive.box("movie_database");

  // write data
  void saveData(List<MovieItem> allMovie) {
    List<List<dynamic>> allMoviesFormatted = [];

    /*

    allMovie = 
    [
      MovieItem (name, director)
      ..
    ]

    ->

    [
      [name, director]
      ..
    ]
     */

    for (var movie in allMovie) {
      List<dynamic> movieFormatted = [movie.name, movie.director];
      allMoviesFormatted.add(movieFormatted);
    }

    _myBox.put("ALL_MOVIES", allMoviesFormatted);
  }

  // read data
  List<MovieItem> readData() {
    /*
    savedData = 
    [
      [name, director], i
      ..
    ]

    ->

    [
      MovieItem (name, director),
      ..
    ]
    
     */
    List savedMovies = _myBox.get("ALL_MOVIES") ?? [];
    List<MovieItem> allMovies = [];

    for (var i = 0; i < savedMovies.length; i++) {
      String name = savedMovies[i][0];
      String director = savedMovies[i][1];

      MovieItem movie = MovieItem(
        name: name,
        director: director,
      );

      allMovies.add(movie);
    }
    return allMovies;
  }
}
