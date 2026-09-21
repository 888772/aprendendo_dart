class Conta {
  String cliente;
  DateTime criadaEm;
  double saldo;

  Conta({required this.cliente, required this.criadaEm, required this.saldo});

  void creditar({required double valor}) { //METODO NOMEADO
    saldo += valor;
  }

  void debitar({required double valor}) { //METODO NOMEADO
    saldo -= valor;
  }
}

class ContaCorrente extends Conta {
  ContaCorrente({
    required super.cliente,
    required super.criadaEm,
    required super.saldo,
  });
}


class ContaPoupanca extends Conta {
  ContaPoupanca({
    required super.cliente,
    required super.criadaEm,
    required super.saldo,
  });
  
  @override //MUDAR UM COMPORTAMENTO DE ALGUM METODO DE CIMA.
  void debitar({required double valor}) {
    if (valor <= saldo) {
      saldo -= valor;
    }
  }
}

class Caixa {
  
  void transferir({
    required Conta origem,
    required Conta destino,
    required double valor,
  }){
    origem.debitar(valor: valor); // valor: valor porquer metodo é nomeado
    destino.creditar(valor: valor); // valor: valor porquer metodo é nomeado
  }
  
  void depositar({
    required Conta origem,
    required double valor,
  }) {
    origem.creditar(valor: valor); // valor: valor porquer metodo é nomeado
  }
  
  void sacar({
    required Conta origem,
    required double valor,
  }) {
    origem.debitar(valor: valor); // valor: valor porquer metodo é nomeado
  }
  
}


void main() {
  Caixa caixa = Caixa();
  
  Conta c1 = ContaCorrente(
    cliente: "Gui",
    criadaEm: DateTime.now(),
    saldo: 100,
  );
  print("SALDO GUI");
  print(c1.cliente);
  print(c1.saldo);
  print("\n");
  
  Conta c2 = ContaPoupanca(
    cliente: "Ceci",
    criadaEm: DateTime.now(),
    saldo: 50,
  );
  
  print("SALDO CECI");
  print(c2.cliente);
  print(c2.saldo);
  print("\n");
  
  // FAZER A TRANSFERENCIA
  caixa.transferir(origem: c1, destino: c2, valor: 50);
  
  print("TRANSFERENCIA FEITA!!\n");
  
  print("SALDO GUI");
  print(c1.cliente);
  print(c1.saldo);
  print("\n");
  
  print("SALDO CECI");
  print(c2.cliente);
  print(c2.saldo);
  print("\n");
}
