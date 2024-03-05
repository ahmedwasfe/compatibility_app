class Conversation {
  late String? userId;
  late String? uuid;
  late String? name;
  late String? lastMessage;
  late String? image;
  late String? email;
  late String? phone;
  late String? userType;
  late bool? isOnline;
  late bool? isChat;
  late String? lastActive;
  late String? pushToken;
  late String? createAt;


  Conversation({
    this.userId,
    this.uuid,
    this.name,
    this.lastMessage,
    this.image,
    this.email,
    this.phone,
    this.userType,
    this.isOnline,
    this.isChat,
    this.lastActive,
    this.pushToken,
    this.createAt});

  Conversation.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] ?? '';
    uuid = json['uuid'] ?? '';
    name = json['name'] ?? '';
    lastMessage = json['last_message'] ?? '';
    image = json['image'] ?? '';
    email = json['email'] ?? '';
    phone = json['phone'] ?? '';
    userType = json['user_type'] ?? '';
    isOnline = json['is_online'] ?? false;
    isChat = json['is_chat'] ?? false;
    lastActive = json['last_active'] ?? '';
    pushToken = json['push_token'] ?? '';
    createAt = json['create_at'] ?? '';
  }

Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['uuid'] = uuid;
    data['name'] = name;
    data['last_message'] = lastMessage;
    data['image'] = image;
    data['email'] = email;
    data['phone'] = phone;
    data['user_type'] = userType;
    data['is_online'] = isOnline;
    data['is_chat'] = isChat;
    data['last_active'] = lastActive;
    data['push_token'] = pushToken;
    data['create_at'] = createAt;
    return data;
}
}