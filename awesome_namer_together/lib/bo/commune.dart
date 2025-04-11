class Commune {
  final String nom;
  final String codePostal;
  final int population;

  const Commune({required this.nom, required this.codePostal, required this.population});

  factory Commune.fromJson(Map<String, dynamic> json) {
    return Commune(
      nom: json['nom'],
      codePostal: json['codesPostaux'][0],
      population: json['population']
    );
  }
}