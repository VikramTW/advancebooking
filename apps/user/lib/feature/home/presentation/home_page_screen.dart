import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/di/locator.dart';
import 'package:user/feature/home/data/model/movie.dart';
import 'package:user/feature/home/presentation/home_bloc.dart';
import 'package:user/feature/home/presentation/home_page_state.dart';

import 'movie_horizontal_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageUI();
}

class HomePageUI extends State<HomePage> {
  HomeBloc bloc = HomeBloc(HomePageInitialState(), getIt.get());

  @override
  void initState() {
    bloc.getMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Welcome to BookShow"),
      ),
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomePageLoadingState:
                return const Text("Loading...");
              case HomePageSuccessState:
                return movieListWidget((state as HomePageSuccessState).movies);
              default:
                return noDataWidget();
            }
          }),
    );
  }

  Widget movieListWidget(List<Movie> movies) {
    return ListView(
      padding: const EdgeInsets.only(
          left: 30.0, right: 30.0, top: 10.0, bottom: 30.0),
      children: [
        Text("Find your favourite films..",
            style: Theme.of(context).textTheme.displayMedium),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 30),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                  icon: const Icon(Icons.search),
                  hintText: "Search for movies",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  enabledBorder: InputBorder.none),
            ),
          ),
        ),
        movieHorizontalList(context, "Now Playing", bloc.nowPlayingMovies),
        movieHorizontalList(context, "Popular Movies", bloc.nowPlayingMovies)
      ],
    );
  }

  Widget noDataWidget() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      margin: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const Text("No Data"),
          ElevatedButton(
              onPressed: () {
                bloc.getMovieList();
              },
              child: const Text("ReTry"))
        ],
      ),
    );
  }
}
