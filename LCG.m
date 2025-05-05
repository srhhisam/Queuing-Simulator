function output=LCG(cust,min,max)
    a=13;
    c=53;
    min=1;
    max=100;
    x=rand()*max;
    x=ceil(x);
    
    for i=1:cust
        z=a*x +c;
        output(i)=(ceil(mod (z,max)));
        
        if output(i)<min;
            output(i)=output(i)+min;
        end
        
        x=output(i);
    end
    
    