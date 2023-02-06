class DtoImages {
  List<DtoImage> assets;
  DtoImages({
    required this.assets,
  });
  factory DtoImages.fromJson(Map<String, dynamic> json) {
    // print(json);
    return DtoImages(
        assets: List<DtoImage>.from(json["assets"].map((x) => DtoImage.fromJson(x)))
    ) ;
  }
}

class DtoImage {
  String id;
  int w;
  int h;
  String p;
  DtoImage({
     required this.id,
     required this.w,
     required this.h,
     required this.p,
  });
  factory DtoImage.fromJson(Map<String, dynamic> json) {
    return DtoImage(id: json['id'],
        w: json['w'] ?? 0 ,
        h: json['h'] ?? 0,
        p: json['p'] ?? '');
  }
}
