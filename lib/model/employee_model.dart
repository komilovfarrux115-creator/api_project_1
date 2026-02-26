class EmployeeModel {
  String status;
  List<Data> data;
  String message;

  EmployeeModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    status: json["status"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Data {
  int id;
  String employeeName;
  String employeeSalary;
  String employeeAge;
  String profileImage;

  Data({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    employeeName: json["employee_name"],
    employeeSalary: json["employee_salary"],
    employeeAge: json["employee_age"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_name": employeeName,
    "employee_salary": employeeSalary,
    "employee_age": employeeAge,
    "profile_image": profileImage,
  };
}
