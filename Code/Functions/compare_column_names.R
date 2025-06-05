#Now here's a function I created with help from chatGPT, that takes a List in which
#each element is a vector of column names (such as created by the function `col_names_to_List`
#and conducts pairwise comparisons all of all of the elements of the list to see
#if column names between files are different or not. It returns a data frame that
#provides each pair of files and a boolean true or false on whether the vectors
#are the same.

compare_column_names <- function(colname_list, file_names) {
  #pass a list where each element is a vector of column names from a different file and, as second argument, a vector with all the file names, in the same order as they occur in the list.

  # Ensure the file name vector matches the list length
  if (length(colname_list) != length(file_names)) {
    stop("Length of file_names must match length of colname_list.")
  }

  # Get all unique index pairs
  combos <- combn(seq_along(colname_list), 2, simplify = FALSE)

  # Compare each pair
  results <- lapply(combos, function(pair) {
    i <- pair[1]
    j <- pair[2]

    is_same <- identical(colname_list[[i]], colname_list[[j]])

    data.frame(
      `file 1` = file_names[i],
      `file 2` = file_names[j],
      same_columns = is_same,
      stringsAsFactors = FALSE
    )
  })

  # Combine into a single data frame
  results_df <- do.call(rbind, results)

  return(results_df) #retuns a dataframe with results of comparisons
}

