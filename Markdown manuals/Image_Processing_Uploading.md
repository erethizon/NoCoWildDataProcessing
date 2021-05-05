![](RackMultipart20210505-4-1nrw92h_html_bbbc8d62e4d02869.gif)

**Image Processing and Uploading Handbook**

![](RackMultipart20210505-4-1nrw92h_html_36d9727c4c23311e.jpg)

Table of Contents

**[Introduction 4](#_Toc71110031)**

[Process Overview 4](#_Toc71110032)

[Figure 1. Steps involved in preparing images for upload to Zooniverse. 4](#_Toc71110033)

[Datasheet, File and Folder Locations 4](#_Toc71110034)

[Figure 2. File and Folder organization for the North Country Wild project. 5](#_Toc71110035)

_[Data sheets 5](#_Toc71110036)_

_[Images 5](#_Toc71110037)_

_[Data files 6](#_Toc71110038)_

**[1.](#_Toc71110039)****Retrieve SD cards from cameras 6**

**[2.](#_Toc71110040)****Organize photos on External Hard Drive 6**

[Step 1: Archiving the files 6](#_Toc71110041)

[Figure 3. File structure and folder naming conventions for archiving game camera photos. 7](#_Toc71110042)

[Step 2. Copying and renaming the files 7](#_Toc71110043)

[Figure 4. Image naming conventions depending on camera number, SD card number, and possibly deployment round and site. 8](#_Toc71110044)

[Figure 5. File folder open showing original file names. 8](#_Toc71110045)

[Figure 6. When you right-click the image files you have selected, choose &quot;Rename&quot; to batch rename the files. 9](#_Toc71110046)

[Figure 7. Find the &quot;IMG&quot; part of each filename and replace it with &quot;BC&quot; (or other appropriate round or site codes). 9](#_Toc71110047)

[Figure 8. You can see that all of the files have been renamed – the &quot;IMG&quot; was replaced by &quot;BC&quot; for each image. 9](#_Toc71110048)

[Figure 9. Appearance of files once correctly renamed. 10](#_Toc71110049)

[Summary 10](#_Toc71110050)

[Figure 10. Summary view of Raw and Processed folder organization on the external hard drive. 10](#_Toc71110051)

**[3.](#_Toc71110052)****Add copyright and read EXIF data from images to .csv via ExifTool 11**

[ExifTool 11](#_Toc71110053)

[Box 1. Notes on the Mac Terminal Interface. 11](#_Toc71110054)

[11](#_Toc71110055)

[Figure 11. View of the terminal window. 11](////Users/ebar/Dropbox/Nature%20Up%20North/Citizen%20Science/North%20Country%20Wild/Image%20Processing%20and%20Uploading%20Handbook_v1.2.docx#_Toc71110056)

[Table 1. Basic command-line commands that can be sent via the terminal window. 11](#_Toc71110057)

[Step 1. Finding your way around the mac terminal (command line interface) 11](#_Toc71110058)

[Figure 12. Result of search for &quot;Terminal&quot;. Click on the icon to open it. 12](#_Toc71110059)

_[Note about directory names 12](#_Toc71110060)_

[Step 2. Running ExifTool via the terminal. 13](#_Toc71110061)

_[What are exif data? 13](#_Toc71110062)_

_[Running ExifTool 13](#_Toc71110063)_

[Step 3. Viewing exif data on a single image 13](#_Toc71110064)

[Figure 13. Example output from viewing exif data from a single image with exiftool. 14](#_Toc71110065)

[Step 4. Using ExifTool to add copyright information to the images. 14](#_Toc71110066)

**[4.](#_Toc71110067)****Use imagemagick to resize images to 900kb 14**

[Resizing images 15](#_Toc71110068)

**[5.](#_Toc71110069)****Use exiftool to then bulk-extract metadata from images 15**

[Write csv from the parent directory 15](#_Toc71110070)

[Assign the csv a correct file name 16](#_Toc71110071)

[Moving the file to the correct location 16](#_Toc71110072)

**[6.](#_Toc71110073)****Introduction to the main RStudio Project 17**

[Overview 17](#_Toc71110074)

[Organization of our project in RStudio 17](#_Toc71110075)

[Figure 14. View of Files pane in RStudio project showing project organization. 17](#_Toc71110076)

_[Code 17](#_Toc71110077)_

_[Data 18](#_Toc71110078)_

_[Output 18](#_Toc71110079)_

[Accessing the project from Github 18](#_Toc71110080)

**[7.](#_Toc71110081)****Use RStudio to assign each image to the proper camera trap &quot;event&quot; and to create the Zooniverse manifest. 18**

[Copy the manifest file to the correct location on the t:// drive 18](#_Toc71110082)

[Figure 15. Copy the manifest file to the t:drive. 19](#_Toc71110083)

**[8.](#_Toc71110084)****Add any additional information to the manifest. 19**

[Copy the manifest file (again) to the correct location on the external hard drive. 19](#_Toc71110085)

**[9.](#_Toc71110086)****Upload images and manifest to the Zooniverse 19**

[Figure 16. Screenshot of the subject sets creator on the Zooniverse platform. 20](#_Toc71110087)

[Figure 17. Sample screen read out as panoptes loads images to the Zooniverse. 21](#_Toc71110088)

**[Appendix 1. Additional Details and code snippets 22](#_Toc71110089)**

[Installing software via the command-line 22](#_Toc71110090)

_[Installing or using Homebrew 22](#_Toc71110091)_

[Figure 18. Checking to see if Homebrew is installed. 22](#_Toc71110092)

_[Installing imageMagick on a mac 23](#_Toc71110093)_

_[Installing exifTool on a mac 23](#_Toc71110094)_

[Using exifTool to write metadata csv from within image directory 23](#_Toc71110095)

# Introduction

## Process Overview

There are many steps required to properly process our game camera images. A workflow diagram (Figure 1) highlights the 9 steps that are required.

![](RackMultipart20210505-4-1nrw92h_html_c72ddd08efbadc7d.jpg)

_Figure 1. Steps involved in preparing images for upload to Zooniverse._

## Datasheet, File and Folder Locations

With camera traps, it is possible to generate a LOT of data, very quickly. Processing those data requires a lot of R files, as well. It is very easy to accidentally overwrite files or save things on e.g. your P:/ drive or your personal computer, making it very difficult for code to run well in the future (when the next student cannot access your files). For that reason, we have taken care to organize our files very carefully. Please pay attention to the organization as described below and to apply it as you work on this project.

We work on this project from three file locations (Figure 2):

1. The NoCoWild folder on the t:// drive

t://Bart\_s04/Research\_group/NoCoWild

1. A shared RStudio project on github

[https://github.com/erethizon/NoCoWildDataProcessing](https://github.com/erethizon/NoCoWildDataProcessing)

1. An external hard drive attached to the iMac in JHS 115

![](RackMultipart20210505-4-1nrw92h_html_897dcc5b788c6d5e.jpg)

_Figure 2. File and Folder organization for the North Country Wild project._

### Data sheets

Blank copies of the paper data sheets we take into the field to record individual camera deployments can be found in the lab. In case you need to print more, the file is called &quot;Camera deployment sheet&quot; and there is a word copy as well as a pdf copy in the &quot;Datasheets&quot; folder in the t:drive NoCoWild folder.

### Images

Our game camera images take up a ton of hard drive space, so we keep them on an external hard drive attached to the iMac in the lab (Figure 2). That hard drive should **never**
# 1
, ever leave the lab!!! In the unusual circumstance in which you can&#39;t work directly in the lab (thanks, COVID-19!) we have a second, back up hard drive for loan.

The name of the main image hard drive is &quot;NoCoWild&quot;. It contains images other than our game camera projects, as well. You may add images to this hard drive, but please don&#39;t delete images unless Erika is sitting next to you, saying &quot;yes, it is ok to delete that&quot; so that it can be her fault if something goes horribly wrong.

### Data files

We keep data files in two locations. Exif metadata files about sets of images (see below for explanation) as well as unmodified classification or other files from the Zooniverse platform are stored on the t:drive in the Data folder.

The RStudio project is where we store some data products (after processing in R) and where we store all of the code we use for image processing and analysis. Depending on what stage of the project you are in, files may be found in the &quot;Code&quot;, &quot;Data&quot; or &quot;Output&quot; folders. See Organization of our project in RStudio below for details.

1.
# Retrieve SD cards from cameras

This step takes place in the field. Be sure you know which card # comes from which camera # and the site name. You should have a paper data sheet on which you record this information. Keep the SD cards clean and dry.

1.
# Organize photos on External Hard Drive

Back in the lab, download all of the photos from each SD card onto the external hard drive called &quot;NoCoWild&quot;. Use the iMac which has a built in SD card reader on the back R side of the monitor.

There are two main steps to organizing the photos:

1. Archiving the files
2. Copying and renaming the files

## Step 1: Archiving the files

On the external hard drive, we keep a set of original images that we **never**
 **# 2** modify. We organize files by calendar year. Depending on the year, the folder names may be different than what you see below and we may use a slightly different folder and file naming convention, though the basic steps are similar to what you see here.

![](RackMultipart20210505-4-1nrw92h_html_6786a9371115a4b.png) **Be sure to check with Erika to make sure you know what file and image naming conventions are currently in use**.

Original files (if this is the first time they are downloaded from the SD card) go into the folder called &quot;2021 Game Camera Photos&quot; (or the appropriate folder for the particular year). Within that folder, they are placed into a subfolder called &quot;Raw&quot;, and within that folder, into subfolders by Round. Within the folder for each round will be a single folder named for each game camera &amp; SD card combination (Figure 3). You may need to create these folders when you first upload the data. Please use leading zeros and make sure every camera number is recorded as 3 digits and every sd card number is recorded as three digits. For example, for images from Camera 24 SD card 5, you would have:

C024\_SD005

![](RackMultipart20210505-4-1nrw92h_html_216ea71cfbe7371b.jpg)

_Figure 3. File structure and folder naming conventions for archiving game camera photos._

In some years, we also incorporated a site name into the file structure, so that folders for each camera are included in a folder for each site.

![](RackMultipart20210505-4-1nrw92h_html_6786a9371115a4b.png)

**Again, these files are the originals and should NEVER BE ALTERED.**

## Step 2. Copying and renaming the files

Once we have all of the photos archived in the &quot;Raw&quot; folder, we copy them to another folder called &quot;Processed&quot; and rename each image file according to its camera number and SD card (and in some cases Round and/or Site). It is easiest to do this on the iMac.

- First, copy the &quot;Raw&quot; folder and paste it inside of the &quot;2021 Game Camera Photos&quot; folder (or similar).
- Rename the copied folder &quot;Processed&quot;

Your task will be to replace the &quot;IMG&quot; or &quot;EK&quot; string in each image file name (which string will depend on the camera model from which the pictures were made) with a special string containing some combination of camera, SD card, Round, and possibly site. All of the pictures in the single folder will receive the same code, because they come from the same Camera and SD card combination. The flow chart for determining the proper code is as follows (Figure 4):

![](RackMultipart20210505-4-1nrw92h_html_f0ef4c4f316ebe3.jpg)

_Figure 4. Image naming conventions depending on camera number, SD card number, and possibly deployment round and site._

Once you have your folder pasted into the &quot;Processed&quot; folder, follow these steps to rename the files:

1. Double click on the folder containing the photos (Figure 5). You will see that the default file names are assigned by the camera and are totally boring and easily confused with other image files.

![](RackMultipart20210505-4-1nrw92h_html_c9d38f2b3402eacc.png)

_Figure 5. File folder open showing original file names._

1. Now select all of the images in the folder. The fastest way is to use z-A.

1. With all of the images selected, right-click the mouse and choose &quot;Rename X items&quot; where X is the number of selected files (Figure 6).

![](RackMultipart20210505-4-1nrw92h_html_603e89cc58380f53.png)

_Figure 6. When you right-click the image files you have selected, choose &quot;Rename&quot; to batch rename the files._

1. A new dialog box will open (Figure 7).

In this example, the images all came from a forest called Beaver Creek, so I will enter &quot;IMG&quot; in the &quot;Find&quot; box and &quot;BC&quot; in the &quot;Replace with&quot; box, as in Figure 7.

- Depending on what combination of camera, sd card, round and site you may be dealing with, you can replace the &quot;IMG&quot; with a full string indicating all of the information that needs to be changes. For example, instead of just replacing &quot;IMG&quot; with &quot;BC&quot; as in the example, you could replace it with something like &quot;C024\_SD002\_R1\_&quot;.

![](RackMultipart20210505-4-1nrw92h_html_61b63d06c7aa3106.png)

_Figure 7. Find the &quot;IMG&quot; part of each filename and replace it with &quot;BC&quot; (or other appropriate round or site codes)._

Click the &quot;Rename&quot; button and the files will be renamed (Figure 8).

![](RackMultipart20210505-4-1nrw92h_html_1148ac47038341f5.png)

_Figure 8. You can see that all of the files have been renamed – the &quot;IMG&quot; was replaced by &quot;BC&quot; for each image._

1. If you forget to add an element to a text name, (e.g. you forget to put the round number), you can use the &quot;Add text&quot; feature to do so. While all the files are still selected, right-click again and choose to rename the items again (i.e. repeat Step 3 above). This time, choose the dropdown arrow next to &quot;Replace Text&quot; and select &quot;Add text&quot;. Then choose the dropdown arrows next to &quot;after name&quot; and select &quot;before name&quot;.

When you are finished, you should see that your folder includes a set of renamed image files, like Figure 9:

![](RackMultipart20210505-4-1nrw92h_html_cb13117924de0518.png)

_Figure 9. Appearance of files once correctly renamed._

Repeat these steps to save and rename any folders of images you import to the Processed folder on the hard drive.

## Summary

At the end of the Photo Organization step, you will have a set of subfolders containing original, unmodified image files in the Raw folder and a second set of subfolders in the Processed folder containing the modified images (Figure 10)

![](RackMultipart20210505-4-1nrw92h_html_1853fc0c11d4bb44.jpg)

_Figure 10. Summary view of Raw and Processed folder organization on the external hard drive._

1.
# Add copyright and read EXIF data from images to .csv via ExifTool

## ExifTool

Now that we have a folder of images we are ready to work with, we need to use a program called ExifTool to add copyright information to the Exif data for each image and then export the common EXIF data from all of the images to a .csv file. Doing so will require use of the Mac &quot;terminal&quot;, the command-line interface for MacOS (Box 1, Figure 10).

_Box 1. Notes on the Mac Terminal Interface._

![](RackMultipart20210505-4-1nrw92h_html_3a4df9f268b86f2a.png)The Mac terminal interface allows you to easily access the directory structure on your computer and batch process (do a process to multiple files at once) a number of tasks, saving time. There are also some software programs that lack a GUI (graphical user interface, the familiar menu-driven interface on most computers) that must be controlled from the command line. Some of the basic commands are described in Table 1.

_Figure 11. View of the terminal window._

_Table 1. Basic command-line commands that can be sent via the terminal window._

| Command | Purpose |
| --- | --- |
| cd directory | changes path from working directory to named directory where &quot;directory&quot; is the name of the directory you wish to navigate to. |
| cd .. | changes your directory from the parent directory to the one you are currently in (note the space before the ..) |
| ls | lists all visible files in your directory |
| pwd | lists path of your current directory (&quot;print working directory&quot;) |
| . vs .. | &quot;.&quot; Specifies the directory you are currently in, whereas &quot;..&quot; specifies the parent directory |

##


##


## Step 1. Finding your way around the mac terminal (command line interface)

To access the terminal, go to the magnifying glass in the upper right of your window and search for &quot;Terminal&quot;. Alternatively, search for &quot;Terminal&quot; from the launchpad. You will see a result like Figure 12:

![](RackMultipart20210505-4-1nrw92h_html_9b11698931d1ea9d.png)

_Figure 12. Result of search for &quot;Terminal&quot;. Click on the icon to open it._

The terminal window presents a way to move around directories (folders) on your computer, run software, and execute other commands without using the &quot;graphical user interface&quot;, or &quot;GUI&quot; that you are most familiar with (the Menu-driven system where you click with your mouse to make things happen). There are several different ways in which we must use the terminal for image processing.

### Note about directory names

The command-line has trouble understanding folder names if there is a space in the folder name. For example, if I have a folder called &quot;Card 4&quot;, I specify it by writing Card\ 4

The \ tells the computer that the name is continuing. The space followed by the 4 tells it that these are the remaining parts of the directory name.

A ![](RackMultipart20210505-4-1nrw92h_html_6786a9371115a4b.png) void problems with the terminal by using \_ or not otherwise including spaces in filenames.

Also, this guide is written assuming you are using the iMac in the Barthelmess research lab. If you are trying to use these commands on another mac, there may be slight differences. If you are trying to use these commands on a PC, you will find that the PC operating system uses different characters to indicate a file path. Thus, this code will get you on the right path on a PC, but will not be sufficient as is.

![](RackMultipart20210505-4-1nrw92h_html_9457e3a3852556f8.png)A neat trick for changing the directory folder path is to drop the folder icon (not from the terminal) onto the $ prompt inside of the terminal. The terminal will then indicate the full path to that directory. Try this:

cd [drop folder with files here after you type cd]

Terminal will change the working directory to the correct file path!

## Step 2. Running ExifTool via the terminal.

###


### What are exif data?

Any time an image is made with a digital camera, regardless of make, data are embedded in the image file. You never see these data unless you look for them. Programs such as Adobe Lightroom can be used to view the exif data. How much exif data is collected depends on the camera and its features. For example, a camera with built in gps will encode the location where the photo was taken.

We will need exif data to be able to assign images to proper events based on their time stamp. We will also add exif data to our images by adding copyright information.

### Running ExifTool

Running ExifTool is fairly straightforward, as long as you don&#39;t get too bogged down in command-line commands, which can be confusing. To start ExifTool, type &quot;exiftool&quot; after the prompt on the command line. If the computer tells you that ExifTool does not exist, see Appendix 1. Additional Details and code snippets, for instructions on how to install ExifTool.

- If ExifTool is installed, the manual (called the &quot;man&quot; or &quot;manpage&quot; in command line talk) window will open orienting you to features of the program. To get out of that window and back to the command-line, type &quot;Q&quot;.
- Scroll through manpage using scroll bar
- Exit the man by typing q and return.

## Step 3. Viewing exif data on a single image

In the terminal, change to the directory that contains the files you want information from. Note the name of an image in the directory.

Then, in the terminal at the command-line prompt (usually a $ or \&gt;), type

exiftool imagename.jpg

where imagename.jpg is the name of the file you want data from. The computer will then display the information you seek. An example of output is in Figure 12 below.

![](RackMultipart20210505-4-1nrw92h_html_a60de85954763c5c.png)

_Figure 13. Example output from viewing exif data from a single image with exiftool._

You will use this method to ensure that copyright information is properly added.

## Step 4. Using ExifTool to add copyright information to the images.

To add copyright information to the images, make sure you are in the folder that contains the images you wish to add copyright information, and type the following at the command-line:

$ exiftool –overwrite\_original -rights=&quot;Copyright&quot;

-CopyrightNotice=&quot;Bart Lab and Nature Up North&quot; \*.JPG

(put this all on one line)

This basically says to the computer: &quot;Open exiftool, and overwrite new information into the original metadata. Add a field called &#39;Copyright&#39; and fill the field with &quot;Bart Lab and Nature Up North&quot;. Do this for all of the files in the folder.&quot;

Once you have run this code, examine the exif data for a few of the images in the folder using the method described in Step 3 above and make sure the copyright information is present.

1.
# Use imagemagick to resize images to 900kb

The Zooniverse sets a maximum image size of 1MB. Our cameras take higher resolution pictures, generally in the realm of 3.5MB. Thus, we would like to batch resize the photos for upload to the Zooniverse. To do so, we use another command-line software called ImageMagick.

We have installed ImageMagick on the iMac in the lab. However, if you wish to install it on your own mac, see Appendix 1. Additional Details and code snippets, for instructions on how to install &quot;Homebrew&quot;, a package manager for the Mac, and then use Homebrew to install imagemagick.

## Resizing images

With imagemagick installed, move to the directory with the set of images you wish to resize and type the following line of code in the terminal:

$magick mogrify -resize &quot;2000\&gt;&quot; –define jpeg:extent=900kb \*.JPG

Note that the .JPG is case-sensitive. If the images are labeled .jpg, then type that instead.

This line of code basically says &quot;Turn on imagemagick and use it to resize photos. Their maximum width or height (whichever is larger) will be 2000 pixels. Next define their final size as 900kb. Do this for all of the images (the \*.JPG where \* is a wildcard) in the folder.

Note: Resizing takes a long time. For example, to run about 4000 photos took 1hr and 10 minutes.

1.
# Use exiftool to then bulk-extract metadata from images

Use exiftool program in command line (&quot;terminal&quot; in mac speak) to capture image metadata
 For more information, consult this series of tutorials on line: [https://www.weareavp.com/exiftool-tutorial-series](https://www.weareavp.com/exiftool-tutorial-series/)[/](https://www.weareavp.com/exiftool-tutorial-series/) (video 4 has good info).

Exiftool will allow you to batch extract data from a whole folder of images and save it to a .csv file. We need this .csv for use in R.

You can generate the csv from within the directory of images, or from the parent directory (the one containing the directory of images). The code will be slightly different. We will write the csv from the parent directory to prevent having anything in our image folder other than images. The code to write the csv from within the image directory is available in the appendix if for some reason you should need it.

## Write csv from the parent directory

You should create the csv by specifying the folder containing the images for which you want the data, without being in that folder. From the folder with the images, use cd .. to navigate to the parent folder that contains the image folder.

For the purpose of this example, assume that all of the images are in a folder called &quot;Card 4&quot;

Next write the following in the command line:

$exiftool –common -csv Card\ 4 \&gt; correctfilename.csv

This code tells the computer to &quot;Open exiftool, select the &quot;common&quot; (rather than all) the exif data, and make a csv using all of the images in the &quot;Card 4&quot; folder and save it to a file called correctfilename.csv in the parent directory. (Wondering why we typed Card\ 4 rather than just Card 4 in our line of code? See the &quot; Note About Directory Names&quot; part of this document in section 3 above.)

This command will do two things:

1. It will open as the directory with the images
2. It will save the csv to the parent, rather than the child directory.

## Assign the csv a correct file name

In the code above, we used &quot;correctfilename.csv&quot; as a placeholder file name for the csv file that we were making with exifTool. In reality, we want to use meaningful file names whenever we create files. Keep in mind that the file is going to be moved, stored, and opened again, perhaps years later. We need to know what it is! Thus we will use a meaningful file naming convention.

We&#39;d like to know, just from the file name, several things:

1. What the file contains (exif data)
2. What set of images the file is for (timeframe and round, if relevant). Recall that the camera and sd card names are already imbedded in the image names, so we don&#39;t need that info in the file name.

So for data from the fall 2021 camera trapping season, we would use the following components in the file name:

- &quot;exif&quot; to tell us that it contains exif data
- &quot;2021&quot; to tell us the year it is from
- &quot;R1&quot; or &quot;R2&quot; etc. to tell us the round of deployments
- The name of the folder containing the images it is referencing.

Thus, if we have images in a folder called C024\_SD100, the line of code we would use to create the exif metadata file from the parent folder would be:

$exiftool –common -csv C024\_SD100 \&gt; exif\_2021\_R1\_C024\_SD100.csv

## Moving the file to the correct location

The last step in all of this image processing is to move the exif metadata file you just created to the main NoCoWild Data subfolder.

Navigate to t://Bart\_s04/Research\_group/NoCoWild/Data/exif\_metadata and save a copy of the file you just created there.

1.
# Introduction to the main RStudio Project

## Overview

We set our game cameras to take a burst of up to three images each time the camera is triggered. We call each set of 3 images a single &quot;event.&quot; However, our folder of images is just a set of files. We need a way to assign each image to the proper camera trap event. We have R code that we use to do just that.

## Organization of our project in RStudio

To assign images to the proper event, you will need to know the location (file path) to the folder containing the images (and only the images, no other files can be in the folder) and the location of the exif metadata file for that folder that was created in Section 5 above. See Figure 2 for a refresher on where to find those files.

We use a special structure (Figure 14)to keep this project running smoothly when being used by many different people.

![](RackMultipart20210505-4-1nrw92h_html_de9c2d2fed91c608.png)

_Figure 14. View of Files pane in RStudio project showing project organization._

### Code

The &quot;Code&quot; folder is where we keep all of the .Rmd files and .R files for actually running processes in RStudio. The Code folder contains three subfolders: &quot;PreZooniverse&quot;, &quot;PostZooniverse&quot;, and &quot;Functions.&quot; In this manual, we will only make use of the PreZooniverse and Functions subfolders.

PreZooniverse contains two subfolders: &quot;Explanatory Rmd files&quot; and &quot;Code to Run&quot;. You will be using the .Rmd file called &quot;PreZooniverse.Rmd&quot; located in the &quot;Code to Run&quot; folder.

PreZooniverse.Rmd relies on several custom functions located in the Functions folder. You will not need to look inside of the Functions folder, but it must be in place and must contain the correct .R files in order for the scripts in PreZooniverse.Rmd to run properly.

The files in the Explanatory Rmd files folder provide more detailed descriptions of the steps involved in developing the functions we use in our project.

### Data

The Data folder is where we keep only **source data files**. These are files that R will suck in for processing, but that will **never**
 **# 3** be edited or saved over in order to ensure reproducibility.

### Output

The Output folder is where we save the outputs of the code (as opposed to source files used to produce the analysis). This is where we save all kinds of outputs including data files and plots. The Output folder is arranged into various subfolders. The key Output subfolders for the purposes of this manual are in the PreZooniverse subfolder and are called ImagesByEvent and Manifests.

## Accessing the project from Github

Github is a version control system used by people who code. We use Github because it allows folks to simultaneously work on the project and it &quot;protects&quot; us against unwanted changes (we can roll back the code to any prior state). However, using github within RStudio, though pretty straightforward, can be a bit confusing at first.

All of the R code you need to process the file is in the RStudio project called &quot;NoCoWildDataProcessing.&quot; It is available for access on github:

https://github.com/erethizon/NoCoWildDataProcessing

**P ![](RackMultipart20210505-4-1nrw92h_html_6786a9371115a4b.png) lease work with Erika to make sure you are accessing the project correctly so as to allow different folks to work on the project at the same time.**

1.
# Use RStudio to assign each image to the proper camera trap &quot;event&quot; and to create the Zooniverse manifest.

Within the RStudio project, navigate to Code -\&gt; PreZooniverse -\&gt; Code to Run and open the file called PreZooniversePrep.Rmd. Step through this file, making sure to establish the proper directory paths and input file names. If all of the code runs successfully, you will have created a manifest file that will be located in Output -\&gt; PreZooniverse -\&gt; Manifests. An intermediate file will also be saved to Output -\&gt; PreZooniverse -\&gt; ImagesByEvent.

## Copy the manifest file to the correct location on the t:// drive

Navigate to the Files pane in RStudio and to the folder containing the manifest file you just created. Check the box next to the manifest file you wish to copy (there may be several in this folder). Choose the &quot;More&quot; button at the top of the Files pane and select &quot;Copy to&quot; (Figure 15).

![](RackMultipart20210505-4-1nrw92h_html_6495d6983a2d56d5.png)

_Figure 15. Copy the manifest file to the t:drive._

A dialog box will open.

Navigate to t://Bart\_s04/Research\_group/NoCoWild/Zooniverse/Manifests and save the file there, keeping the file name the same. Note that you will need an active connection to the t:drive for this to work.

1.
# Add any additional information to the manifest.

This required step is done using Excel to add any added metadata to the manifest that you would like to be associated with the images. This step must be done before pushing images to the Zooniverse. Talk with Erika about whether you will be adding metadata to the manifest.

## Copy the manifest file (again) to the correct location on the external hard drive.

We store a copy of the manifest file on the t:drive because it is automatically backed up. However, to upload the manifest to Zooniverse, it needs to be located in the folder of images we intend to upload. For that reason, copy the manifest file you just created on the t:drive and navigate to the folder of images you plan to upload, located on the external hard drive. Paste the manifest file into the folder of images.

![](RackMultipart20210505-4-1nrw92h_html_6786a9371115a4b.png)

**The only things in this folder should be the actual image files and the manifest.**

1.
# Upload images and manifest to the Zooniverse

The Zooniverse platform allows you to upload images for processing by drag-and-drop. This works fine for up to several hundred images, but is problematic when you have more images. As a result, we use a command-line method to upload our files to the Zooniverse.

To upload images at once, we install and use the &quot;[Panoptes Command Line Interface](https://github.com/zooniverse/panoptes-cli#installation)&quot; from the Zooniverse. Instructions are provided at the Panoptes hyperlink. However, the instructions are not quite up to date. Using python version 3, you need to change some of the text to python3 and pip3.

However, once you have the panoptes client installed, uploading is very straightforward.

First, create an empty subject set in your Zooniverse project. Name it something useful. For example, &quot;2021 Round 1 images&quot;. **Do not upload a manifest or any images to the subject set.** See Figure 16 for details.

![](RackMultipart20210505-4-1nrw92h_html_a5419612cc3dd18b.png)

_Figure 16. Screenshot of the subject sets creator on the Zooniverse platform._

Look near the top of the page to find the unique number that the Zooniverse assigns to your subject set. You will need to use this number in the command-line, so write it down. In our example (Figure 16) the unique number for Round 1 Batch 2 is #73895.

Once you have the number written down, go to your terminal interface. Navigate to the folder containing the images you wish to upload and the manifest for those images. These are the only things that should be in that folder, and you should have BOTH images and the manifest before you do the upload.

Now, type the following into the command line:

$ panoptes subject-set upload-subjects 73895 manifest.csv

But change the number to whatever the subject set number is that you wrote down and change manifest.csv to whatever the name of the manifest file is (but make sure it ends with .csv).

Panoptes may throw a warning message, something like &quot;Broken libmagic installation detected….&quot; but just ignore that warning. You&#39;ll see something like Figure 17 as the computer works to upload the images. Depending on how many images are in the folder, this step could take more than an hour to complete. Do not use the iMac for anything else while this process takes place.

![](RackMultipart20210505-4-1nrw92h_html_ccba91ccd3d02c64.png)

_Figure 17. Sample screen read out as panoptes loads images to the Zooniverse._

## **You did it! Time to celebrate!**

# Appendix 1. Additional Details and code snippets

## Installing software via the command-line

### Installing or using Homebrew

Homebrew is an open-sources package manager for macOS. Using it makes installing other macOS software via the command-line fairly easy.

To see if Homebrew is installed on your mac, open a terminal window and type

$brew

If Homebrew is installed, your terminal window will open the Homebrew manual (Figure 18)

![](RackMultipart20210505-4-1nrw92h_html_d31dd306b8bcb3ab.png)

_Figure 18. Checking to see if Homebrew is installed._

If Homebrew is not installed, you will receive an error message.

To install Homebrew on a mac, follow the instructions [here](https://www.igeeksblog.com/how-to-install-homebrew-on-mac/).

The quick version:

Install Homebrew first. Copy the following line at the command-prompt in your terminal window to do so:

/usr/bin/ruby -e &quot;$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/master/install](https://raw.githubusercontent.com/Homebrew/install/master/install))&quot;

You will be prompted to type in a password. Type in the same password you use to log on to the computer. When you type in the password, nothing will appear in the command line but the computer will know after you hit enter. The computer will install Homebrew, which may take 20 or so minutes.

### Installing imageMagick on a mac

First, determine if imageMagick is installed on your computer. Open a terminal window and type:

$magick

If the manual pages open, then imageMagick is installed. If not, you will need to install it.

To install imagemagick, type the following at the command prompt:

$brew install imagemagick

You may need to enter your password to continue, and it may take several minutes to install.

### Installing exifTool on a mac

First, determine if exifTool is installed on your computer. Open a terminal wondw and type:

$exiftool

If the manual pages open, then exifTool is installed. If not, you will need to install it.

To install exifTool using Homebrew, type the following at the command prompt:

$brew install exiftool

You may need to enter your password to continue, and it may take several minutes to install.

## Using exifTool to write metadata csv from within image directory

Make sure you are in the directory that has all of the images. For example, imagine you are in a folder called &quot;Card 4&quot;.

You can specify that an action happen on the same directory you are in by using the &#39;.&#39; Notation.

Thus, to export the .csv, you would type:

$exiftool -common -csv . \&gt; correctfilename.csv

This code tells the computer to &quot;Open exiftool, select the &quot;common&quot; (rather than all) the exif data, and make a csv using all of the images in the directory you are currently in (the &#39;.&#39;) and save it to a file called correctfilename.csv in the same directory.

[1](#sdfootnote1anc) I mean NEVER, EVER, EVER. Got it?

[2](#sdfootnote2anc) Never, ever ever! Not even AFTER hell freezes over!

[3](#sdfootnote3anc) You know the drill: Never as in NOT EVER!

Version 1.2 May 2021
