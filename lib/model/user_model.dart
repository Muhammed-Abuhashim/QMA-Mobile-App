class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? mobile;
  String? nationalId;
  String? age;
  String? gender;
  String? address;
  String? wheelchairId;
  String? password;
  String? disease;
  String? diabetes;

  UserModel({this.uid, this.email, this.firstName, this.secondName, this.mobile, this.nationalId,
  this.age, this.gender, this.address, this.wheelchairId, this.password, this.disease, this.diabetes, userEmail, userImage, userName, userUid,});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      mobile: map['mobile'],
      nationalId: map['nationalId'],
      age: map['age'],
      gender: map['gender'],
      address: map['address'],
      wheelchairId: map['wheelchairId'],
      password: map['password'],
      disease: map['disease'],
      diabetes: map['diabetes'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'mobile': mobile,
      'nationalId': nationalId,
      'age': age,
      'gender': gender,
      'address': address,
      'wheelchairId': wheelchairId,
      'password': password,
      'disease': disease,
      'diabetes': diabetes,
    };
  }
}