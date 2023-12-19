class ResponseModel {
  Map<String, dynamic> object;
  final bool success;
  final int status;
  final String message;

  ResponseModel(
      {required this.object,
      required this.message,
      required this.status,
      required this.success});

  static ResponseModel fromJson(Map<String, dynamic> json) => ResponseModel(
        object: json['object'],
        message: json['message'],
        status: json['status'],
        success: json['success'],
      );
}
