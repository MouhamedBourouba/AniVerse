extension Error on Exception {
  String getErrorMessage() {
    return toString().replaceFirst("Exception: ", "");
  }
}