function output = CusItemN(cust, RNitem, itemN)
    
    for i=1:cust
        if (RNitem(i) >= 1 && RNitem(i) <= 5)
            cus_numberOfItems(i) = itemN(1);
        elseif (RNitem(i) >= 6 && RNitem(i) <= 7)
            cus_numberOfItems(i) = itemN(2);
        elseif (RNitem(i) >= 8 && RNitem(i) <= 13)
            cus_numberOfItems(i) = itemN(3);
        elseif (RNitem(i) >= 14 && RNitem(i) <= 15)
            cus_numberOfItems(i) = itemN(4);
        elseif (RNitem(i) >= 16 && RNitem(i) <= 20)
            cus_numberOfItems(i) = itemN(5);
        elseif (RNitem(i) >= 21 && RNitem(i) <= 23)
            cus_numberOfItems(i) = itemN(6);
        elseif (RNitem(i) >= 24 && RNitem(i) <= 25)
            cus_numberOfItems(i) = itemN(7);
        elseif (RNitem(i) >= 26 && RNitem(i) <= 29)
            cus_numberOfItems(i) = itemN(8);
        elseif (RNitem(i) >= 30 && RNitem(i) <= 32)
            cus_numberOfItems(i) = itemN(9);
        elseif (RNitem(i) >= 33 && RNitem(i) <= 39)
            cus_numberOfItems(i) = itemN(10);
        elseif (RNitem(i) >= 40 && RNitem(i) <= 46)
            cus_numberOfItems(i) = itemN(11);
        elseif (RNitem(i) >= 47 && RNitem(i) <= 54)
            cus_numberOfItems(i) = itemN(12);
        elseif (RNitem(i) >= 55 && RNitem(i) <= 60)
            cus_numberOfItems(i) = itemN(13);
        elseif (RNitem(i) >= 61 && RNitem(i) <= 65)
            cus_numberOfItems(i) = itemN(14);
        elseif (RNitem(i) >= 66 && RNitem(i) <= 74)
            cus_numberOfItems(i) = itemN(15);
        elseif (RNitem(i) >= 75 && RNitem(i) <= 79)
            cus_numberOfItems(i) = itemN(16);
        elseif (RNitem(i) >= 80 && RNitem(i) <= 83)
            cus_numberOfItems(i) = itemN(17);
        elseif (RNitem(i) >= 84 && RNitem(i) <= 91)
            cus_numberOfItems(i) = itemN(18);
        elseif (RNitem(i) == 92 && RNitem(i) <= 96)
            cus_numberOfItems(i) = itemN(19);
        else
            cus_numberOfItems(i) = itemN(20);
        end
    end
    
    output = cus_numberOfItems;
    
    
    
    
    
    
     