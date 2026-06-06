csvPath = "/Users/yifanxu/Vscode/DegradationModeAnalysis/InputData/MySiGr/BAK4695_BoL_NE_C100_OCP_delith_norm.csv";
outMat  = "/Users/yifanxu/Vscode/DegradationModeAnalysis/InputData/MySilicon.mat";

T = readtable(csvPath);

% 兼容有表头和无表头两种 CSV：优先用列名，否则退回前两列
if all(ismember(["Ewe","capacity_norm"], string(T.Properties.VariableNames)))
	v = T.Ewe;
	q = T.capacity_norm;
else
	v = T{:,1};
	q = T{:,2};
end

mask = isfinite(v) & isfinite(q);
v = v(mask); q = q(mask);

s = struct();
s.voltage = v(:);
s.normalizedCapacity = q(:);

save("/Users/yifanxu/Vscode/DegradationModeAnalysis/InputData/MySiGr/bak4695_delith.mat", "s", "-mat");

fprintf("Saved %s: N=%d, V=[%.4f, %.4f]\n", "/Users/yifanxu/Vscode/DegradationModeAnalysis/InputData/MySiGr/bak4695_delith.mat", numel(s.voltage), min(s.voltage), max(s.voltage));
