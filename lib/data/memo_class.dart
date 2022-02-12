class Memo {
  String? title;
  String? memo;
  String? image;
  int? id;
  String? date;

  Memo({this.title, this.memo, this.image, this.id, this.date});

  factory Memo.fromDB(Map<String, dynamic> data) {
    return Memo(
      title: data["title"],
      memo: data["memo"],
      image: data["image"],
      id: data["id"],
      date: data["date"],
    );
  }

  Map<String,dynamic>toMap() {
    return {
      "title": this.title,
      "memo": this.memo,
      "image": this.image,
      "id": this.id,
      "date": this.date,
    };
  }
}
