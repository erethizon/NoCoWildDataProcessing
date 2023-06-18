Research update 18 June 2023

I have been in Lake Placid all week working on code and data analysis.

Currently, I am working on trying to get final animal classifications for the game camera data up until this point. 

I've been working on the species identification workflow 16995 and have created a file in the Output --> PostZooniverse folder called "check_species_wkflw16995-2023-06-13"
This is the file that isolates those events that did not have a consensus species ID. I then open that CSV file and use it to go through images in their respective
folders on the NoCoWild hard drive to determine a final assignment. As of 18 June 2023, I have gone through the parts of this file from 2021. Next need to do 2022. 

I am also in the process of using the zooniverse to go through all of the human classification files so that I can download a classification file and count humans.

The general workflow seems to be this:

1. Download classification file
2. Pull into the flatten zooniverse scripts in Research
3. Isolate to a particular workflow and version 
    - note that the Data folder now includes a file called subject_set_ids.csv that identifies the subject set from which each event comes. It might be useful to actually go through
    events by subject set rather than workflow id.

4. Use the R scripts to determine a consensus pick file and a file that needs to have hand-check of species id  
    - The assigned species file that I have at the end of this week is called AssignedSpecies_wkflow16995_2023_06_13 and it corresponds
    to the file check_species_wkflw16995 that I am currently working on.

5. Go through the file that needs manual checking

6. Merge the manually-checked file with the assigned species file 
7. Go through the humans - they come from a different workflow
8. Add humans for the set of cameras and dates represented by the combined assigned and hand-checked files
9. Pull final summary stats from that combined file.