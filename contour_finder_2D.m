
function [ contour_matrix ] = contour_finder_2D( picture, threshold )
%------------------------------------------------------------------------%
%contour_finder_2D - contour finder function 
%
% Author, date:
%   -Emanuele Sansebastiano, October 2017
%........................................................................%
%
% Input data:
%   - picture [RGB, or R, G, B, grayscale]
%   - threshold for the derivative
%      
% Output:
%   - boolean contour matrix (2D)
%
% Comments:
%   - If the picture is in RGB, it is pre-processed to grayscale
%   
%------------------------------------------------------------------------%

%% Check section
n_dim = size(size(picture),2); % matrix dimensions
if n_dim <= 1
    error('The input picture (matrix) has some problems. Even integer numbers have at least 2 dimensions, while this picture has less dimensions');
elseif n_dim == 2
    if size(picture,1)*size(picture,2) == 1
        warning('The input picture is composed by only one integer!');
    else
        if size(picture,1) == 1 || size(picture,2) == 1
            warning('The input picture is composed by only one line!');
        end
    end
elseif n_dim >= 4
    error('This function can process just 2D pictures [max size(picture) == 3 / multichannel ; min size(picture) == 2 / monochannel]');
end

%% Indentification input picture: RGB or monochallel (R, G, B, or grayscale)

if n_dim == 3
    picture = rgb2gray(picture);
end
clear n_dim;

%% Main
siz_2D = size(picture);
partial_output = zeros(siz_2D(1,1)-1,siz_2D(1,2)-1);

%first (with noise)
for x = 1 : siz_2D(1,1)-1
    for y = 1 : siz_2D(1,2)-1
        
        %derivative and threshold comparison
        if abs(picture(x,y) - picture(x,y+1)) >= threshold
            partial_output(x,y) = 1;
            continue;
        end
        if abs(picture(x,y) - picture(x+1,y)) >= threshold
            partial_output(x,y) = 1;
            continue;
        end        
        if abs(picture(x,y) - picture(x+1,y+1)) >= threshold
            partial_output(x,y) = 1;
            continue;
        end        
        
    end
end

temp_pic = zeros(siz_2D(1,1)-2,siz_2D(1,2)-2);
temp_pic(:,:) = partial_output(2:siz_2D(1,1)-1,2:siz_2D(1,2)-1);
clear partial_output;
partial_output = temp_pic;
clear temp_pic;







contour_matrix = partial_output;
end