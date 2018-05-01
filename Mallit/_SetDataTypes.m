data = 'fixdt(1,24,23)';
for i = 0:200
    try
        set_param(strcat('Filter_Fixed/LowpassH/Resonator',num2str(i),'/GainH'),'OutDataTypeStr',data); 
        set_param(strcat('Filter_Fixed/LowpassH/Resonator',num2str(i),'/Gain'),'OutDataTypeStr',data); 
        set_param(strcat('Filter_Fixed/LowpassH/Resonator',num2str(i),'/Sum1'),'SaturateOnIntegerOverflow','on');
    catch
       
    end
      try
        set_param(strcat('Filter_Fixed/BandpassH/Resonator',num2str(i),'/GainH'),'OutDataTypeStr',data); 
        set_param(strcat('Filter_Fixed/BandpassH/Resonator',num2str(i),'/Gain'),'OutDataTypeStr',data); 
        set_param(strcat('Filter_Fixed/LowpassH/Resonator',num2str(i),'/Sum1'),'SaturateOnIntegerOverflow','on');
    catch
       
      end
    try
        set_param(strcat('Filter_Fixed/HighpassH/Resonator',num2str(i),'/GainH'),'OutDataTypeStr',data); 
        set_param(strcat('Filter_Fixed/HighpassH/Resonator',num2str(i),'/Gain'),'OutDataTypeStr',data); 
        set_param(strcat('Filter_Fixed/LowpassH/Resonator',num2str(i),'/Sum1'),'SaturateOnIntegerOverflow','on');
    catch
       
    end
end