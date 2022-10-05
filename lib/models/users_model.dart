class UserDAO {
  int? id;
  String? fullName = '';
  String? email = '';
  String? phone = '';
  String? githubpage = '';
  String? image = '';

  UserDAO(
      {this.id,
      this.fullName,
      this.email,
      this.phone,
      this.githubpage,
      this.image});

  factory UserDAO.fromJson(Map<String, dynamic> mapUser) {
    return UserDAO(
        id: mapUser['id'],
        fullName: mapUser['fullName'],
        email: mapUser['email'],
        phone: mapUser['phone'],
        githubpage: mapUser['githubpage'],
        image: mapUser['image']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'githubpage': githubpage,
        'image': image,
      };
}
