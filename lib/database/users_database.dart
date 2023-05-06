import '../models/user_model.dart';

UsersDatabase users = UsersDatabase();
User defaultUser = User("Nursultan", "nime@gmail.com", "06072005", "1234");

class UsersDatabase {
  List<User> users = [defaultUser];
}
