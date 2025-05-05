function output = CusInterA(cust, RNarrival, interA)
     
    for i=1:cust
        if (i==1)
            cus_interArrivalTime(i) = 0;
        elseif (RNarrival(i) >= 1 && RNarrival(i) <=10)
            cus_interArrivalTime(i) = interA(1);
        elseif (RNarrival(i) >= 11 && RNarrival(i) <= 25)
            cus_interArrivalTime(i) = interA(2);
        elseif (RNarrival(i) >= 26 && RNarrival(i) <= 45)
            cus_interArrivalTime(i) = interA(3);
        elseif (RNarrival(i) >= 46 && RNarrival(i) <= 60)
            cus_interArrivalTime(i) = interA(4);
        elseif (RNarrival(i) >= 61 && RNarrival(i) <= 75)
            cus_interArrivalTime(i) = interA(5);
        elseif (RNarrival(i) >= 76 && RNarrival(i) <= 85)
            cus_interArrivalTime(i) = interA(6);
        elseif (RNarrival(i) >= 86 && RNarrival(i) <= 95)
            cus_interArrivalTime(i) = interA(7);
        else
            cus_interArrivalTime(i) = interA(8);
        end
    end
    
    output = cus_interArrivalTime;
    
    
    
    
    
    
    