class MyTexts {
  static MyTexts? _instance;
  static MyTexts get instance {
    _instance ??= MyTexts._init();
    return _instance!;
  }

  MyTexts._init();

  final String welcomeText = "Welcome back you've been missed!";
  final String nameText = "Name";
  final String surnameText = "Surname";
  final String emailText = "Email";
  final String passwordText = "Password";
  final String confirmPasswordText = "Confirm Password";
  final String forgotPasswordText = "Forgot Password";
  final String signInButtonText = "Sign In";
  final String signUpButtonText = "Sign Up";
  final String notaMemberText = "Not a member?";
  final String alreadyHaveText = "Already have an acoount?";
  final String loginNowText = "Login Now";
  final String registerNowText = "Register now";
  final String editText = "Edit";
  final String deleteText = "Delete";
  final String helloText = "Hello";
  final String notFoundText = "Not Found";
  final String addTodoText = "Add Todo";
  final String okeyText = "Okey";
  final String cancelText = "Cancel";
  final String todoText = "Todo";
}
