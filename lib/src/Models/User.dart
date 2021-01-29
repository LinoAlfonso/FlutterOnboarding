class User {
  User({
    this.rImage,
    this.ruid,
    this.fullName,
    this.email,
    this.checkUserId,
    this.password,
    this.documentNumber,
    this.phoneNumber,
    this.countryCodeId,
    this.rate,
    this.bankAccount,
    this.authToken,
    this.locationCountry,
    this.locationCountryStateCity,
    this.systemDocType,
    this.systemBankAccountTypes,
    this.bankTypes,
  });

  String rImage;
  String ruid;
  String fullName;
  String email;
  int checkUserId;
  String password;
  String documentNumber;
  String phoneNumber;
  String countryCodeId;
  double rate;
  String bankAccount;
  String authToken;
  LocationCountry locationCountry;
  LocationCountry locationCountryStateCity;
  LocationCountry systemDocType;
  Types systemBankAccountTypes;
  Types bankTypes;

  factory User.fromJson(Map<String, dynamic> json) => User(
    rImage: json["rImage"]??'',
    ruid: json["ruid"],
    fullName: json["fullName"],
    email: json["email"],
    checkUserId: json["checkUserId"],
    password: json["password"],
    documentNumber: json["documentNumber"],
    phoneNumber: json["phoneNumber"],
    countryCodeId: json["countryCodeId"],
    rate: json["rate"].toDouble(),
    bankAccount: json["bankAccount"]??'',
    authToken: json["authToken"],
    locationCountry: LocationCountry.fromJson(json["locationCountry"]),
    locationCountryStateCity: LocationCountry.fromJson(json["locationCountryStateCity"]),
    systemDocType: LocationCountry.fromJson(json["systemDocType"]),
    systemBankAccountTypes: Types.fromJson(json["systemBankAccountTypes"]),
    bankTypes: json["BankTypes"]==null?null:Types.fromJson(json["BankTypes"]),
  );

  Map<String, dynamic> toJson() => {
    "rImage": rImage,
    "ruid": ruid,
    "fullName": fullName,
    "email": email,
    "checkUserId": checkUserId,
    "password": password,
    "documentNumber": documentNumber,
    "phoneNumber": phoneNumber,
    "countryCodeId": countryCodeId,
    "rate": rate,
    "bankAccount": bankAccount,
    "locationCountry": locationCountry.toJson(),
    "locationCountryStateCity": locationCountryStateCity.toJson(),
    "systemDocType": systemDocType.toJson(),
  };
}

class LocationCountry {
  LocationCountry({
    this.name,
  });

  String name;

  factory LocationCountry.fromJson(Map<String, dynamic> json) => LocationCountry(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Types {
  Types({
    this.name,
  });

  String name;

  factory Types.fromJson(Map<String, dynamic> json) => Types(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
