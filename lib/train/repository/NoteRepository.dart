class Noterepository {
  List<String> notes = [];

  Future<List<String>> loadNotes() async{
    await Future.delayed(Duration(seconds: 1));

    notes = ["Learning Flutter", "Make lot of project", "Review angular"];
    print(notes);
    return notes;
  }

  void delNote(int index){
    print("${notes[index]} deleted");
    notes.removeAt(index);
  }
}