mixin IRecoverPasswordSentSuccessPresenter {
  Stream<String?> get navigateToStream;
  void dispose();

  void navigateToSignIn();
}
