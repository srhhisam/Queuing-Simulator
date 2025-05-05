function output = RAND(cust,min,max)
    min = 1;
    max = 100;
    x = rand(1,cust);
    z = min + (max-min)*x;
    output = ceil(z);
    end