class BBook {
  List<dynamic> bbo;
  // final String image_url;
  BBook({required this.bbo});

  factory BBook.fromJson(List<dynamic> json) => BBook(bbo: json);
}
