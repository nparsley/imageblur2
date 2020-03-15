class Image     
  def initialize(array)  
    @image = array   
    @coordinates = []
  end

  def output_image  
    @image.each do |row|
      puts row.join  
    end
  end

  def blur
      @image.each_with_index do |row, row_number|
        row.each_with_index do |element, column_number|
          if element == 1      
            @coordinates.push([row_number, column_number])
          end
        end
      end
      puts @coordinates

      @image.each_with_index do |row, row_number|
        row.each_with_index do |element, column_number|
            @coordinates.each do |x_coordinate, y_coordinate|
              if row_number == x_coordinate && column_number == y_coordinate
                @width = @image[0].count
                @height = @image.count     
                  @image [row_number +1][column_number] = 1 unless row_number >= @height -1  
                  @image [row_number -1][column_number] = 1 unless row_number == 0
                  @image [row_number][column_number +1] = 1 unless column_number >= @width -1 
                  @image [row_number][column_number -1] = 1 unless column_number == 0 
              end           
            end
        end 
      end
       @image.each do |data|
        puts data.join    
      end        
    end
  end



image = Image.new([ 
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.blur