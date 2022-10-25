function [] = showSphere(G,radius,fontsize)
[r,c,z1] = find(G);
%markerColors = jet(numel(G));
for i=1:numel(G)
    % Make unit sphere
    [x,y,z] = sphere(20);
    
    % Scale to desire radius.
    x = x * radius;
    y = y * radius;
    z = z * radius;
    % Translate sphere to new location.
    %offset = r(i), c(i), z1(i);
    % Plot as surface.
    surf(x+r(i),y+c(i),z+z1(i),'FaceColor', C(z1(i),:)) 
    pbaspect([1 1 1])
    % Label axes.
    xlabel('X', 'FontSize', fontsize);
    ylabel('Y', 'FontSize', fontsize);
    zlabel('\lambda', 'FontSize', fontsize);
    axis equal;
    hold on
end
colormap jet;
view(40,35)
%view(0,90)
grid on;
end
