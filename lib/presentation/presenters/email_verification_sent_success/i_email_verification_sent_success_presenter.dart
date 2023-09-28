mixin IEmailVerificationSentSuccessPresenter {
  Stream<String?> get navigateToStream;
  void dispose();

  void navigateToSignIn();
}
