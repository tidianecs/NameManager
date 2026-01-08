class Fakeapirepository {
  Future<List<String>> fetchNotes() async{
    await Future.delayed(Duration(seconds: 2));

    if (DateTime.now().millisecond % 3 == 0) {
      throw Exception("Server unreachable");
    }

    return [
      "Learning Flutter",
      "Make lot of project",
      "Review angular"
    ];
  }
}