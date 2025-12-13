class PatternConstants {
  // Pattern Matcher

  static const String patternForNumberOnly = "[0-9]";
  static const String patternForStringOnly = "[a-zA-Z]";
  static const String patternForStringAndNumbers = r'[A-Za-z0-9 ]';
  static const String patternForMobile = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  static const String patternForEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String patternForPassword =
      r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*|_~`\=+-[{},.?:;])(?=.{8,}))';
  static const String patternToRemoveEmoji =
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
  static const String patternWebUrl =
      r"(http|ftp|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?";

  static const String patternForEmailForLeads =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
}
