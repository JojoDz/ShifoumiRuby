#choix de joueur (doit entrer une donnée)
#ordinateur (choix random entre 3 possibilités)
#stocker les valeurs
#comparer le choix du joueur et ordinateur
#score 
#conditions de victoire, échec ou égalité 
#Conditions de victoire = 3 points

score = @score
@score = 0
#fonction shifoumi
def shifoumi
  puts "Que choisis-tu entre pierre, feuille et ciseaux ?"
  #récupère input du joueur, enlève saut de ligne, met tout en minuscule
  player_choice = gets.chomp.downcase
  if player_choice == "pierre" || player_choice == "feuille" || player_choice == "ciseaux"
    puts player_choice
  else 
    puts "Le choix n'est pas validé. Choisis entre pierre, feuille et ciseaux :)"
  end
  computer_choice = ["pierre", "feuille", "ciseaux"].sample
  #.sample: choix aléatoire entre les 3 termes pour l'ordinateur
  puts computer_choice 
  #conditions d'égalité (dont stabilisation du score)
  if player_choice == computer_choice
    puts "Pas de bol, égalité !"
    @score = @score
  #conditions d'échec (perte d'un point sauf si score est inférieur ou égal à 0)
  elsif (player_choice == "feuille" && computer_choice == "ciseaux") ||
        (player_choice == "ciseaux" && computer_choice == "pierre") ||
        (player_choice == "pierre" && computer_choice == "feuille")
    puts "Tu as perdu contre l'ordinateur !"
    if @score > 0
      @score -= 1
    else @score <= 0
      @score
    end
  #conditions de victoire (avec ajout d'un point au score)
  elsif (player_choice == "feuille" && computer_choice == "pierre") ||
        (player_choice == "ciseaux" && computer_choice == "feuille") ||
        (player_choice == "pierre" && computer_choice == "ciseaux")
    puts "Bravo, t'es un.e winner !"
    @score += 1
  end
  puts @score
end
#boucle jusqu'à ce que le score soit strictement égal à 3, on relance la fonction shifoumi
until @score == 3 do
  shifoumi
end