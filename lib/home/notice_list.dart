class Notice {
  List<dynamic> not;
  // final String image_url;
  Notice({required this.not});

  factory Notice.fromJson(List<dynamic> json) => Notice(not: json);
}
