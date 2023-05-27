import 'package:flutter/material.dart';
import 'package:interview_1/database/hive_database.dart';
import 'package:interview_1/model/movie_item.dart';

class MovieData extends ChangeNotifier {
// list of all movies
  List<MovieItem> overallMovieList = [];

  // get movie list
  List<MovieItem> getAllMovies() {
    return overallMovieList;
  }

  // prepare data on startup
  final db = HiveDataBase();
  void prepareData() {
    if (db.readData().isNotEmpty) {
      overallMovieList = db.readData();
    }
  }

  // add new movie
  void addNewMovie(MovieItem newMovie) {
    overallMovieList.add(newMovie);

    notifyListeners();
    db.saveData(overallMovieList);
  }

  // delete movie
  void deleteMovie(MovieItem movie) {
    overallMovieList.remove(movie);

    notifyListeners();
    db.saveData(overallMovieList);
  }
}
