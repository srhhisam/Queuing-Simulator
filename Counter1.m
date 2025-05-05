function output = Counter1Service(i, RNserviceT, serviceT)
    
        if (RNserviceT(i) >= 1 && RNserviceT(i) <= 10)
            output = serviceT(1);
        elseif (RNserviceT(i) >= 11 && RNserviceT(i) <= 20)
            output = serviceT(2);
        elseif (RNserviceT(i) >= 21 && RNserviceT(i) <= 35)
            output = serviceT(3);
        elseif (RNserviceT(i) >= 36 && RNserviceT(i) <= 60)
            output = serviceT(4);
        elseif (RNserviceT(i) >= 61 && RNserviceT(i) <= 80)
            output = serviceT(5);
        else
            output = serviceT(6);
        end
    