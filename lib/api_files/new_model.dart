class GetUser {
  String? responseCode;
  String? message;
  String? status;
  UserId? userId;
  String? userToken;

  GetUser(
      {this.responseCode,
      this.message,
      this.status,
      this.userId,
      this.userToken});

  GetUser.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    status = json['status'];
    userId =
        json['user_id'] != null ? new UserId.fromJson(json['user_id']) : null;
    userToken = json['user_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.userId != null) {
      data['user_id'] = this.userId!.toJson();
    }
    data['user_token'] = this.userToken;
    return data;
  }
}

class UserId {
  String? id;
  String? username;
  String? email;
  String? fName;
  String? lName;
  String? countrycode;
  String? mobile;
  String? dob;
  String? gender;
  String? profession;
  String? expJobTitle;
  String? expEmployer;
  String? expCountry;
  String? expStartDate;
  String? expEndDate;
  String? expCurrentWork;
  String? expDescription;
  String? eduSchoolName;
  String? eduDegree;
  String? eduField;
  String? eduStartDate;
  String? eduEndDate;
  String? eduPercentage;
  String? eduCurrentStudy;
  String? skillsDes;
  String? summaryDes;
  String? accomplishmentsDes;
  String? finalizeDes;
  String? password;
  String? profilePic;
  String? facebookId;
  String? type;
  String? isGold;
  String? address;
  String? city;
  String? country;
  String? deviceToken;
  String? agreecheck;
  String? otp;
  String? status;
  String? wallet;
  Null? oauthProvider;
  Null? oauthUid;
  Null? lastLogin;
  String? createdAt;
  String? updatedAt;
  String? refferalCode;
  String? friendCode;
  String? aboutUs;
  String? groupId;

  UserId(
      {this.id,
      this.username,
      this.email,
      this.fName,
      this.lName,
      this.countrycode,
      this.mobile,
      this.dob,
      this.gender,
      this.profession,
      this.expJobTitle,
      this.expEmployer,
      this.expCountry,
      this.expStartDate,
      this.expEndDate,
      this.expCurrentWork,
      this.expDescription,
      this.eduSchoolName,
      this.eduDegree,
      this.eduField,
      this.eduStartDate,
      this.eduEndDate,
      this.eduPercentage,
      this.eduCurrentStudy,
      this.skillsDes,
      this.summaryDes,
      this.accomplishmentsDes,
      this.finalizeDes,
      this.password,
      this.profilePic,
      this.facebookId,
      this.type,
      this.isGold,
      this.address,
      this.city,
      this.country,
      this.deviceToken,
      this.agreecheck,
      this.otp,
      this.status,
      this.wallet,
      this.oauthProvider,
      this.oauthUid,
      this.lastLogin,
      this.createdAt,
      this.updatedAt,
      this.refferalCode,
      this.friendCode,
      this.aboutUs,
      this.groupId});

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    fName = json['f_name'];
    lName = json['l_name'];
    countrycode = json['countrycode'];
    mobile = json['mobile'];
    dob = json['dob'];
    gender = json['gender'];
    profession = json['profession'];
    expJobTitle = json['exp_job_title'];
    expEmployer = json['exp_employer'];
    expCountry = json['exp_country'];
    expStartDate = json['exp_start_date'];
    expEndDate = json['exp_end_date'];
    expCurrentWork = json['exp_current_work'];
    expDescription = json['exp_description'];
    eduSchoolName = json['edu_school_name'];
    eduDegree = json['edu_degree'];
    eduField = json['edu_field'];
    eduStartDate = json['edu_start_date'];
    eduEndDate = json['edu_end_date'];
    eduPercentage = json['edu_percentage'];
    eduCurrentStudy = json['edu_current_study'];
    skillsDes = json['skills_des'];
    summaryDes = json['summary_des'];
    accomplishmentsDes = json['accomplishments_des'];
    finalizeDes = json['finalize_des'];
    password = json['password'];
    profilePic = json['profile_pic'];
    facebookId = json['facebook_id'];
    type = json['type'];
    isGold = json['isGold'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    deviceToken = json['device_token'];
    agreecheck = json['agreecheck'];
    otp = json['otp'];
    status = json['status'];
    wallet = json['wallet'];
    oauthProvider = json['oauth_provider'];
    oauthUid = json['oauth_uid'];
    lastLogin = json['last_login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    refferalCode = json['refferal_code'];
    friendCode = json['friend_code'];
    aboutUs = json['about_us'];
    groupId = json['group_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['countrycode'] = this.countrycode;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['profession'] = this.profession;
    data['exp_job_title'] = this.expJobTitle;
    data['exp_employer'] = this.expEmployer;
    data['exp_country'] = this.expCountry;
    data['exp_start_date'] = this.expStartDate;
    data['exp_end_date'] = this.expEndDate;
    data['exp_current_work'] = this.expCurrentWork;
    data['exp_description'] = this.expDescription;
    data['edu_school_name'] = this.eduSchoolName;
    data['edu_degree'] = this.eduDegree;
    data['edu_field'] = this.eduField;
    data['edu_start_date'] = this.eduStartDate;
    data['edu_end_date'] = this.eduEndDate;
    data['edu_percentage'] = this.eduPercentage;
    data['edu_current_study'] = this.eduCurrentStudy;
    data['skills_des'] = this.skillsDes;
    data['summary_des'] = this.summaryDes;
    data['accomplishments_des'] = this.accomplishmentsDes;
    data['finalize_des'] = this.finalizeDes;
    data['password'] = this.password;
    data['profile_pic'] = this.profilePic;
    data['facebook_id'] = this.facebookId;
    data['type'] = this.type;
    data['isGold'] = this.isGold;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['device_token'] = this.deviceToken;
    data['agreecheck'] = this.agreecheck;
    data['otp'] = this.otp;
    data['status'] = this.status;
    data['wallet'] = this.wallet;
    data['oauth_provider'] = this.oauthProvider;
    data['oauth_uid'] = this.oauthUid;
    data['last_login'] = this.lastLogin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['refferal_code'] = this.refferalCode;
    data['friend_code'] = this.friendCode;
    data['about_us'] = this.aboutUs;
    data['group_id'] = this.groupId;
    return data;
  }
}
