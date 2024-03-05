class Message {
  String? _fromId;
  String? _read;
  String? _toId;
  String? _toImage;
  String? _message;
  MessageType? _type;
  String? _sent;

  Message({String? fromId,
    String? read,
    String? toId,
    String? toImage,
    String? message,
    MessageType? type,
    String? sent}) {
    if (fromId != null) {
      this._fromId = fromId;
    }
    if (read != null) {
      this._read = read;
    }
    if (toId != null) {
      this._toId = toId;
    }
    if (toImage != null) {
      this._toImage = toImage;
    }
    if (message != null) {
      this._message = message;
    }
    if (type != null) {
      this._type = type;
    }
    if (sent != null) {
      this._sent = sent;
    }
  }

  String? get fromId => _fromId;

  set fromId(String? fromId) => _fromId = fromId;

  String? get read => _read;

  set read(String? read) => _read = read;

  String? get toId => _toId;

  set toId(String? toId) => _toId = toId;

  String? get toImage => _toImage;

  set toImage(String? toImage) => _toImage = toImage;

  String? get message => _message;

  set message(String? message) => _message = message;

  MessageType? get type => _type;

  set type(MessageType? type) => _type = type;

  String? get sent => _sent;

  set sent(String? sent) => _sent = sent;

  Message.fromJson(Map<String, dynamic> json) {
    _fromId = json['from_id'].toString();
    _read = json['read'].toString();
    _toId = json['to_id'].toString();
    _toImage = json['to_image'].toString();
    _message = json['message'].toString();
    _type = json['type'].toString() == MessageType.IMAGE.name ? MessageType.IMAGE : MessageType.TEXT;
    _sent = json['sent'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_id'] = this._fromId;
    data['read'] = this._read;
    data['to_id'] = this._toId;
    data['to_image'] = this._toImage;
    data['message'] = this._message;
    data['type'] = this._type!.name;
    data['sent'] = this._sent;
    return data;
  }

}

enum MessageType{TEXT, IMAGE}