class User {
  String name;
  String email;
  String date;
  String password;

  User(this.name, this.email, this.date, this.password);

  @override
  String toString() {
    return 'User{name: $name, email: $email, date: $date, password: $password}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          date == other.date &&
          password == other.password;

  @override
  int get hashCode =>
      name.hashCode ^ email.hashCode ^ date.hashCode ^ password.hashCode;
}