# Matrix in R
study_hours = c(89, 69, 45, 75, 63,54, 23, 25, 57, 46)
subject_marks = c(79, 53, 71, 57, 63, 54, 74, 77, 61, 69)

# Creating a matrix just using study_hours
stu_hourds_mat = matrix(study_hours)
stu_hourds_mat
study_hours

# Joining two columns in a matrix 
student_data = c(study_hours, subject_marks)
student_data
student_matrix = matrix(student_data)
student_matrix

student_matrix = matrix(student_data, byrow = FALSE, nrow = 10)
student_matrix

# Naming rows and columns 
colnames(student_matrix) = c('Hours', 'Marks')
student_matrix
row.names(student_matrix) = c(1:10)
student_matrix


# Selecting an element from matrix [row num, column num]
student_matrix[4, 1]
student_matrix[7, 2]

summary(student_matrix)

# DATA FRAMES IN R
student_names = c('Mr1', 'Ms2', 'Ms3', 'Mr4', 'Ms5')
study_hours = c(89, 69, 45, 75, 63)
