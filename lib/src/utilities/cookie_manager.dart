// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class CookieManager {
  // Set a cookie with the given name, value, and optional parameters
  void setCookie(String name, String value,
      {int? maxAge,
      String? path,
      String? domain,
      bool? secure,
      bool? httpOnly}) {
    final buffer = StringBuffer();
    buffer.write('$name=$value');

    if (maxAge != null) {
      buffer.write('; max-age=$maxAge');
    }
    if (path != null) {
      buffer.write('; path=$path');
    }
    if (domain != null) {
      buffer.write('; domain=$domain');
    }
    if (secure ?? false) {
      buffer.write('; secure');
    }
    if (httpOnly ?? false) {
      buffer.write('; HttpOnly');
    }

    document.cookie = buffer.toString();
  }

  // Get the value of a cookie by name
  String? getCookie(String name) {
    final cookies = document.cookie?.split('; ') ?? [];
    for (final cookie in cookies) {
      final keyValue = cookie.split('=');
      if (keyValue.length == 2 && keyValue[0] == name) {
        return keyValue[1];
      }
    }
    return null;
  }

  // Delete a cookie by name
  void deleteCookie(String name, {String? path, String? domain}) {
    setCookie(name, '',
        maxAge: 0, path: path, domain: domain, secure: false, httpOnly: false);
  }

  // Check if a cookie exists
  bool cookieExists(String name) {
    return getCookie(name) != null;
  }
}
