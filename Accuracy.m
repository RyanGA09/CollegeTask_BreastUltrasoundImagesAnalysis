function [sensitivity, specificity, accuracy, fpr, fnr] = Accuracy(R1, R2, m, n)
    tp = 0;
    tn = 0;
    fn = 0;
    fp = 0;

    for i = 1 : m
        for j = 1 : n
            if R1(i, j) >= 90 && R2(i, j) >= 200
                tp = tp + 1;
            elseif R1(i, j) >= 90 && R2(i, j) < 255
                fn = fn + 1;
            elseif R1(i, j) < 216 && R2(i, j) >= 200
                fp = fp + 1;
            else
                tn = tn + 1;
            end
        end
    end

    sensitivity = tp / (tp + fn);
    specificity = tn / (fp + tn);
    accuracy = (tp + tn) / (tp + tn + fp + fn);
    fpr = fp / (tp + tn + fp + fn);
    fnr = fn / (tp + tn + fp + fn);
    
    % Display the results
    fprintf('TP = %d\n', tp);
    fprintf('FN = %d\n', fn);
    fprintf('FP = %d\n', fp);
    fprintf('TN = %d\n', tn);
end