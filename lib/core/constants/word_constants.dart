sealed class WordConstants {
  // App
  static const String wAppName = 'Language Learning';
  static const String wEmptyString = ' ';
  static const String wMandatory = '*';
  static const String wLogout = 'Logout';
  static const String wLogoutQuestion = 'Logout?';
  static const String wLogoutMessage = 'Do you want to log out?';
  static const String wOK = 'Ok';
  static const String wDone = 'Done';
  static const String wOkay = 'Okay';
  static const String wCancel = 'Cancel';
  static const String wYes = 'Yes';
  static const String wBack = 'Back';
  static const String wWarning = 'Warning';

  // Web API Messages
  static const String wMessageNoInternet =
      'Please check your internet connection';
  static const String wMessageUnableToProcess =
      'Unable to process your request right now';
  static const String wMessageSomethingWentWrong =
      'Something went wrong, try again later!';

  // Permission Messages
  static const String wNotificationPermissionDeniedMessage =
      '$wAppName app requires notification permission. Do you want to allow?';
  static const String wNotificationPermissionDeniedPermanentlyMessage =
      '$wAppName app requires notification permission. Do you want to update settings?';
  static const String wLocationPermissionDeniedPermanently =
      "$wAppName requires location access. Please update app settings to grant access.";
  static const String wLocationPermissionDenied =
      "$wAppName requires location access to function properly.";
  static const String wCameraPermissionDeniedPermanently =
      "$wAppName needs camera access. Do you want to update settings?";
  static const String wCameraPermissionDenied =
      "$wAppName needs camera access. Do you want to allow?";
  static const String wMicrophonePermissionDeniedPermanently =
      "$wAppName needs microphone access. Do you want to update settings?";
  static const String wMicrophonePermissionDenied =
      "$wAppName needs microphone access. Do you want to allow?";

  // Location Messages
  static const String wLocationEmpty = "Please enable the location";
  static const String wLocationWait = "Please wait while we fetch the location";

  // Background Service Notification Messages
  static const String wNotificationBackgroundService =
      "Background service initiated";
  static const String wNotificationBackgroundLocation =
      "Location updates started";

  // Login
  static const String wUserId = 'User Id';
  static const String wUserName = 'Username';
  static const String wPassword = 'Password';
  static const String wLoginWithSpace = 'Log in';
  static const String wLogin = 'Login';
  static const String wUserNameMessage = 'Please enter a valid username';
  static const String wPasswordMessage = 'Please enter a valid password';

  // Common UI Messages
  static const String wUpdatedSuccessfully = "Updated Successfully";
  static const String wNoDataFoundMessage = "No data found";
  static const String wDescription = "Description";
  static const String wDescriptionEmptyMessage = "Please fill the description";
  static const String wSend = "Send";
  static const String wSelect = "Select";
  static const String wSearch = "Search";
  static const String wPageNotFound = "Page not found";
  static const String wReceived = "Received";
  static const String wNoImageFoundMessage = "No image available to display";
  static const String wImage = "Image";
  static const String wTakePhoto = "Take Photo";
  static const String wTakePhotoLimitMessage =
      "One image allowed, delete current photo to capture again";
  static const String wEndDuty = 'End Duty';
  static const String wStartDuty = 'Start Duty';

  // Menu / Navigation
  static const String wHome = 'Home';
  static const String wDashboard = 'Dashboard';
  static const String wBackToHome = 'Back to home';
  static const String wWelcomeMessage = 'Hi, ';

  // Generic Messages
  static const String wNoRecordsFound = "No records found";
  static const String wTryAgainLater = "Please try again later";
  static const String wActionSuccessful = "Action completed successfully";

}
