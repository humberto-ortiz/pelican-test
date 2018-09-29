Title: Using Google Drive from the command line
Slug: using-google-drive-from-the-command-line
Date: 2018-09-27 09:49:29
Category: Blog
Tags: hacking, learning

# Introduction

The University of Puerto Rico has a G Suite Education Edition
agreement. Several researchers are interested in using Google Drive to
backup and securely share data and results. We set up a Team Drive for
testing in one of our projects, and it was working nicely, but one of
the researchers indicated that if he had files on our linux cluster
that he wanted to share he had to download them from the cluster to a
PC, then upload them from the PC to the team drive.

I looked around for alternatives, and Globus, our favorite data
transfer tool, has a connector for Google Drive, which would permit
high speed data transfers from our login node to google.
Unfortunately, the licencing would run into thousands of dollars per
year for that solution.

I looked for other options, and found at least two free software
packages that can copy files on and off google drive from the command
line:
  - gdrive - https://github.com/prasmussen/gdrive
  - rclone - https://rclone.org/drive/
gdrive is no longer being actively maintained, but rclone is, and
supports Team Drives, so I selected rclone for testing.

# Methods

Install `rclone` from the site. I'll show how I set up a team
drive. You'll need to give each team drive you use a separate name, in
this example I'm using `upr-dmztest`. Because I'm remotely logged in
to the linux computer I'm setting up, I need to use the headless
configuration. `rclone` will print out a long url, which I paste into
a browser to authorize `rclone` to access my Google Drive
account. Google will return a long string with an access token to
paste into `rclone`.

```
$ rclone config
2018/09/27 10:36:47 NOTICE: Config file "/home/humberto/humberto/.config/rclone/rclone.conf" not found - using defaults
No remotes found - make a new one
n) New remote
s) Set configuration password
q) Quit config
n/s/q> n
name> upr-dmztest
Type of storage to configure.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
 1 / Alias for a existing remote
   \ "alias"
 2 / Amazon Drive
   \ "amazon cloud drive"
...
 9 / FTP Connection
   \ "ftp"
10 / Google Cloud Storage (this is not Google Drive)
   \ "google cloud storage"
11 / Google Drive
   \ "drive"
12 / Hubic
   \ "hubic"
...
Storage> drive
Google Application Client Id
Leave blank normally.
Enter a string value. Press Enter for the default ("").
client_id> 
Google Application Client Secret
Leave blank normally.
Enter a string value. Press Enter for the default ("").
client_secret> 
Scope that rclone should use when requesting access from drive.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
 1 / Full access all files, excluding Application Data Folder.
   \ "drive"
 2 / Read-only access to file metadata and file contents.
   \ "drive.readonly"
   / Access to files created by rclone only.
 3 | These are visible in the drive website.
   | File authorization is revoked when the user deauthorizes the app.
   \ "drive.file"
   / Allows read and write access to the Application Data folder.
 4 | This is not visible in the drive website.
   \ "drive.appfolder"
   / Allows read-only access to file metadata but
 5 | does not allow any access to read or download file content.
   \ "drive.metadata.readonly"
scope> drive
ID of the root folder
Leave blank normally.
Fill in to access "Computers" folders. (see docs).
Enter a string value. Press Enter for the default ("").
root_folder_id> 
Service Account Credentials JSON file path 
Leave blank normally.
Needed only if you want use SA instead of interactive login.
Enter a string value. Press Enter for the default ("").
service_account_file> 
Edit advanced config? (y/n)
y) Yes
n) No
y/n> n
Remote config
Use auto config?
 * Say Y if not sure
 * Say N if you are working on a remote or headless machine or Y didn't work
y) Yes
n) No
y/n> n
If your browser doesn't open automatically go to the following link:
https://accounts.google.com/o/oauth2/auth?[bunch of stuff]
Log in and authorize rclone for access
Enter verification code> [long code google returns]
Configure this as a team drive?
y) Yes
n) No
y/n> y
Fetching team drive list...
Choose a number from below, or type in your own value
 1 / Computer Science department UPR-RP
   \ "XXXXXXX"
 2 / DMZtest
   \ "YYYYYYY"
 3 / EPSCoR
   \ "ZZZZZZZ"
 4 / Personnel Committee FCN
   \ "WWWWWWW"
Enter a Team Drive ID> 2
--------------------
[upr-dmztest]
type = drive
scope = drive
token = {"access_token":"","token_type":"Bearer","refresh_token":"","expiry":"2018-09-27T11:39:02.456487984-04:00"}
team_drive = XXXXYYYZZZZZ
--------------------
y) Yes this is OK
e) Edit this remote
d) Delete this remote
y/e/d> y
Current remotes:

Name                 Type
====                 ====
upr-dmztest          drive

e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q> q
```

## Results

Now that we've set up the remote, we can list files:
```
$ rclone ls upr-dmztest:
893109585 RnaSeq-Garcia_S3_L001_R1_001.fastq.gz
6089478926 bigfile.zip
1143471744 nema.x.mouse
2878221822 result1.tar.gz
```

We can also copy files to and from the Google Drive:

```
$ time rclone copy upr-dmztest:nema.x.mouse .

real	0m33.411s
user	0m19.635s
sys	0m2.067s
$ ls -l nema.x.mouse 
-rw-rw-r-- 1 humberto humberto 1.1G Dec 10  2016 nema.x.mouse
```

That's 1.1 GB in 33 seconds, or a transfer rate of 261 Mbps, or 32.6 MBps.
