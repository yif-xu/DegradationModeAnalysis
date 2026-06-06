figure; hold on;
P45B_deli=load('/Users/yifanxu/Vscode/DegradationModeAnalysis/input_data/silicon-graphite/P45B_Anode_Delithiation_0C03.mat')
P45B_li=load('/Users/yifanxu/Vscode/DegradationModeAnalysis/input_data/silicon-graphite/P45B_Anode_Lithiation_0C03.mat')
plot(s_lith.s.normalizedCapacity, s_lith.s.voltage, '-b', 'LineWidth', 1.2, 'DisplayName', 'lith');
plot(s_delith.s.normalizedCapacity, s_delith.s.voltage,  '-r', 'LineWidth', 1.2, 'DisplayName', 'delith');
plot(P45B_deli.P45B_Anode_Delithiation_0C03.normalizedCapacity, P45B_deli.P45B_Anode_Delithiation_0C03.voltage, '-g', 'LineWidth', 1.2, 'DisplayName', 'P45B-delith');
plot(P45B_li.P45B_Anode_Lithiation_0C03.normalizedCapacity, P45B_li.P45B_Anode_Lithiation_0C03.voltage, '-m', 'LineWidth', 1.2, 'DisplayName', 'P45B-lith');
xlabel('Normalized Capacity');
ylabel('Voltage (V)');
legend('Location','best');
grid on; title('Normalized Capacity vs Voltage');
hold off;