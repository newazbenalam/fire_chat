// Abstract repository definition for Home feature
abstract class HomeRepository {
  Stream<List<Map<String, dynamic>>> getUsers();
  Future<Stream> getUser(String id);
  Future<Stream> addUser(String name, String email);
  Future<Stream> updateUser(String id, String name, String email);
  Future<Stream> deleteUser(String id);

  Future<void> getMessages();
  Future<void> getMessage(String id);
  Future<void> addMessage(String message);
  Future<void> updateMessage(String id, String message);
  Future<void> deleteMessage(String id);
  Future<void> clearMessages();

  Future<void> addMessageField(String message);
  Future<void> updateMessageField(String id, String message);
  Future<void> deleteMessageField(String id);
  Future<void> clearAllMessages();
}
