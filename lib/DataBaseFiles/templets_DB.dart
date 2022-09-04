class SQL {
  late int logged;
  SQL({required this.logged});

  Map<String, dynamic> toMap() {
    return {
      'id': 01,
      'logged': bool,
    };
  }

  String toString() {
    return 'SQL{id : 01, logged: $logged}';
  }
}
