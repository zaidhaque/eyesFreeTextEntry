README	Text Entry Evaluation Suite & Analyzer
COPY1	Copyright (C) 2004-2006 Carnegie Mellon University
COPY2	Copyright (C) 2006-2007 University of Washington
AUTHOR	Jacob O. Wobbrock
EMAIL	wobbrock@u.washington.edu
DRAFT	04/17/2004
UPDATED	12/06/2006
TEXTTEST VERSION	2.1.5.*
STREAMANALYZER VERSION	2.0.2.*


============================================================
0. UNZIP
============================================================
Unzip the texteval.zip file into any directory. You should see
two folders created, \TextTest and \StreamAnalyzer, and three 
text files, Bibliography, Columns, and this README.


============================================================
1. OVERVIEW
============================================================
The TextTest program and StreamAnalyzer program enable the running 
of text entry experiments and the analysis of the results. The 
TextTest program writes log files in XML and the StreamAnalyzer 
program parses these files and performs various text entry measures 
on them. These measures have been developed by us and by other 
researchers; please see the Bibliography file for references. We
do not pretend that we invented all of the algorithms used by the 
StreamAnalyzer program; we invented some, and some were prior work 
for which we are grateful.


============================================================
2. REQUIREMENTS
============================================================
Both programs are written in Visual C# .NET and are designed 
to run on Microsoft Windows systems that have the .NET 2.0 
runtime installed. This can be downloaded from Microsoft at: 
http://msdn2.microsoft.com/en-us/netframework/aa731542.aspx


============================================================
3. SOURCE CODE & ALGORITHMS
============================================================
Source code is available for both applications by emailing the 
author at his contact information listed atop this document.

A comprehensive treatment of the StreamAnalyzer error analysis
algorithms can be found in reference [5].


============================================================
4. PHRASE FILES
============================================================

The default phrase set, embedded within TextTest, is also 
included in the download separately as phrases.txt. This file is 
not necessary to run TextTest.exe because it is embedded within 
the application itself. We included it for reference. It was 
developed by I.S. MacKenzie & R.W. Soukoreff. See [2] for more 
details.

A second phrase file, short_phrases.txt, has also been included.
This phrase file is useful for tests where the screen is narrow
(e.g. on mobile devices). No phrase in this file is longer than
27 characters in length. The phrases are shortened or altered
versions of those in phrases.txt and were edited by Jacob O. 
Wobbrock.


============================================================
5. HOW TO USE TextTest.exe
============================================================
You can use TextTest with any input method that enters text like a
desktop keyboard; that is, any method that sends text through the
computer's low-level input stream. For example, for text entry
methods written as Windows programs, the SendInput() or keybd_event()
functions in C++ and the SendKeys.Send() or SendKeys.SendWait() 
methods in C# do this. This allows text entry methods to be used
in any application on a host system.

TextTest has a built-in phrase set embedded within the application.
It consists of 500 phrases composed by I.S. MacKenzie and R.W.
Soukoreff. See reference [2] for more details.

You can also point TextTest to load a phrase file of your own. The 
requirement for such a file is simply that each phrase be put on a
line of its own in the *.txt file you create. Blank lines are properly
ignored.

Use Test > Start New (Ctrl+N) to start a new test. This creates
an XML log file with a time-stamped name. Once the test is done, you
can rename this log file using File > Rename Log (Ctrl+R). The log 
file will be created in the same directory as the application. At any 
time during a test you can use Test > Practice (Ctrl+P) or Test > Test 
(Ctrl+T) to change whether you are practicing or testing. This simply 
changes a flag in the XML for the *next* task that is presented.

After a user transcribes the presented text, they can press "Enter" 
on the keyboard, use Test > Next, or click the "Next" button on the 
dialog to proceed to the next phrase. After entering the final phrase, 
they can press "Escape" on the keyboard or use Test > Stop to end 
the test. Timing does *not* depend on these actions, but is measured
only from the first character entered to the last character entered 
for a phrase. Thus, subjects are always free to break before or after
entering phrase, but never during the entry of one.

