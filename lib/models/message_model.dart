class MessageModel {
  int? _messageId;
  String _text;
  bool _liked;
  bool _unread;
  DateTime _createdAt;
  DateTime _updatedAt;

  MessageModel(
    this._messageId,
    this._text,
    this._liked,
    this._unread,
    this._createdAt,
    this._updatedAt,
  );

  MessageModel.copy(
    this._text,
    this._liked,
    this._unread,
    this._createdAt,
    this._updatedAt,
  );

  set setMessageId(int? messageId) {
    _messageId = messageId;
  }

  int? get getMessage {
    return _messageId;
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

  get isUnread {
    return _unread;
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
