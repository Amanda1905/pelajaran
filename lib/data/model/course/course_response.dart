class CourseResponseModel {
    final int? status;
    final String? message;
    final List<CourseData>? data;

    CourseResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory CourseResponseModel.fromJson(Map<String, dynamic> json) => CourseResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<CourseData>.from(json["data"]!.map((x) => CourseData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CourseData {
    final String? courseId;
    final String? majorName;
    final String? courseCategory;
    final String? courseName;
    final String? urlCover;
    final int? jumlahMateri;
    final int? jumlahDone;
    final int? progress;

    CourseData({
        this.courseId,
        this.majorName,
        this.courseCategory,
        this.courseName,
        this.urlCover,
        this.jumlahMateri,
        this.jumlahDone,
        this.progress,
    });

    factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
        courseId: json["course_id"],
        majorName: json["major_name"],
        courseCategory: json["course_category"],
        courseName: json["course_name"],
        urlCover: json["url_cover"],
        jumlahMateri: json["jumlah_materi"],
        jumlahDone: json["jumlah_done"],
        progress: json["progress"],
    );

    Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "major_name": majorName,
        "course_category": courseCategory,
        "course_name": courseName,
        "url_cover": urlCover,
        "jumlah_materi": jumlahMateri,
        "jumlah_done": jumlahDone,
        "progress": progress,
    };
}
