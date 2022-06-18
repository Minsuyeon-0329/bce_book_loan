class Schedule {
  List<dynamic> sch;
  // final String image_url;
  Schedule({required this.sch});

  factory Schedule.fromJson(List<dynamic> json) => Schedule(sch: json);
}
