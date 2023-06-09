import 'dart:math';

import 'controllers/bank_controller.dart';
import 'excepctions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety(){
  Account? myAccount;

  //Simulando uma comunicação externa
  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  if(randomNumber <= 5) {
    myAccount = Account(name: "Matheus", balance: 250, isAuthenticated: true);
  }

  print(myAccount.runtimeType);

  print(myAccount?.balance);
}
void main(){
  testingNullSafety();
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try{
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 400);
    
    if (result){
      print("Transação concluída com sucesso");
    }
  } on InvalidSenderIdException catch (e) {
    print(e);
    print("O ID ${e.idSender} do remetente não é um ID válido.");
  } on InvalidReceiverException catch (e) {
    print(e);
    print("O ID ${e.idReceiver} do destinatário não é um ID válido.");
  } on NotAuthenticatedSenderException catch (e) {
    print(e);
    print("O remetente '${e.idSender}' não está autenticado.");
  } on NotAuthenticatedReceiverException catch (e) {
    print(e);
    print("O destinatário '${e.idReceiver}' não está autenticado.");
    } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
    print("O remente '${e.idSender}' não pode transferir ${e.amount} tendo como saldo ${e.senderBalance}");
  } on Exception {
    print("Algo deu errado");
  }

  // Observando resultado
  
}