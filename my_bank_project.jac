import math;

node Account{
    has account_number : int;
    has account_name : str;
    has account_balance : float;
}



walker CheckBalance{
    can start with `root entry{
        next = root ++> Account;
        visit next;
    
    }
    can check_account_balance with Account{
        print(f"{here.account_name}'s balance : {here.account_balance}");
    }
    
}

walker Deposit{
    has amount_to_deposit : float;

    can start with `root entry {
        next = root ++> Account;
        visit next;


        can deposit_amount with Account entry{
            here.account_balance += self.amount_to_deposit;
            print("deposited {self.amount_to_deposit}");
            print(f"{here.account_name}'s New Balance : {here.account_balance}");

        }
    }
}


walker Withdraw{
    has amount_to_withdraw : float;

    can start with `root entry {
        next = root ++> Account;
        visit next;


        can withdraw_amount with Account entry{
              here.account_balance -=  self.amount_to_withdraw;
              print("withdrawn {self.amount_to_withdraw}");

            print(f"{here.account_name}'s New Balance : {here.account_balance}");

        }
    }
}


with entry: __main__{
    acc1 =spawn Account(10000, sophia, 200.00);
    acc2 = spawn Account(100001, matano, 500.00);


    root spawn CheckBalance();
    root spawn Deposit(50.00);
    root spawn Withdraw(50.00);

}