%% To only include the only first two processor sizes and append them to
%y1Vals and y2Vals.
function [y1Vals, y2Vals] = YaxisConstruct(ElementsToGoThrough,SelectedElement, T3, y1Vals, y2Vals)
    if ElementsToGoThrough(1) == SelectedElement
        y1Vals(end+1) = sum(T3); %appending the time to complete the process.
    elseif ElementsToGoThrough(2) == SelectedElement
        y2Vals(end+1) = sum(T3); %appending the time to complete the process.
    end
end