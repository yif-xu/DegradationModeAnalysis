csvPath = "/Users/yifanxu/Vscode/DegradationModeAnalysis/InputData/MySiGr/bak4690_ici-ocv_neg_lith.csv";
outMat  = "/Users/yifanxu/Vscode/DegradationModeAnalysis/InputData/MySiGr/lith.mat";

T = readtable(csvPath, "Delimiter",";", "ReadVariableNames",false);

% 这里假设 Var2=voltage, Var1=capacity（和你之前一致）
v = str2double(replace(string(T.Var2), ",", "."));
q = str2double(replace(string(T.Var1), ",", "."));

mask = isfinite(v) & isfinite(q);
v = v(mask); q = q(mask);

s = struct();
s.voltage = v(:);
s.normalizedCapacity = q(:);

save(outMat, "s", "-mat");

fprintf("Blend saved: N=%d, V=[%.4f, %.4f]\n", numel(s.voltage), min(s.voltage), max(s.voltage));
