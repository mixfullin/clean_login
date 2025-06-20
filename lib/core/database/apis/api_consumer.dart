abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFromData = false,
  });
  Future<dynamic> post(String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
bool isFromData = false,
  });
 Future<dynamic> delete(String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
bool isFromData = false,
  });
  Future<dynamic> patch(String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFromData = false,
  });
  Future<dynamic> put(
  String path, {
  dynamic data,
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? headers,
  bool isFromData = false,
});

}
