class FileModel {
  final List<String> files;
  final String folder;

  FileModel({required this.files, required this.folder});

  static FileModel fromJson(Map<String, dynamic> json) => FileModel(
      files: json['files'].cast<String>(), folder: json['folderName']);
}
