 #Implement a block method to run a transformation on the image
 #^Block method is a way to group statements next to a method call..(remembers context in which it appears..--the local variables, the current object, etc.)

#^This transformation to cause any of the "1s" in the image to cause the pixels to the left, right, above, and below to become a "1" -- (only focus on values of "0s" and "1s")</>

#Once the array is defined (Image Blur 1) manipulate it 
#^Need to hold the index "coordinates" to reference the pre-blur "1s" before blurring calling the image...account for length of row(s)?
#^For every row, save/reference where each "1" occurs within the row..index these coordinates?



#IMAGE BLUR 1 & IMAGE BLUR 2

class Image     #Define the class...build a representation of an image, being able to build one and lure all of the details of what it actually is

  def initialize(array)  #Initialize...allows to accept additional information when building up/displaying a new image.  When building up this image...tell it about the specific array that it has (line 40 below)
    @image = array   #Instance variable setting up the image to be the value of array.  "Stringing the values for array" will set up the variables that are referenced in different functions/methods.
    @coordinates = []
  end

  def output_image  #Build this method (data stored) and expose it -->output image
    @image.each do |row|
      puts row.join  #"Puts" the value of what it actually is...so the value of each row and joins (combines them)
    end
  end

  def blur
      @image.each_with_index do |row, row_number|
        # puts row_number
        # puts '-----------------'
        row.each_with_index do |element, column_number|
          # puts column_number                
          # puts '-----------------'
          # save these coordinates for any index with the value of 1
          # if statement to check each value for 1
          if element == 1
            # push to @ coordinates
            @coordinates.push([row_number, column_number])
          end
        end
      end
      puts @coordinates
      #calling these stored "1s" and blurring the coordinates around them..changing the value of any 0 that is next to a 1 to a 1
      #Loop through image array and access rows and subarrays to access the 1s
      @image.each_with_index do |row, row_number|
        row.each_with_index do |element, column_number|
          #going through rows and columns
          #iterate through the coordinates array
            @coordinates.each do |x_coordinate, y_coordinate|
              #puts "-------------------"
               #puts x_coordinate  
               #puts y_coordinate
              #puts "-------------------"
              #need to check if row number and column number are equal to x coordinate and y coordinate
              if row_number == x_coordinate && column_number == y_coordinate
                #change the 0s around the 1s to 1
                #changing the value of any 0 that is next to a 1 to a 1
                #this is an example to change an element
                #values[1][1] = 500   

                @width = @image[0].count
                @height = @image.count

                  #row_number [+1] column_number  
                  @image [row_number +1][column_number] = 1 unless row_number >= @height -1 #down
                  #row_number [-1] column_number
                  @image [row_number -1][column_number] = 1 unless row_number == 0 #up
                  #column_number [+1] row_number
                  @image [row_number][column_number +1] = 1 unless column_number >= @width -1 #right
                  #column_number [-1] row_number
                  @image [row_number][column_number -1] = 1 unless column_number == 0 #left


                    #if (element == 0)
                      #element = 1   
                    #puts 1  #will this change 0s to 1s if found as 0?
                    #end
        
              end
      
            end
        end 
      end
       @image.each do |data|
        puts data.join    
      end        

    end
  end


image = Image.new([  #Building up an image and telling it specifically what to be.  This is a concept of an image and a specific case of this image in an array.
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.blur