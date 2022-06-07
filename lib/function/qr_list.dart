class QRs {
  List<dynamic> qrs;
  // final String image_url;
  QRs({required this.qrs});

  factory QRs.fromJson(List<dynamic> json) => QRs(qrs: json);
}
