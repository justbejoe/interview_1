import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interview_1/component/movie_tile.dart';
import 'package:interview_1/database/movie_data.dart';
import 'package:interview_1/model/movie_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final movieNameContoroller = TextEditingController();
  final directorNameContoroller = TextEditingController();
  XFile? image;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    Provider.of<MovieData>(context, listen: false).prepareData();
  }

  void addMovie() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Movie"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: movieNameContoroller,
              decoration: const InputDecoration(
                hintText: "Movie name",
              ),
            ),
            TextField(
              controller: directorNameContoroller,
              decoration: const InputDecoration(
                hintText: "Director name",
              ),
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: saveMovie,
            child: const Text("Save"),
          ),
          MaterialButton(
            onPressed: cancel,
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  // save movie
  void saveMovie() {
    if (movieNameContoroller.text.isNotEmpty &&
        directorNameContoroller.text.isNotEmpty) {
      // create new movie item
      MovieItem newMovie = MovieItem(
        name: movieNameContoroller.text,
        director: directorNameContoroller.text,
      );

      Provider.of<MovieData>(context, listen: false).addNewMovie(newMovie);
    }

    Navigator.pop(context);
    clear();
  }

  // clear
  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    movieNameContoroller.clear();
    directorNameContoroller.clear();
  }

  // delete movie
  void deleteMovie(MovieItem movie) {
    Provider.of<MovieData>(context, listen: false).deleteMovie(movie);
  }

  @override
  Widget build(BuildContext context) {
    // fix this code
    return Consumer<MovieData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text("Movies Watched"),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addMovie,
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: value.getAllMovies().length,
          itemBuilder: (context, index) => MovieTile(
            name: value.getAllMovies()[index].name,
            director: value.getAllMovies()[index].director,
            deleteTapped: (p0) => deleteMovie(value.getAllMovies()[index]),
          ),
        ),
      ),
    );
  }
}
