class MessageModel {
  int? _messageId;
  int _idFrom;
  int _idTo;
  String _text;
  bool _liked;
  bool _unread;
  int _type;
  DateTime _createdAt;
  DateTime _updatedAt;

  MessageModel(
    this._messageId,
    this._idFrom,
    this._idTo,
    this._text,
    this._liked,
    this._unread,
    this._type,
    this._createdAt,
    this._updatedAt,
  );

  MessageModel.copy(
    this._idFrom,
    this._idTo,
    this._text,
    this._liked,
    this._unread,
    this._type,
    this._createdAt,
    this._updatedAt,
  );

  set setMessageId(int? messageId) {
    _messageId = messageId;
  }

  int? get getMessage {
    return _messageId;
  }

  set setIdFrom(int idFrom) {
    _idFrom = idFrom;
  }

  int get getIdFrom {
    return _idFrom;
  }

  set setIdTo(int idTo) {
    _idTo = idTo;
  }

  int get getIdTo {
    return _idTo;
  }

  set setText(String text) {
    _text = text;
  }

  String get getText {
    return _text;
  }

  set setLiked(bool liked) {
    _liked = liked;
  }

  bool get isLiked {
    return _liked;
  }

  set setUnread(bool unread) {
    _unread = unread;
  }

  bool get isUnread {
    return _unread;
  }

  set setType(int type) {
    _type = type;
  }

  int get getType {
    return _type;
  }

  set setCreatedAt(DateTime createdAt) {
    _createdAt = createdAt;
  }

  DateTime get getCreatedAt {
    return _createdAt;
  }

  set setUpdatedAt(DateTime updatedAt) {
    _updatedAt = updatedAt;
  }

  DateTime get getUpdatedAt {
    return _updatedAt;
  }
}

List<MessageModel> messages = [
  MessageModel(1, 1, 2, "_text", true, true, 0, DateTime.now(), DateTime.now()),
  MessageModel(2, 1, 2, "_text", true, true, 0, DateTime.now(), DateTime.now()),
  MessageModel(3, 1, 2, "_text", true, true, 0, DateTime.now(), DateTime.now()),
  MessageModel(4, 2, 1, "_text", true, true, 0, DateTime.now(), DateTime.now()),
  MessageModel(5, 2, 2, "_text", true, true, 0, DateTime.now(), DateTime.now()),
];
