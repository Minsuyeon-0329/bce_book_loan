class Books{
  List<dynamic> books;
  // final String image_url;
  Books({
    required this.books});

  factory Books.fromJson(List<dynamic> json) => Books(books: json);


}

