function output = Counter3(i, RNserviceT, serviceT)
    
        if (RNserviceT(i) >= 1 && RNserviceT(i) <= 5)
            output = serviceT(1);
        elseif (RNserviceT(i) >= 6 && RNserviceT(i) <= 15)
            output = serviceT(2);
        elseif (RNserviceT(i) >= 16 && RNserviceT(i) <= 40)
            output = serviceT(3);
        elseif (RNserviceT(i) >= 41 && RNserviceT(i) <= 60)
            output = serviceT(4);
        elseif (RNserviceT(i) >= 61 && RNserviceT(i) <= 85)
            output = serviceT(5);
        else
            output = serviceT(6);
        end
    