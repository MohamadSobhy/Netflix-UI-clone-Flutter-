import 'package:flutter/material.dart';
import 'package:netflix_clone_app/src/models/movie_model.dart';

import '../widgets/movie_selector_card.dart';
import '../widgets/movies_scroll_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildCustomAppBar(),
      body: _biuldHomeScreenBody(),
    );
  }

  PreferredSizeWidget _buildCustomAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Image.asset('assets/images/netflix_logo.png'),
      centerTitle: true,
      elevation: 0.0,
      leading: _buildAppBarIconButton(
        icon: Icons.menu,
        leftPadding: 10.0,
        rightPadding: 0.0,
        onPressed: () {
          print('Menu pressed!');
        },
      ),
      actions: <Widget>[
        _buildAppBarIconButton(
          icon: Icons.search,
          leftPadding: 0.0,
          rightPadding: 10.0,
          onPressed: () {
            print('Search pressed!');
          },
        ),
      ],
    );
  }

  Widget _buildAppBarIconButton(
      {IconData icon,
      double leftPadding,
      double rightPadding,
      Function() onPressed}) {
    return IconButton(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 30,
        color: Colors.black,
      ),
    );
  }

  Widget _biuldHomeScreenBody() {
    return ListView(
      children: <Widget>[
        _buildMovieSelector(),
        _buildCategoriesList(),
        SizedBox(
          height: 20.0,
        ),
        MoviesScrollList(
          moviesList: myList,
          listTitle: 'My List',
          openMoviesListCallback: _openMyFavouriteMoviesList,
        ),
        SizedBox(
          height: 20.0,
        ),
        MoviesScrollList(
          moviesList: popularList,
          listTitle: 'Popular on Netflix',
          openMoviesListCallback: _openPopularMoviesList,
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  void _openMyFavouriteMoviesList() {}

  void _openPopularMoviesList() {}

  Widget _buildMovieSelector() {
    return Container(
      height: 230.0,
      width: double.infinity,
      child: PageView.builder(
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieSelectorCard(movies[index], _pageController, index);
        },
      ),
    );
  }

  Widget _buildCategoriesList() {
    return Container(
      height: 90.0,
      child: ListView.builder(
        itemCount: labels.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 130,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFD45253),
                  Color(0xFF9E1F28),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                labels[index].toUpperCase(),
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
