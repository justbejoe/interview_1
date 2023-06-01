// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MovieTile extends StatelessWidget {
  final String name;
  final String director;
  final void Function(BuildContext)? deleteTapped;

  // XFile? image;

  MovieTile({
    Key? key,
    required this.name,
    required this.director,
    this.deleteTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          // delete button
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name),
        subtitle: Text(director),
      ),
    );
  }
}
