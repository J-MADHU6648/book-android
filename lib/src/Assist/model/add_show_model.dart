import 'package:shared_preferences/shared_preferences.dart';

class AddShowModel {
  List<String> addMovie = [];
  List<String> AddScreen = [];
  List<String> AddShowTime = [];
  List<String> AddStartDate = [];

  Future<void> AddShow() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      addMovie = prefs.getStringList('addMovie') ?? [];
      AddScreen = prefs.getStringList('AddScreen') ?? [];
      AddShowTime = prefs.getStringList('AddShowTime') ?? [];
      AddStartDate = prefs.getStringList('AddStartDate') ?? [];
    } catch (e) {
      // Handle exceptions, such as SharedPreferences errors
      print('Error in createMovie: $e');
    }
  }

  Future<void> saveData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('addMovie', addMovie);
      prefs.setStringList('AddScreen', AddScreen);
      prefs.setStringList('AddShowTime', AddShowTime);
      prefs.setStringList('AddStartDate', AddStartDate);
    } catch (e) {
      // Handle exceptions, such as SharedPreferences errors
      print('Error in saveData: $e');
    }
  }

  // Remove data at a specific index
  void removeDataAtIndex(int index) {
    addMovie.removeAt(index);
    AddScreen.removeAt(index);
    AddShowTime.removeAt(index);
    AddStartDate.removeAt(index);
  }
}
