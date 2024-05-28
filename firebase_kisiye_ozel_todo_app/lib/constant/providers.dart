import 'package:firebase_kisiye_ozel_todo_app/view_model/auth_view_model/login_or_register_page_view_model.dart';
import 'package:firebase_kisiye_ozel_todo_app/view_model/auth_view_model/login_page_view_model.dart';
import 'package:firebase_kisiye_ozel_todo_app/view_model/auth_view_model/register_page_view_model.dart';
import 'package:firebase_kisiye_ozel_todo_app/view_model/home_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider(
      create: (context) => LoginOrRegisterPageViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => LoginPageViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => HomePageViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => RegisterPageViewModel(),
    ),
  ];
}
