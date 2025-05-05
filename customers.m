function output = customers();
    
    check=0;
     while (check==0)
         sprintf('Please Enter The Number Of Customers. At Least 1 Customer for the simulation to operate.')
         cust=input ('=> ');
         if (cust<1)
             printf('\nNot Valid! Please Re-Enter The Number Of Customers \n');
             cust = input('=> ');
         else
             check=1;
         end
     end
     
     output = cust;