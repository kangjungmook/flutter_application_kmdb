import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class MovieDetail extends StatelessWidget {
  Map<String, dynamic> movie;
  MovieDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var movieTitle = movie['title']
        .toString()
        .replaceAll(' !HS ', '')
        .replaceAll(' !HE ', '');
    var posters = movie['posters'].split('|')[0];
    return Scaffold(
      appBar: AppBar(title: const Text('영화상세 정보(${'movieTitle'})')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(movieTitle),
            Row(
              children: [
                Text(movie['keywords']),
                Hero(tag: movie['movieSeq'], child: Image.network(posters)),
              ],
            ),
            ReadMoreText(
              movie['plots']['plot'][0]['plotText'],
              colorClickableText: Colors.red,
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: '더보기',
              trimExpandedText: '숨기기',
              lessStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
              moreStyle: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
