import 'package:flutter/material.dart';
import 'package:flutter_application_kmdb/movie_api.dart';
import 'package:flutter_application_kmdb/movie_form.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({
    super.key,
  });

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  var controller = TextEditingController();
  dynamic body = const Center(child: Text('검색하셈'));

  void searchMovie(String keyword) async {
    MovieAPi movieAPi = MovieAPi();
    var movies = movieAPi.search(keyword);

    setState(() {
      body = FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movieData = snapshot.data;
            return ListView.separated(
                itemBuilder: (context, index) {
                  return MovieForm(movie: movieData[index]);
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: movieData!.length);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );

      // body = ListView.separated(
      //     itemBuilder: (context, index) {
      //       return MovieForm(movie: movies[index]);
      //     },
      //     separatorBuilder: (context, index) => const Divider(),
      //     itemCount: movies.length);
    });
  }

  void showSearchPage() async {
    var result = await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        height: 200,
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
                label: const Text('닫기')),
            TextFormField(
              controller: controller,
            ),
            ElevatedButton(
                onPressed: () {
                  searchMovie(controller.text);
                  Navigator.pop(context);
                },
                child: const Text('검색하기'))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: showSearchPage,
        child: const Icon(Icons.search),
      ),
    );
  }
}
