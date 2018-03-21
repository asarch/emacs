# Configuring Emacs and generating LaTeX files

Let's define a new registry (`q`) with an initial value of `1`

```
C-u 1 C-x r n q
```

Let's start Calendar:

```
M-u calendar
```

Let's start to record keyboard macros:

```
C-x (
```

Now, let's generate the LaTeX file:

| Key     | Description                                  |
|---------|:--------------------------------------------:|
| `t d`   | for the current selected day in the Calendar |
| `t w i` | For the current selected week                |
| `t M`   | For the current selected month               |

Let's save the file with corresponding file name:

```
C-x C-s [ day | week | month ]
```

Let's insert the current value of the 'q' registry:

```
C-x r i q
```

Let's add the file extension:

```
.tex Ret
```

Let's add by one the 'q' registry value:

```
C-x r + q
```

Let's select the Calendar buffer:

```
M-u buffer-menu
V
```

Let's select the next period of the Calendar:

| Key | Description        |
|-----|:------------------:|
| a   | For the next day   |
| b   | For the next week  |
| M-} | For the next month |
 
 Let's stop to record keyboard macros
 
 ```
 C-x )
 ```
 
 Now repeat the secuence as you wish (for all the days, for all the weeks or for all the months in the year):
 
 ```
 C-u [ 365 | 52 | 12 ] C-x e
 ```
 
 # Rendering LaTeX files
 
 To fix the problem of the paper margins with the generated day, use this code:
 
 ```sh
 #!/bin/mksh
 
 for file in $( ls day*.tex | sort ); do
	echo "Fixing file $file..."
 ex - $file << EOS
 /oddsidemarging/s/-2/0/p
 wq
 EOS
 done
 ```
 
 Let's render the LaTeX file into DVI:
 
 ```
 $ find . -name '*.tex' -exec latex {} \;
 ```
 
 Let's convert the DVI files into PostScript format:
 
 ```
 $ find . -name '*.dvi' -exec dvips -o {}.ps -t letter {} \;
 ```
 
 Now, convert the PostScript files into PDF format:
 
 ```
 $ find . -name '*.ps' -exec ps2pdf {} \;
 ```
  
 To rename the file in secuence (day001.pdf, day002.pdf, etc) use this code, just change the value of the file_name variable:
 
 ```sh
 #!/bin/mksh

file_name="month" # [ day | week | month ]
i=1

for file in $( ls $file_name?.dvi.pdf | sort ); do
	new_name=$( basename $file $i.dvi.pdf )"00$i.pdf"

	echo "Renaming file $file into $new_name"
	mv -v $file $new_name
	(( i++ ))
done

i=10

for file in $( ls $file_name??.dvi.pdf | sort ); do
	new_name=$( basename $file $i.dvi.pdf )"0$i.pdf"

	echo "Renaming file $file into $new_name"
	mv -v $file $new_name
	(( i++ ))
done

exit 1

i=100

for file in $( ls $file_name???.dvi.pdf | sort ); do
	new_name=$( basename $file $i.dvi.pdf )"$i.pdf"

	echo "Renaming file $file into $new_name"
	mv -v $file $new_name
	(( i++ ))
done
```
# Getting resulting file

To concat the PDF files:

```
$ gs -q -sPAPERSIZE=letter -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=agenda.pdf *.pdf
GS> Ctrl+D
 ```
