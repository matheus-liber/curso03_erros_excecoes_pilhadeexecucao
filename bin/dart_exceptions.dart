import 'controllers/bank_controller.dart';
import 'excepctions/bank_controller_exceptions.dart';
import 'models/account.dart';

void main(){
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
        idSender: "Kako", idReceiver: "Ricarth", amount: 770);
    
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
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
    print("O remente '${e.idSender}' não pode transferir ${e.amount} tendo como saldo ${e.senderBalance}");
  } on Exception {
    print("Algo deu errado");
  }

  // Observando resultado
  
}