class Postagem {
  String usuario;
  DateTime data;
  String conteudo;
  int likes;
  int dislikes;
  String? tag;

  //   Postagem(this.usuario, this.data, this.conteudo, this.likes, this.dislikes);

  // Boas Praticas de construtor.
  Postagem({
    required this.usuario,
    required this.data,
    required this.conteudo,
    this.likes = 0,
    this.dislikes = 0,
    this.tag,
  });

  void like() {
    likes = likes + 1;
  }
}

Postagem criarpostagem(
  String newusuario,
  String newconteudo,
  int addlikes,
  int adddislikes,
  String newtag,
) {
  var post = Postagem(
    usuario: newusuario,
    data: DateTime.now(),
    conteudo: newconteudo,
    likes: addlikes,
    dislikes: adddislikes,
    tag: newtag,
  );
  return post;
}

void main() {
  Postagem post1 = Postagem(
    usuario: "SUZUKI",
    data: DateTime.now(),
    conteudo: "ODEIO TUDO E TODOS",
    likes: 2,
    dislikes: 0,
    tag: "#soufoda, #thuglife",
  );

  print("\n========================\n");
  print("POST 1\n");
  print(post1.usuario);
  print(post1.data);
  print(post1.conteudo);
  print(post1.likes);
  print(post1.dislikes);
  print(post1.tag);

  Postagem post2 = Postagem(
    usuario: "SAMIR",
    data: DateTime.now(),
    conteudo: "SAI DAÍ ESQUISITA",
    //     likes: 10,
    //     dislikes: 85,
  );
  
  print("\n========================");
  print("\nPOST 2\n");
  print(post2.usuario);
  print(post2.data);
  print(post2.conteudo);
  print(post2.likes);
  print(post2.dislikes);
  print(post2.tag);
  
  print("\nSKANK CURTIU");
  post2.like();
  print(post2.likes);
  
  Postagem post3 = criarpostagem(
    "SKANK",
    "vou deixar a vida me levar",
    25,
    2,
    "#skank, #vida",
  );
  
  print("\n========================");
  print("\nPOST 3\n");
  print(post3.usuario);
  print(post3.data);
  print(post3.conteudo);
  print(post3.likes);
  print(post3.dislikes);
  print(post3.tag);
}
