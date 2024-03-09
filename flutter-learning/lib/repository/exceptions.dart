class Failure {
  final String messege;
  const Failure([this.messege = "An Unknown error occured"]);
  factory Failure.code(String code) {
    switch (code) {
      case 'weak password':
        return Failure(' Please enter a strong password');
      default:
        return Failure();
    }
  }
}
