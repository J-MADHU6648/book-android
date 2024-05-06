import 'package:shared_preferences/shared_preferences.dart';

class AddMovieModel {
  List<String> movieName = [];
  List<String> cast = [];
  List<String> des = [];
  List<String> date = [];

  Future<void> createMovie() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      movieName = prefs.getStringList('movieName') ?? [];
      cast = prefs.getStringList('cast') ?? [];
      des = prefs.getStringList('des') ?? [];
      date = prefs.getStringList('date') ?? [];
    } catch (e) {
      // Handle exceptions, such as SharedPreferences errors
      print('Error in createMovie: $e');
    }
  }

  Future<void> saveData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('movieName', movieName);
      prefs.setStringList('cast', cast);
      prefs.setStringList('des', des);
      prefs.setStringList('date', date);
    } catch (e) {
      // Handle exceptions, such as SharedPreferences errors
      print('Error in saveData: $e');
    }
  }

  // Remove data at a specific index
  void removeDataAtIndex(int index) {
    movieName.removeAt(index);
    cast.removeAt(index);
    des.removeAt(index);
    date.removeAt(index);
  }
}
