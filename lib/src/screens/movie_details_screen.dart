import 'package:flutter/material.dart';
import 'package:netflix_clone_app/src/widgets/movies_scroll_list.dart';

import '../models/movie_model.dart';
import '../widgets/movie_image_banner_clipper.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movieData;

  MovieDetailsScreen(this.movieData);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              _buildMovieImageBanner(screenWidth, screenHeight),
              _buildPlayButton(context, screenWidth, screenHeight),
              _buildCustomAppBar(context),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    print('add icon pressed!');
                  },
                  icon: Icon(
                    Icons.add,
                    size: 30.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print('share icon pressed!');
                  },
                  icon: Icon(
                    Icons.share,
                    size: 30.0,
                  ),
                )
              ],
            ),
          ),
          Text(
            movieData.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Montserrat Bold',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            movieData.categories,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Montserrat',
              color: Colors.grey[700],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          _buildMovieInfoRow(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              movieData.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 13.0,
                fontFamily: 'Montserrat',
                color: Colors.grey[800],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
            child: MoviesScrollList(
              moviesList: movieData.screenshots,
              listTitle: 'Screenshots',
              openMoviesListCallback: _openScreenshotsListCallback,
            ),
          ),
        ],
      ),
    );
  }

  void _openScreenshotsListCallback() {
    print('open screenshots list pressed!');
    //TODO: implement when needed!!
  }

  Widget _buildMovieImageBanner(double screenWidth, double screenHeight) {
    return ClipPath(
      clipper: MovieImageBannerClipper(),
      child: Container(
        height: screenHeight * 0.5,
        width: screenWidth,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Hero(
          tag: movieData.imageUrl,
          child: Image(
            image: AssetImage(
              movieData.imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildPlayButton(context, double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth / 2 - 40,
      top: screenHeight / 2.3,
      child: GestureDetector(
        onTap: () {
          print('Play Button clicked');
        },
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 4.0,
                )
              ]),
          child: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.play_arrow,
              color: Colors.red,
              size: 50.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildAppBarIconButton(
          icon: Icons.arrow_back,
          leftPadding: 10.0,
          rightPadding: 0.0,
          onPressed: () {
            print('back pressed!');
            Navigator.of(context).pop();
          },
        ),
        Image(
          image: AssetImage(
            'assets/images/netflix_logo.png',
          ),
          width: 100,
        ),
        _buildAppBarIconButton(
          icon: Icons.favorite_border,
          leftPadding: 0.0,
          rightPadding: 10.0,
          onPressed: () {
            print('like pressed!');
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

  Widget _buildMovieInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'Year',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Montserrat',
                color: Colors.grey[700],
              ),
            ),
            Text(
              movieData.year.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              'Country',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Montserrat',
                color: Colors.grey[700],
              ),
            ),
            Text(
              movieData.country,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Montserra',
                color: Colors.black,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              'Length',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Montserrat',
                color: Colors.grey[700],
              ),
            ),
            Text(
              '${movieData.length.toString()}mins',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
