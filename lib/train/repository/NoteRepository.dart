import 'package:first_training_mobile/train/repository/FakeApiRepository.dart';

class Noterepository {
  final Fakeapirepository? apiRepository;
  List<String> notes = [];

  Noterepository({this.apiRepository});

  Future<List<String>> loadNotes() async{
    notes = await apiRepository!.fetchNotes();
    print(notes);
    return notes;
  }

  void delNote(int index){
    print("${notes[index]} deleted");
    notes.removeAt(index);
  }
}