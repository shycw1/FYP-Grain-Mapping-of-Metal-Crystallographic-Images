classdef Map
    %MAPSIZE Summary of this class goes here
    %   Detailed explanation goes here
    properties
      x=1e-3;
      y=1e-3;
      VelocityUpper = 3200;
      VelocityLower = 2400;
      Original_num_of_dots = 700;
      centroid_x;
      centroid_y;
      centroid_coordinates;
      centroid_vertices;
      centroid_cells;
    end
    
    methods
        function obj =  Map(x, y, VLower, Vupper)
            obj.x = x;
            obj.y = y;
            obj.VelocityUpper = Vupper;
            obj.VelocityLower = VLower;
        end
        
        function obj = setNumberOfDots(obj, num)
            obj.Original_num_of_dots = num;
        end
        
        function obj = defineCentroids(obj, seed)
            obj.centroid_coordinates = gallery('uniformdata',[obj.Original_num_of_dots 2],seed);
            obj.centroid_x = obj.centroid_coordinates(:,1);
            obj.centroid_y = obj.centroid_coordinates(:,2);
        end
        
        function obj = createVoronoin(obj)
            [vertices,cells] = voronoin(obj.centroid_coordinates);
            obj.centroid_vertices = vertices;
            obj.centroid_cells = cells;
        end
        
        

    end
end

