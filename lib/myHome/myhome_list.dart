class HomeList {
  List<dynamic> home;
  // final String image_url;
  HomeList({required this.home});

  factory HomeList.fromJson(List<dynamic> json) => HomeList(home: json);
}
