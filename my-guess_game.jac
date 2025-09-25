import random;

node turn {
    has correct_number : int = random.randint(1, 10);
}


walker GuessGame{
    has guess : int;

    can start with `root entry{
       next = root ++> turn(random.randint(1, 10));
        visit next;   
    }

    can process_guess with turn entry{
    if self.guess == here.correct_number {
        print("Correct!");
    }else{print("oops wrong answer!! try again");
    }
    }
}
with entry: __main__{
    root spawn GuessGame(guess = 2);
    root spawn GuessGame(guess = 3);
    root spawn GuessGame(guess = 4);
    root spawn GuessGame(guess = 5);
    root spawn GuessGame(guess =6);
}



