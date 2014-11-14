% check current values
for idx = 1:5, 
    potValues(idx) = analogSlowRead(a, idx);
    fprintf('Pot value for %s motor (ID=%d) is %g. Its range is [%g %g]\n', ...
        motorNames{idx}, idx, potValues(idx), potRange(idx,:));
end

