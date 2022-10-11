abstract class ApiConsumer {
  //get
  Future<dynamic> get(String path, {Map<String, dynamic>? params});

  //post
  Future<dynamic> post(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? params});
}
