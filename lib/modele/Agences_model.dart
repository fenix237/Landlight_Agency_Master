class Agences {
  final String Nom;
  final String Description;
  final int NombreAbonnes;
  final int NombreAbonnesFavoris;

  const Agences({
    required this.Nom,
    required this.Description,
    required this.NombreAbonnes,
    required this.NombreAbonnesFavoris,
  });

  Agences copy({
    String? Nom,
    String? Description,
    int? NombreAbonnes,
    int? NombreAbonnesFavoris,
  }) =>
      Agences(
        Nom: Nom ?? this.Nom,
        Description: Description ?? this.Description,
        NombreAbonnes: NombreAbonnes ?? this.NombreAbonnes,
        NombreAbonnesFavoris: NombreAbonnesFavoris ?? this.NombreAbonnesFavoris,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Agences &&
          runtimeType == other.runtimeType &&
          Nom == other.Nom &&
          Description == other.Description &&
          NombreAbonnes == other.NombreAbonnes &&
          NombreAbonnesFavoris == other.NombreAbonnesFavoris;

  @override
  int get hashCode =>
      Nom.hashCode ^
      Description.hashCode ^
      NombreAbonnes.hashCode ^
      NombreAbonnesFavoris.hashCode;
}
