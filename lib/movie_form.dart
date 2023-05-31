import 'package:flutter/material.dart';

class MovieForm extends StatelessWidget {
  Map<String, dynamic> movie;

  MovieForm({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    print(movie);
    var directorNm = movie['directors']['director'][0]['directorNm'];
    var actorNm = movie['actors']['actor'][0]['actorNm'];
    var posters = movie['posters'].split('|')[0];

    return Container(
      height: 150,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 80,
            child: Image.network(posters),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${movie['title']}(${movie['prodYear']})',
                style: const TextStyle(fontSize: 20),
              ),
              Text('$directorNm/$actorNm'),
              Text('${movie['repRlsDate']}'),
              Text('${movie['audiAcc']}'),
              Text('${movie['rating']}'),
            ],
          ))
        ],
      ),
    );
  }
}
