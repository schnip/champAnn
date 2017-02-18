function [ means, classes, distances ] = iterativeDistance( means, classes, img, distances, rows, col, k, red, green, blue )

% global rows col k red green blue

for i=1:rows
    for j=1:col
        var = double(img(i,j,:));
        var = var(:)';
        var = repmat(var,k,1);
        diff = means(:,:) - var;
%         diff = double(img(i,j,:)) - double(means(:,:));
        distances(:,1) = sqrt(sum(diff.^2,2));
        maxdistance = find(max(distances(:,1))==distances(:,1));
        if(size(maxdistance)>2)
            classes(i,j) = maxdistance(3);
        elseif(size(maxdistance)>1)
            classes(i,j) = maxdistance(2);
        else
            classes(i,j) = maxdistance(1);
        end
    end
end

for m = 1:k
    numPixels = sum(sum(classes==m));
    if(numPixels ~= 0) 
        means(m,1) = sum(sum(red(classes==m)))/numPixels;
        means(m,2) = sum(sum(green(classes==m)))/numPixels;
        means(m,3) = sum(sum(blue(classes==m)))/numPixels;
    end
end


end

