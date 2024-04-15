import 'package:uncanny_woods/models/data.dart';

class DataRepository{
 final _data = Data(prof: 0, bestScore: 1);

  get data => _data;
  set setScore(int i){
    _data.bestScore = i;
  }
  set setProf(int i){
    _data.prof = i;
  }
}