The Tools Menu > Options... item will open an options dialog that
supports prevention of certain characters as well as the ability
to automatically end a test after a certain number of tasks, or to
automatically switch from Practice Mode to Testing Mode after a certain
number of tasks.

TextTest also supports receiving and/or sending characters via TCP. 
This can be useful if testing on a mobile device. For example, you may 
want to write a simple app on the mobile device to present phrases and 
have the user enter them, but not a full-blown replica of TextTest on a 
mobile device. You could connect the mobile device to TextTest running on 
the desktop PC and have TextTest do the usual logging for you. These 
options can be found on the TCP tab of the Options dialog.


============================================================
6. NOTES FOR TEXT ENTRY METHOD DEVELOPERS
============================================================
TextTest can be used to simply log character-entry events. But it 
also has support for determining individual character speeds. A 
text entry method can send special character codes to the TextTest 
program that will be trapped for logging purposes and not displayed. 
These codes are ANSI keycodes, e.g., 'a' = 97.

Char Code 1	Signifies the START of a character.
Char Code 4	Signifies the END of a character.
Char Code 5	Signifies an explicit non-recognition.

Note that non-recognitions can occur in methods besides those that
use strokes. Any attempt to enter a character which produces no
acutal character entry is a non-recognition. So, for instance, a stylus 
keyboard can generate non-recognitions when the user taps in the "dead 
space" between keys.

If a text entry method incorporates the detection and sending of 
these codes, the StreamAnalyzer program can compute numerous additional 
measures. For example, it can determine the average intra-character 
time for characters in a given task. (Intra-character time is how 
long it takes, on average, to make a character with the given method.) 
Non-recognitions do not have to be logged explicitly: if a char_start/char_end 
pair (Char codes 1 and 4, respectively) is seen by StreamAnalyzer and is 
not followed by a character entry or explicit non-recognition, then an
implicit non-recognition is assumed and appended to the input stream.

Note that the x,y attributes on the char_start and char_end log 
entries are reserved for future use; currently these are always 0.

Future versions of the analyzer will compute intra- and inter-character 
times for each individual letter in the character set, not just on 
average for each task as an aggregate measure. This will help discover 
particularly slow or fast characters and show designers where to optimize.


============================================================
7. HOW TO USE StreamAnalyzer.exe
============================================================
Once you have an XML log file written by TextTest (or your own 
program that follows the TextTest log file format), run 
StreamAnalyzer.exe. When prompted for the XML log file, simply drag-
and-drop your log file onto the console window and the path to it 
will appear. Next, when prompted for an output file, simply press enter
to get a text file created with the same name, but with a *.txt extension,
in the same directory as your *.xml log file. Or put in a path of your
own choosing.

StreamAnalyzer will display any XML formatting errors it finds, but there 
shouldn't be any if the log file was written by TextTest. If analysis is 
successful, it will display a "Success!" message and your output file 
will be written.

At the top of the output file are the aggregate measures for every task. 
These are space-delimited for easy copying-and-pasting into a statistics 
package spreadsheet, like Minitab, SPSS, JMP, or Excel. Use the column 
header line at the top of the file as your column headers. These are 
explained in the file "Columns.txt" that you downloaded.

Following the aggregate measures are two character-level tables that 
show character-level errors. These are explained in references [1]
and [5]. Following the character-level error tables are two confusion 
matrices. These are also explained in references [1] and [5].


============================================================
8. ENTERING 'P' AND 'IS' DIRECTLY
============================================================
StreamAnalyzer also supports directly entering a presented string (P) 
and an input stream (IS). Start the program with the -d option and you 
will be prompted to enter each. For example,

 P: quickly
IS: qv<ui*kl<<ckly

Encode backspaces with less-than ('<'), and non-recognitions with 
asterisk ('*'). You have the option of chosing an output file or, 
by pressing enter when prompted, just displaying the results to the 
console window. The character-level error results are of the form:

ErrorType(intended,produced)

For no-errors, the intended character equals the produced character. 
For substitution errors, these two disagree. For insertion errors, 
there is no intended character ('-'), and only a produced character. 
For omission (a.k.a. deletion) errors, there is no produced character 
('-'), only an intended character.
