class InvalidSenderIdException implements Exception {
  static const String report = "InvalidSenderIdException";
  String idSender;
  InvalidSenderIdException({required this.idSender});

  @override
  String toString(){
    return "$report\nID Sender: $idSender";
  }
}
class InvalidReceiverException implements Exception {
  static const String report = "InvalidReceiverException";
  String idReceiver;
  InvalidReceiverException({required this.idReceiver});

  @override
  String toString(){
    return "$report\nID Reciever: $idReceiver";
  }
}
class NotAuthenticatedSenderException implements Exception {
  static const String report = "NotAuthenticatedSenderException";
  String idSender;
  NotAuthenticatedSenderException({required this.idSender});

  @override
  String toString(){
    return "$report\nID Sender: $idSender";
  }
}
class NotAuthenticatedReceiverException implements Exception {
  static const String report = "NotAuthenticatedReceiverException";
  String idReceiver;
  NotAuthenticatedReceiverException({required this.idReceiver});

  @override
  String toString(){
    return "$report\nID Receiver: $idReceiver";
  }
}

class SenderBalanceLowerThanAmountException implements Exception {
  static const String report = "SenderBalanceLowerThanAmountException";
  String idSender;
  double senderBalance;
  double amount;

  SenderBalanceLowerThanAmountException(
    {required this.idSender, required this.senderBalance, required this.amount});

  @override
  String toString(){
    return "$report\nID Sender: $idSender\nSender Balance: $senderBalance\nAmount: $amount";
  }
}