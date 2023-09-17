class ApiSettings {
  static const _baseUrl='https://pickup.tmooh-dev.com/api/';
  static const login=_baseUrl+'auth/login';
  static const register=_baseUrl+'auth/register';
  static const verifyCode=_baseUrl+'auth/verifyCode';
  static const logout=_baseUrl+'auth/logout';
  static const allGyms=_baseUrl+'content/gyms';
  static const allTrainer=_baseUrl+'content/trainer/{id}';
  static const allSubscription=_baseUrl+'content/subscription/{id}';
  static const subscriptionInfo=_baseUrl+'content/getSubscriptionInfo/{id}';
  static const payments=_baseUrl+'content/payments';
  static const storeSubscription=_baseUrl+'content/storeSubscription';
  static const getHome=_baseUrl+'content/home';
}