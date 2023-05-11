class groupmodel {
  String? responseCode;
  String? message;
  String? status;
  List<Data>? data;

  groupmodel({this.responseCode, this.message, this.status, this.data});

  groupmodel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? title;
  String? pincode;
  String? image;
  String? status;
  String? description;
  String? createdDate;
  String? video;
  String? totalUser;

  Data(
      {this.id,
      this.name,
      this.title,
      this.pincode,
      this.image,
      this.status,
      this.description,
      this.createdDate,
      this.video,
      this.totalUser});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    pincode = json['pincode'];
    image = json['image'];
    status = json['status'];
    description = json['description'];
    createdDate = json['created_date'];
    video = json['video'];
    totalUser = json['total_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['pincode'] = this.pincode;
    data['image'] = this.image;
    data['status'] = this.status;
    data['description'] = this.description;
    data['created_date'] = this.createdDate;
    data['video'] = this.video;
    data['total_user'] = this.totalUser;
    return data;
  }
}
