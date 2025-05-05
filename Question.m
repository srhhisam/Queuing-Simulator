function output = Question() 
    
    %user input 
    while (true)
        printf('\n');
        printf('Welcome to Cyberjaya Supermarket Queuing Simulator <3 \n');
        printf('Please Choose Your Random Generator. \n');
        printf('1- Linear Congruential Generator \n');
        printf('2- Random Uniform Generator \n');
        
        g = input('=> ');
        
        if (g==1)
            generator = 'Linear Congruential Generator'
            break;
        elseif (g==2)
            generator = 'Random Uniform Generator'
            break;
        else
            sprintf('\nNot Valid! Please Re-Enter Your Choice \n')
        end
    end
    
    output = g;