class UserAccount {
  late String firstname, lastname, email, dob, gender, nationality, residence;
  late String? phone;

  UserAccount(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.dob,
      required this.gender,
      required this.nationality,
      required this.residence,
      this.phone});

  UserAccount.fromJson(Map<dynamic, dynamic> map) {
    firstname = map['firstname'];
    lastname = map['lastname'];
    email = map['email'];
    dob = map['dob'];
    gender = map['gender'];
    nationality = map['nationality'];
    residence = map['residence'];
    phone = map['phone'] ?? '';
  }

  toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'dob': dob,
      'gender': gender,
      'nationality': nationality,
      'residence': residence,
      'phone': phone,
    };
  }
}
