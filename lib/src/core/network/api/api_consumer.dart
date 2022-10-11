abstract class ApiConsumer {
  //get
  Future<dynamic> get(String path, {Map<String, dynamic> params});

  //post
  Future<dynamic> post(String path,
      {Map<String, dynamic> data, Map<String, dynamic> params});

  //put OR update
  Future<dynamic> put(String path,
      {Map<String, dynamic> data, Map<String, dynamic> params});

//delete
  Future<dynamic> delete(String path,
      {Map<String, dynamic> data, Map<String, dynamic> params});
}
