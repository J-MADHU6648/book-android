import 'package:shared_preferences/shared_preferences.dart';

class AddTheatreModel {
  List<String> tName = [];
  List<String> taddress = [];
  List<String> tplace = [];
  List<String> tstate = [];
  List<String> tpincode = [];
  List<String> tusername = [];
  List<String> tpassword = [];

  Future<void> CreateTheatre() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      tName = prefs.getStringList('tname') ?? [];
      taddress = prefs.getStringList('taddress') ?? [];
      tplace = prefs.getStringList('tplace') ?? [];
      tstate = prefs.getStringList('tstate') ?? [];
      tpincode = prefs.getStringList('tpincode') ?? [];
      tusername = prefs.getStringList('tusername') ?? [];
      tpassword = prefs.getStringList('tpassword') ?? [];
    } catch (e) {
      // Handle exceptions, such as SharedPreferences errors
      print('Error in createMovie: $e');
    }
  }

  Future<void> saveData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('tname', tName);
      prefs.setStringList('taddress', taddress);
      prefs.setStringList('tplace', tplace);
      prefs.setStringList('tstate', tstate);
      prefs.setStringList('tpincode', tpincode);
      prefs.setStringList('tusername', tusername);
      prefs.setStringList('tpassword', tpassword);
    } catch (e) {
      // Handle exceptions, such as SharedPreferences errors
      print('Error in saveData: $e');
    }
  }

  // Remove data at a specific index
  void removeDataAtIndex(int index) {
    tName.removeAt(index);
    taddress.removeAt(index);
    tplace.removeAt(index);
    tstate.removeAt(index);
    tpincode.removeAt(index);
    tusername.removeAt(index);
    tpassword.removeAt(index);
  }
}
