function output = counters(i, cus_numberOfItems, counter1_totalItems, counter2_totalItems, counter3_totalItems, cus_arrivalTime, counter1_serviceTimeEnd, counter2_serviceTimeEnd, counter3_serviceTimeEnd);
           
    counter1_Items = counter1_totalItems(end);
    
    if (numel(counter1_serviceTimeEnd) >= 1)
        if (cus_arrivalTime(i) >= counter1_serviceTimeEnd(end))
            counter1_Items = 0;
        end
    end
    
    counter2_Items = counter2_totalItems(end);
    if (numel(counter2_serviceTimeEnd) >= 1)
        if (cus_arrivalTime(i) >= counter2_serviceTimeEnd(end))
            counter2_Items = 0;
        end
    end
    
    counter3_Items = counter3_totalItems(end);
    if (numel(counter3_serviceTimeEnd) >= 1)
        if (cus_arrivalTime(i) >= counter3_serviceTimeEnd(end))
            counter3_Items = 0;
        end
    end
    
    minVariable = {};
    
        if (cus_numberOfItems(i) >= 1 && cus_numberOfItems(i) <=10)
            minValue = min([counter1_Items, counter2_Items, counter3_Items]);
            
            if (minValue == counter1_Items)
                minVariable{end+1} = 'counter1';
            end
            if (minValue == counter2_Items)
                minVariable{end+1} = 'counter2';
            end       
            if (minValue == counter3_Items)
                minVariable{end+1} = 'counter3';
            end    
                
            if (numel(minVariable) > 1)
                minIndex = round((numel(minVariable)-1) * rand()) + 1;
            else
                minIndex = 1;
            end
            
            if (minVariable{minIndex} == 'counter1')
                output = 'counter1';
            elseif (minVariable{minIndex} == 'counter2')
                output = 'counter2';
            else
                output = 'counter3';
            end
        else          
            minValue = min([counter1_Items, counter2_Items]);
            
            if (minValue == counter1_Items)
                minVariable{end+1} = 'counter1';
            end
             if (minValue == counter2_Items)
                minVariable{end+1} = 'counter2';
            end       
                
            if (numel(minVariable) > 1)
                minIndex = round((numel(minVariable)-1) * rand()) + 1;
            else
                minIndex = 1;
            end
            
            if (minVariable{minIndex} == 'counter1')
                output = 'counter1';
             else
                output = 'counter2';
            end
            
        end  

