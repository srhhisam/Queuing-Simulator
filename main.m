function output = main()
    
    g = Question();
    cust = customers();
     
     %generating random numbers based on choice 
     RNarrival(1) = 0;
     if (g==1)
        RNarrival = LCG(cust);
        RNserviceT = LCG(cust);
        RNitem = LCG(cust);
        
     elseif (g==2)
        RNarrival = RAND(cust);
        RNserviceT = RAND(cust);
        RNitem = RAND(cust);
         
     end
     
     serviceT = 2:2:12;
     interA = 1:8;
     itemN = 1:20;
     
     tabledisplay(serviceT, interA, itemN);
     RN(RNarrival, RNserviceT, RNitem);
     
     cus_interArrivalTime = CusInterA(cust, RNarrival, interA);    
     cus_numberOfItems = CusItemN(cust, RNitem, itemN);
     totalInterArrivalTime = 0;
     cus_arrivalTime = [];
     
     %Calculate each customer's arrival time
     
     for i=1:cust
         totalInterArrivalTime = totalInterArrivalTime + cus_interArrivalTime(i);
        cus_arrivalTime(end+1) = totalInterArrivalTime;
     end
     
     counter1_n = [];
     counter1_arrivalRN = [];
     counter1_interArrivalTime = [];
     counter1_arrivalTime = [];
     counter1_numberOfItemsRN = [];
     counter1_numberOfItems = [];
     counter1_totalItems = [0];
     counter1_serviceRN = [];
     counter1_serviceTime = [];
     counter1_serviceTimeBegin = [];
     counter1_serviceTimeEnd = [];
     counter1_timeInQueue = [];
     counter1_timeInSystem = [];
    
     counter2_n = [];
     counter2_arrivalRN = [];
     counter2_interArrivalTime = [];
     counter2_arrivalTime = [];
     counter2_numberOfItemsRN = [];
     counter2_numberOfItems = [];
     counter2_totalItems = [0];
     counter2_serviceRN = [];
     counter2_serviceTime = [];
     counter2_serviceTimeBegin = [];
     counter2_serviceTimeEnd = [];
     counter2_timeInQueue = [];
     counter2_timeInSystem = [];
     
     counter3_n = [];
     counter3_arrivalRN = [];
     counter3_interArrivalTime = [];
     counter3_arrivalTime = [];
     counter3_numberOfItemsRN = [];
     counter3_numberOfItems = [];
     counter3_totalItems = [0];
     counter3_serviceRN = [];
     counter3_serviceTime = [];
     counter3_serviceTimeBegin = [];
     counter3_serviceTimeEnd = [];
     counter3_timeInQueue = [];
     counter3_timeInSystem = [];
     
     fprintf('\n');
     for i=1:cust
        totalNumberOfItems = 0;
        %To choose counter
        counter = counters(i, cus_numberOfItems, counter1_totalItems, counter2_totalItems, counter3_totalItems, cus_arrivalTime, counter1_serviceTimeEnd, counter2_serviceTimeEnd, counter3_serviceTimeEnd);
        %If counter1
        if (strcmp(counter, 'counter1'))
             counter1_n(end+1) = i;
             counter1_arrivalRN(end+1) = RNarrival(i);
             counter1_interArrivalTime(end+1) = cus_interArrivalTime(i);
             counter1_arrivalTime(end+1) = cus_arrivalTime(i);
             counter1_numberOfItemsRN(end+1) = RNitem(i);
             counter1_numberOfItems(end+1) = cus_numberOfItems(i);
             
             if (numel(counter1_n)==1)
                 counter1_totalItems(end+1) = cus_numberOfItems(i);
             elseif (counter1_arrivalTime(end) >= counter1_serviceTimeEnd(end))
                 counter1_totalItems(end+1) = cus_numberOfItems(i);
             else
                 for j=numel(counter1_n)-1:-1:1
                    totalNumberOfItems = totalNumberOfItems + counter1_numberOfItems(j+1); 
                    if (counter1_arrivalTime(end) > counter1_serviceTimeEnd(j))  
                        break;
                    end
                 end
                 
                 if (numel(counter1_n)==2)
                     counter1_totalItems(end+1) = totalNumberOfItems + counter1_numberOfItems(end-1);
                 else
                     counter1_totalItems(end+1) = totalNumberOfItems;
                 end
             end
             
             counter1_serviceRN(end+1) = RNserviceT(i);
             counter1_serviceTime(end+1) = Counter1(i, RNserviceT, serviceT);
             
             if (numel(counter1_n)==1)
                 counter1_serviceTimeBegin(end+1) = cus_arrivalTime(i);
             elseif (counter1_arrivalTime(end) < counter1_serviceTimeEnd(end))
                 counter1_serviceTimeBegin(end+1) = counter1_serviceTimeEnd(end);
             else
                 counter1_serviceTimeBegin(end+1) = counter1_arrivalTime(end);
             end
             
             counter1_serviceTimeEnd(end+1) = counter1_serviceTimeBegin(end) + counter1_serviceTime(end);
             
             if (numel(counter1_n)==1)
                 counter1_timeInQueue(end+1) = 0;
             elseif (counter1_arrivalTime(end) > counter1_serviceTimeEnd(end-1))
                 counter1_timeInQueue(end+1) = 0;
             else
                 counter1_timeInQueue(end+1) = counter1_serviceTimeEnd(end-1) - counter1_arrivalTime(end);
             end
             
             counter1_timeInSystem(end+1) = counter1_timeInQueue(end) + counter1_serviceTime(end);
             
             elseif (strcmp(counter, 'counter2'))
             counter2_n(end+1) = i;
             counter2_arrivalRN(end+1) = RNarrival(i);
             counter2_interArrivalTime(end+1) = cus_interArrivalTime(i);
             counter2_arrivalTime(end+1) = cus_arrivalTime(i);
             counter2_numberOfItemsRN(end+1) = RNitem(i);
             counter2_numberOfItems(end+1) = cus_numberOfItems(i);
             
             if (numel(counter2_n)==1)
                 counter2_totalItems(end+1) = cus_numberOfItems(i);
             elseif (counter2_arrivalTime(end) >= counter2_serviceTimeEnd(end))
                 counter2_totalItems(end+1) = cus_numberOfItems(i);
             else
                 for j=numel(counter2_n)-1:-1:1
                    totalNumberOfItems = totalNumberOfItems + counter2_numberOfItems(j+1); 
                    if (counter2_arrivalTime(end) > counter2_serviceTimeEnd(j))
                        break;
                    end
                 end
                 if (numel(counter2_n)==2)
                     counter2_totalItems(end+1) = totalNumberOfItems + counter2_numberOfItems(end-1);
                 else
                     counter2_totalItems(end+1) = totalNumberOfItems;
                 end
             end
             
             counter2_serviceRN(end+1) = RNserviceT(i);
             counter2_serviceTime(end+1) = Counter2(i, RNserviceT, serviceT);
             
             if (numel(counter2_n)==1)
                 counter2_serviceTimeBegin(end+1) = cus_arrivalTime(i);
              elseif (counter2_arrivalTime(end) < counter2_serviceTimeEnd(end))
                 counter2_serviceTimeBegin(end+1) = counter2_serviceTimeEnd(end);
             else
                 counter2_serviceTimeBegin(end+1) = counter2_arrivalTime(end);
             end
             
             counter2_serviceTimeEnd(end+1) = counter2_serviceTimeBegin(end) + counter2_serviceTime(end);
             
             if (numel(counter2_n)==1)
                 counter2_timeInQueue(end+1) = 0;
              elseif (counter2_arrivalTime(end) > counter2_serviceTimeEnd(end-1))
                 counter2_timeInQueue(end+1) = 0;
              else
                 counter2_timeInQueue(end+1) = counter2_serviceTimeEnd(end-1) - counter2_arrivalTime(end);
             end
             
             counter2_timeInSystem(end+1) = counter2_timeInQueue(end) + counter2_serviceTime(end);
             
             else 
             counter3_n(end+1) = i;
             counter3_arrivalRN(end+1) = RNarrival(i);
             counter3_interArrivalTime(end+1) = cus_interArrivalTime(i);
             counter3_arrivalTime(end+1) = cus_arrivalTime(i);
             counter3_numberOfItemsRN(end+1) = RNitem(i);
             counter3_numberOfItems(end+1) = cus_numberOfItems(i);
             
             if (numel(counter3_n)==1)
                 counter3_totalItems(end+1) = cus_numberOfItems(i);
             elseif (counter3_arrivalTime(end) >= counter3_serviceTimeEnd(end))
                 counter3_totalItems(end+1) = cus_numberOfItems(i);
             else
                 for j=numel(counter3_n)-1:-1:1
                    totalNumberOfItems = totalNumberOfItems + counter3_numberOfItems(j+1); 
                    if (counter3_arrivalTime(end) > counter3_serviceTimeEnd(j))
                        break;
                    end
                 end
                 
                 if (numel(counter3_n)==2)
                     counter3_totalItems(end+1) = totalNumberOfItems + counter3_numberOfItems(end-1);
                 else
                     counter3_totalItems(end+1) = totalNumberOfItems;% + cus_numberOfItems(i);
                 end
             end
             
             counter3_serviceRN(end+1) = RNserviceT(i);
             counter3_serviceTime(end+1) = Counter3(i, RNserviceT, serviceT);
             
             if (numel(counter3_n)==1)
                 counter3_serviceTimeBegin(end+1) = cus_arrivalTime(i);
             elseif (counter3_arrivalTime(end) < counter3_serviceTimeEnd(end))
                 counter3_serviceTimeBegin(end+1) = counter3_serviceTimeEnd(end);
             else
                 counter3_serviceTimeBegin(end+1) = counter3_arrivalTime(end);
             end
             
             counter3_serviceTimeEnd(end+1) = counter3_serviceTimeBegin(end) + counter3_serviceTime(end);
             
             if (numel(counter3_n)==1)
                 counter3_timeInQueue(end+1) = 0;
              elseif (counter3_arrivalTime(end) > counter3_serviceTimeEnd(end-1))
                 counter3_timeInQueue(end+1) = 0;
              else
                 counter3_timeInQueue(end+1) = counter3_serviceTimeEnd(end-1) - counter3_arrivalTime(end);
             end     
             
             counter3_timeInSystem(end+1) = counter3_timeInQueue(end) + counter3_serviceTime(end);
             
        end
    end
    
    fprintf('\nTime: \n');
    for i=0:max([counter1_serviceTimeEnd(end), counter2_serviceTimeEnd(end), counter3_serviceTimeEnd(end)])
        for j=1:numel(counter1_n)
            if (counter1_arrivalTime(j) == i)
                fprintf('%-4d: Customer %d arrived at counter 1 \n',i, counter1_n(j));
            end
            if (counter1_serviceTimeBegin(j) == i)
                fprintf('%-4d: Counter 1 has started servicing customer %d \n', i, counter1_n(j));
            end
            if (counter1_serviceTimeEnd(j) == i)
                fprintf('%-4d: Counter 1 has finished servicing customer %d \n', i, counter1_n(j));
            end
        end
        
        for j=1:numel(counter2_n)
            if (counter2_arrivalTime(j) == i)
                fprintf('%-4d: Customer %d arrived at counter 2 \n', i, counter2_n(j));
            end
            if (counter2_serviceTimeBegin(j) == i)
                fprintf('%-4d: Counter 2 has started servicing customer %d \n', i, counter2_n(j));
            end
            if (counter2_serviceTimeEnd(j) == i)
                fprintf('%-4d: Counter 2 has finished servicing customer %d \n', i, counter2_n(j));
            end
        end
        
        for j=1:numel(counter3_n)
            if (counter3_arrivalTime(j) == i)
                fprintf('%-4d: Customer %d arrived at counter 3 \n', i, counter3_n(j));
            end           
            if (counter3_serviceTimeBegin(j) == i)
                fprintf('%-4d: Counter 3 has started servicing customer %d \n', i, counter3_n(j));
            end 
            if (counter3_serviceTimeEnd(j) == i)
                fprintf('%-4d: Counter 3 has finished servicing customer %d \n', i, counter3_n(j));
            end
        end
        
    end
    
    %display the simulation table
    
    fprintf('\n\n');
    fprintf('Counter 1 : NORMAL CHECKOUT 1  \n');
    fprintf('+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+ \n', repmat('-', 1, 5), repmat('-', 1, 9), repmat('-', 1, 15), repmat('-', 1, 9), repmat('-', 1, 11), repmat('-', 1, 10), repmat('-', 1, 17), repmat('-', 1, 9), repmat('-', 1, 9), repmat('-', 1, 12), repmat('-', 1, 10), repmat('-', 1, 9), repmat('-', 1, 9));    
    fprintf('| %-3s | %-7s | %-13s | %-7s | %-9s | %-8s | %-15s | %-7s | %-7s | %-10s | %-8s | %-7s | %-7s | \n', 'n', 'RN', 'Inter-arrival', 'Arrival', 'RN number', 'Number', 'Total number of', 'RN', 'Service', 'Service', 'Service', 'Time in', 'Time in');
    fprintf('| %-3s | %-7s | %-13s | %-7s | %-9s | %-8s | %-15s | %-7s | %-7s | %-10s | %-8s | %-7s | %-7s | \n', '', 'arrival', 'time', 'time', 'of items', 'of items', 'items in queue', 'service', 'time', 'time begin', 'time end', 'queue', 'system');
    fprintf('+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+ \n', repmat('-', 1, 5), repmat('-', 1, 9), repmat('-', 1, 15), repmat('-', 1, 9), repmat('-', 1, 11), repmat('-', 1, 10), repmat('-', 1, 17), repmat('-', 1, 9), repmat('-', 1, 9), repmat('-', 1, 12), repmat('-', 1, 10), repmat('-', 1, 9), repmat('-', 1, 9));    
    for i=1:numel(counter1_n)
        fprintf('| %-3d | %-7d | %-13d | %-7d | %-9d | %-8d | %-15d | %-7d | %-7d | %-10d | %-8d | %-7d | %-7d | \n', counter1_n(i), counter1_arrivalRN(i), counter1_interArrivalTime(i), counter1_arrivalTime(i), counter1_numberOfItemsRN(i), counter1_numberOfItems(i), counter1_totalItems(i+1), counter1_serviceRN(i), counter1_serviceTime(i), counter1_serviceTimeBegin(i), counter1_serviceTimeEnd(i), counter1_timeInQueue(i), counter1_timeInSystem(i));
    end
    fprintf('+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+ \n', repmat('-', 1, 5), repmat('-', 1, 9), repmat('-', 1, 15), repmat('-', 1, 9), repmat('-', 1, 11), repmat('-', 1, 10), repmat('-', 1, 17), repmat('-', 1, 9), repmat('-', 1, 9), repmat('-', 1, 12), repmat('-', 1, 10), repmat('-', 1, 9), repmat('-', 1, 9));    
    
    fprintf('\n');
    fprintf('Counter 2 : NORMAL CHECKOUT 2 \n');
    fprintf('+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+ \n', repmat('-', 1, 5), repmat('-', 1, 9), repmat('-', 1, 15), repmat('-', 1, 9), repmat('-', 1, 11), repmat('-', 1, 10), repmat('-', 1, 17), repmat('-', 1, 9), repmat('-', 1, 9), repmat('-', 1, 12), repmat('-', 1, 10), repmat('-', 1, 9), repmat('-', 1, 9));    
    fprintf('| %-3s | %-7s | %-13s | %-7s | %-9s | %-8s | %-15s | %-7s | %-7s | %-10s | %-8s | %-7s | %-7s | \n', 'n', 'RN', 'Inter-arrival', 'Arrival', 'RN number', 'Number', 'Total number of', 'RN', 'Service', 'Service', 'Service', 'Time in', 'Time in');
    fprintf('| %-3s | %-7s | %-13s | %-7s | %-9s | %-8s | %-15s | %-7s | %-7s | %-10s | %-8s | %-7s | %-7s | \n', '', 'arrival', 'time', 'time', 'of items', 'of items', 'items in queue', 'service', 'time', 'time begin', 'time end', 'queue', 'system');
    fprintf('+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+ \n', repmat('-', 1, 5), repmat('-', 1, 9), repmat('-', 1, 15), repmat('-', 1, 9), repmat('-', 1, 11), repmat('-', 1, 10), repmat('-', 1, 17), repmat('-', 1, 9), repmat('-', 1, 9), repmat('-', 1, 12), repmat('-', 1, 10), repmat('-', 1, 9), repmat('-', 1, 9));    
    for i=1:numel(counter2_n)
        fprintf('| %-3d | %-7d | %-13d | %-7d | %-9d | %-8d | %-15d | %-7d | %-7d | %-10d | %-8d | %-7d | %-7d | \n', counter2_n(i), counter2_arrivalRN(i), counter2_interArrivalTime(i), counter2_arrivalTime(i), counter2_numberOfItemsRN(i), counter2_numberOfItems(i), counter2_totalItems(i+1), counter2_serviceRN(i), counter2_serviceTime(i), counter2_serviceTimeBegin(i), counter2_serviceTimeEnd(i), counter2_timeInQueue(i), counter2_timeInSystem(i));
    end
    fprintf('+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+ \n', repmat('-', 1, 5), repmat('-', 1, 9), repmat('-', 1, 15), repmat('-', 1, 9), repmat('-', 1, 11), repmat('-', 1, 10), repmat('-', 1, 17), repmat('-', 1, 9), repmat('-', 1, 9), repmat('-', 1, 12), repmat('-', 1, 10), repmat('-', 1, 9), repmat('-', 1, 9));    
    
    fprintf('\n');
    fprintf('Counter 3 : EXPRESS CHECKOUT \n');
    fprintf('+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+ \n', repmat('-', 1, 5), repmat('-', 1, 9), repmat('-', 1, 15), repmat('-', 1, 9), repmat('-', 1, 11), repmat('-', 1, 10), repmat('-', 1, 17), repmat('-', 1, 9), repmat('-', 1, 9), repmat('-', 1, 12), repmat('-', 1, 10), repmat('-', 1, 9), repmat('-', 1, 9));    
    fprintf('| %-3s | %-7s | %-13s | %-7s | %-9s | %-8s | %-15s | %-7s | %-7s | %-10s | %-8s | %-7s | %-7s | \n', 'n', 'RN', 'Inter-arrival', 'Arrival', 'RN number', 'Number', 'Total number of', 'RN', 'Service', 'Service', 'Service', 'Time in', 'Time in');
    fprintf('| %-3s | %-7s | %-13s | %-7s | %-9s | %-8s | %-15s | %-7s | %-7s | %-10s | %-8s | %-7s | %-7s | \n', '', 'arrival', 'time', 'time', 'of items', 'of items', 'items in queue', 'service', 'time', 'time begin', 'time end', 'queue', 'system');
    fprintf('+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+ \n', repmat('-', 1, 5), repmat('-', 1, 9), repmat('-', 1, 15), repmat('-', 1, 9), repmat('-', 1, 11), repmat('-', 1, 10), repmat('-', 1, 17), repmat('-', 1, 9), repmat('-', 1, 9), repmat('-', 1, 12), repmat('-', 1, 10), repmat('-', 1, 9), repmat('-', 1, 9));    
    for i=1:numel(counter3_n)
        fprintf('| %-3d | %-7d | %-13d | %-7d | %-9d | %-8d | %-15d | %-7d | %-7d | %-10d | %-8d | %-7d | %-7d | \n', counter3_n(i), counter3_arrivalRN(i), counter3_interArrivalTime(i), counter3_arrivalTime(i), counter3_numberOfItemsRN(i), counter3_numberOfItems(i), counter3_totalItems(i+1), counter3_serviceRN(i), counter3_serviceTime(i), counter3_serviceTimeBegin(i), counter3_serviceTimeEnd(i), counter3_timeInQueue(i), counter3_timeInSystem(i));
    end
    fprintf('+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+%s+ \n', repmat('-', 1, 5), repmat('-', 1, 9), repmat('-', 1, 15), repmat('-', 1, 9), repmat('-', 1, 11), repmat('-', 1, 10), repmat('-', 1, 17), repmat('-', 1, 9), repmat('-', 1, 9), repmat('-', 1, 12), repmat('-', 1, 10), repmat('-', 1, 9), repmat('-', 1, 9));    
    
    %displaying data
    
    averageCusInterArrivalTime = cus_arrivalTime(end) / (cust-1);
    numberOfQueueTime = 0;
    for i=1:numel(counter1_n)
        if (counter1_timeInQueue(i) >= 1)
            numberOfQueueTime = numberOfQueueTime + 1;
        end
    end
    for i=1:numel(counter2_n)
        if (counter2_timeInQueue(i) >= 1)
            numberOfQueueTime = numberOfQueueTime + 1;
        end
    end
    for i=1:numel(counter3_n)
        if (counter3_timeInQueue(i) >= 1)
            numberOfQueueTime = numberOfQueueTime + 1;
        end
    end    
    probabilityCusTimeInQueue = numberOfQueueTime / cust;
    queueTime1 = 0;
    for i=1:numel(counter1_n)
        queueTime1 = queueTime1 + counter1_timeInQueue(i);
    end
    counter1_averageTimeInQueue = queueTime1 / numel(counter1_n);
    queueTime2 = 0;
   for i=1:numel(counter2_n)
        queueTime2 = queueTime2 + counter2_timeInQueue(i);
    end
    counter2_averageTimeInQueue = queueTime2 / numel(counter2_n);
    queueTime3 = 0;
    for i=1:numel(counter3_n)
        queueTime3 = queueTime3 + counter3_timeInQueue(i);
    end
    counter3_averageTimeInQueue = queueTime3 / numel(counter3_n);
    averageTimeInQueue = (queueTime1 + queueTime2 + queueTime3) / cust;
    serviceTime1 = 0;
    for i=1:numel(counter1_n)
        serviceTime1 = serviceTime1 + counter1_serviceTime(i);
    end
    counter1_averageServiceTime = serviceTime1 / numel(counter1_n);
    serviceTime2 = 0;
    
    for i=1:numel(counter2_n)
        serviceTime2 = serviceTime2 + counter2_serviceTime(i);
    end
    counter2_averageServiceTime = serviceTime2 / numel(counter2_n);
    serviceTime3 = 0;
    
    for i=1:numel(counter3_n)
        serviceTime3 = serviceTime3 + counter3_serviceTime(i);
    end
    counter3_averageServiceTime = serviceTime3 / numel(counter3_n);
    averageServiceTime = (serviceTime1 + serviceTime2 + serviceTime3) / cust;
    timeInSystem = 0;
    
    for i=1:numel(counter1_n)
        timeInSystem = timeInSystem + counter1_timeInSystem(i);
    end
    %Repeat for each customer in counter2
    for i=1:numel(counter2_n)
        timeInSystem = timeInSystem + counter2_timeInSystem(i);
    end
    %Repeat for each customer in counter3
    for i=1:numel(counter3_n)
        timeInSystem = timeInSystem + counter3_timeInSystem(i);
    end
    averageTimeInSystem = timeInSystem / cust;
    serviceTimeEnd1 = 0;
    if (numel(counter1_n) >= 1)
        serviceTimeEnd1 = counter1_serviceTimeEnd(end);
    end
    serviceTimeEnd2 = 0;
    if (numel(counter2_n) >= 1)
        serviceTimeEnd2 = counter2_serviceTimeEnd(end);
    end
    serviceTimeEnd3 = 0;
   if (numel(counter3_n) >= 1)
        serviceTimeEnd3 = counter3_serviceTimeEnd(end);
    end
    
    counter1_percentageTimeUnavailable = serviceTime1 / max([serviceTimeEnd1, serviceTimeEnd2, serviceTimeEnd3]) * 100;
    counter2_percentageTimeUnavailable = serviceTime2 / max([serviceTimeEnd1, serviceTimeEnd2, serviceTimeEnd3]) * 100;
    counter3_percentageTimeUnavailable = serviceTime3 / max([serviceTimeEnd1, serviceTimeEnd2, serviceTimeEnd3]) * 100;
    
    
    fprintf('\n\n');
    fprintf('%s \n', repmat('-', 1, 148));
    fprintf('Average customer inter-arrival time = %.3f \n', averageCusInterArrivalTime);
    fprintf('%s \n', repmat('-', 1, 148));
    fprintf('Probability that a customer has to wait in queue = %.3f \n', probabilityCusTimeInQueue);
    fprintf('%s \n', repmat('-', 1, 148));
    %If customer count in counter1 more than or equals to 1
    if (numel(counter1_n) >=1 )
        fprintf('Average waiting time for counter1 = %.3f \n', counter1_averageTimeInQueue);
    end
    %If customer count in counter2 more than or equals to 1
    if (numel(counter2_n) >=1 )
        fprintf('Average waiting time for counter2 = %.3f \n', counter2_averageTimeInQueue);
    end
    %If customer count in counter3 more than or equals to 1
    if (numel(counter3_n) >=1 )
        fprintf('Average waiting time for counter3 = %.3f \n', counter3_averageTimeInQueue);    
    end
    fprintf('Average waiting time for all counter = %.3f \n', averageTimeInQueue);
    fprintf('%s \n', repmat('-', 1, 148));
    %If customer count in counter1 more than or equals to 1
    if (numel(counter1_n) >=1 )
        fprintf('Average service time for counter1 = %.3f \n', counter1_averageServiceTime);
    end
    %If customer count in counter2 more than or equals to 1
    if (numel(counter2_n) >=1 )
        fprintf('Average service time for counter2 = %.3f \n', counter2_averageServiceTime);
    end
    %If customer count in counter3 more than or equals to 1
    if (numel(counter3_n) >=1 )
        fprintf('Average service time for counter3 = %.3f \n', counter3_averageServiceTime);    
    end
    fprintf('Average service time for all counter = %.3f \n', averageServiceTime);
    fprintf('%s \n', repmat('-', 1, 148));
    fprintf('Average time spent in system = %.3f \n', averageTimeInSystem);
    fprintf('%s \n', repmat('-', 1, 148));
    %If customer count in counter1 more than or equals to 1
    if (numel(counter1_n) >=1 )
        fprintf('Percentage of time counter1 was busy = %.2f%% \n', counter1_percentageTimeUnavailable);
    end
    %If customer count in counter2 more than or equals to 1
    if (numel(counter2_n) >=1 )
        fprintf('Percentage of time counter2 was busy = %.2f%% \n', counter2_percentageTimeUnavailable);
    end
    %If customer count in counter 3 more than or equals to 1
    if (numel(counter3_n) >=1 )
        fprintf('Percentage of time counter3 was busy = %.2f%% \n', counter3_percentageTimeUnavailable);    
    end
    fprintf('%s \n', repmat('-', 1, 148));
    
    
    fprintf('\nEnd of Simulation. ThankYou For Shopping With Us Cyberjaya Supermarket <3 \n');
        
 