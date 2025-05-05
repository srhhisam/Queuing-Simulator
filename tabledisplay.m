function output = tabledisplay(serviceT, interA, itemN)
    
    counter1_probability = [0.10, 0.10, 0.15, 0.25, 0.20, 0.20];
    counter1_CDF = [0.10, 0.20, 0.35, 0.60, 0.80, 1];
    counter1_range = {'1-10', '11-20', '21-35', '36-60', '61-80', '81-100'};
    
    counter2_probability = [0.10, 0.05, 0.15, 0.20, 0.25, 0.25];
    counter2_CDF = [0.10, 0.15, 0.30, 0.50, 0.75, 1];
    counter2_range = {'1-10', '11-15', '16-30', '31-50', '51-75', '76-100'};
    
    counter3_probability = [0.05, 0.10, 0.25, 0.20, 0.25, 0.15];
    counter3_CDF = [0.05, 0.15, 0.40, 0.60, 0.85, 1];
    counter3_range = {'1-5', '6-15', '16-40', '41-60', '61-85', '90-100'};
    
    arrivalProbability = [0.10, 0.15, 0.20, 0.15, 0.15, 0.10, 0.10, 0.05];
    arrivalCDF = [0.10, 0.25, 0.45, 0.60, 0.75, 0.85, 0.95, 1];
    arrivalRange = {'1-10', '11-25', '26-45', '46-60', '61-75', '76-85', '86-95', '96-100'};
    
    itemProbability = [0.05, 0.02, 0.06, 0.02, 0.05, 0.03, 0.02, 0.04, 0.03, 0.07, 0.07, 0.08, 0.06, 0.05, 0.09, 0.05, 0.04, 0.08, 0.05, 0.04];
    itemCDF = [0.05, 0.07, 0.13, 0.15, 0.20, 0.23, 0.25, 0.29, 0.32, 0.39, 0.46, 0.54, 0.60, 0.65, 0.74, 0.79, 0.83, 0.91, 0.96, 1];
    itemRange = {'1-5', '6-7', '8-13', '14-15', '16-20', '21-23', '24-25', '26-29', '30-32', '33-39', '40-46', '47-54', '55-60', '61-65', '66-74', '75-79', '80-83', '84-91', '92-96', '97-100', };

    %displaying
    
    fprintf('\n');
    fprintf('Counter 1 : Normal Checkout 1 \n');
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 16), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));    
    fprintf('|  %-12s  |  %-11s  |  %-4s  |  %-6s  |\n', 'Service Time', 'Probability', 'CDF', 'Range');
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 16), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));
    for i = 1:numel(serviceT)
        fprintf('|  %-12d  |  %-11.2f  |  %-4.2f  |  %-6s  |\n', serviceT(i), counter1_probability(i), counter1_CDF(i), counter1_range{i});
    end
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 16), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));
    
    fprintf('\n');
    fprintf('Counter 2 : Normal Checkout 2 \n');
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 16), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));    
    fprintf('|  %-12s  |  %-11s  |  %-4s  |  %-6s  |\n', 'Service Time', 'Probability', 'CDF', 'Range');
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 16), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));
    for i = 1:numel(serviceT)
        fprintf('|  %-12d  |  %-11.2f  |  %-4.2f  |  %-6s  |\n', serviceT(i), counter2_probability(i), counter2_CDF(i), counter2_range{i});
    end
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 16), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));
    
    fprintf('\n');
    fprintf('Counter 3 : Express Checkout \n');
    fprintf('(Express counter for customers with less than or equals to 10 items) \n');
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 16), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));    
    fprintf('|  %-12s  |  %-11s  |  %-4s  |  %-6s  |\n', 'Service Time', 'Probability', 'CDF', 'Range');
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 16), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));
    for i = 1:numel(serviceT)
        fprintf('|  %-12d  |  %-11.2f  |  %-4.2f  |  %-6s  |\n', serviceT(i), counter3_probability(i), counter3_CDF(i), counter3_range{i});
    end
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 16), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));
    
    fprintf('\n');
    fprintf('Inter-arrival Time : \n');
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 22), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));    
    fprintf('|  %-18s  |  %-11s  |  %-4s  |  %-6s  |\n', 'Inter-arrival Time', 'Probability', 'CDF', 'Range');
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 22), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));
    for i = 1:numel(interA)
        fprintf('|  %-18d  |  %-11.2f  |  %-4.2f  |  %-6s  |\n', interA(i), arrivalProbability(i), arrivalCDF(i), arrivalRange{i});
    end
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 22), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));
    
    fprintf('\n');
    fprintf('Number Of Items Acquired : \n');
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 19), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));    
    fprintf('|  %-15s  |  %-11s  |  %-4s  |  %-6s  |\n', 'Number of Items', 'Probability', 'CDF', 'Range');
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 19), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));
    for i = 1:numel(itemN)
        fprintf('|  %-15d  |  %-11.2f  |  %-4.2f  |  %-6s  |\n', itemN(i), itemProbability(i), itemCDF(i), itemRange{i});
    end
    fprintf('+%s+%s+%s+%s+ \n', repmat('-', 1, 19), repmat('-', 1, 15), repmat('-', 1, 8), repmat('-', 1, 10));
    
    
    
    
   

    
    