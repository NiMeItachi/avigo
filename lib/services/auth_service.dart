import 'package:avigo/database/users_database.dart';
import 'package:avigo/models/user_model.dart';

class AuthService {
  static signIn(String email, String password){
    for(int i = 0;  i < users.users.length; i ++){
      if(users.users[i].email == email && users.users[i].password == password){
        return true;
      }
    }
    return false;
  }
  static signUp(String name, String email, String date, String password){
    bool have = false;
    for(int i = 0;  i < users.users.length; i ++){
      if(users.users[i].email == email && users.users[i].password == password){
        have = true;
        break;
      }
    }
    if(have == false){
      User newUser = User(name, email, date, password);
      users.users.add(newUser);
      return true;
    } else {
      return false;
    }
  }
}