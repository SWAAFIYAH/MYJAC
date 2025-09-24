import random;

node turn {
    has correct_number : int = random.randint(1, 10);
}


walker GuessGame{
    has guess : int;
    can start with `root entry{
      print(f"starting journey at {here}");  
    }
    can process_guess with turn entry{
    print(f"Visited {self.correct_number}");}
}
with entry: __main__{
    root spawn GuessGame(2);
    root spawn GuessGame(3);
    root spawn GuessGame(4);
    root spawn GuessGame(5);
    root spawn GuessGame(6);
}



