% Get maximum open and close index

indexSavePath = strrep(motionDataCSVFilePath, '.csv', '_index.mat');

% Open data cursor mode
dcm_obj = datacursormode(gcf);
dcm_obj.Enable = 'on';
dcm_obj.DisplayStyle = 'datatip';

info = getCursorInfo(dcm_obj);

indexCount = [];
for i = 1:length(info)
    indexCount = [indexCount; info(i).DataIndex];
end
indexCount = sort(indexCount);

% 
if length(indexCount) ~= 15
    disp('check the count of points');
else
    m_oralTaskIndex = struct();

    m_oralTaskIndex.startCycle1  = [indexCount(1), indexCount(2)];
    m_oralTaskIndex.returnCycle1 = [indexCount(2), indexCount(3)];

    m_oralTaskIndex.startCycle2  = [indexCount(4), indexCount(5)];
    m_oralTaskIndex.returnCycle2 = [indexCount(5), indexCount(6)];
    
    m_oralTaskIndex.startCycle3  = [indexCount(7), indexCount(8)];
    m_oralTaskIndex.returnCycle3 = [indexCount(8), indexCount(9)];
    
    m_oralTaskIndex.startCycle4  = [indexCount(10), indexCount(11)];
    m_oralTaskIndex.returnCycle4 = [indexCount(11), indexCount(12)];
    
    m_oralTaskIndex.startCycle5  = [indexCount(13), indexCount(14)];
    m_oralTaskIndex.returnCycle5 = [indexCount(14), indexCount(15)];

    save(indexSavePath, 'm_oralTaskIndex');

    fprintf('%s\r save successful...\r', indexSavePath);
end
