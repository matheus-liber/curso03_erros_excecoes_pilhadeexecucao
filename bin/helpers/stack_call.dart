void stackStart(){
  print("Started main");
  functionOne();
  print("Finished main");
}

void functionOne(){
  print("Started F01");
  try {
    functionTwo();
  } on FormatException catch (e){
    print("Deu errado");
    print(e.source);
  }
  
  print("Finished F02");
}

void functionTwo(){
  print("Started F02");
  for(int i = 1; i <=5; i++){
    print(i);
    double amount = double.parse("Not a number");    
  }
  print("Finished F02");
}

