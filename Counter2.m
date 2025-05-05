function output = Counter2(i, RNserviceT, serviceT)
    
        if (RNserviceT(i) >= 1 && RNserviceT(i) <= 10)
            output = serviceT(1);
        elseif (RNserviceT(i) >= 11 && RNserviceT(i) <= 15)
            output = serviceT(2);
        elseif (RNserviceT(i) >= 16 && RNserviceT(i) <= 30)
            output = serviceT(3);
        elseif (RNserviceT(i) >= 31 && RNserviceT(i) <= 50)
            output = serviceT(4);
        elseif (RNserviceT(i) >= 51 && RNserviceT(i) <= 75)
            output = serviceT(5);
        else
            output = serviceT(6);
        end
    