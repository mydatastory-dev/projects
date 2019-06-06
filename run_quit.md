
## Python programs are plain text files.

* They have the `.py` extension to let everyone (including the operating system) know it is a Python program.
    * This is convention, not a requirement.
* It's common to write them using a text editor but we are going to use the Jupyter Notebook.
* The bit of extra setup is well worth it because the Notebook provides code completion and other helpful features.
* Notebook files have the extension `.ipynb` to distinguish them from plain-text Python programs.
    * Can export as "pure Python" to run from the command line.

## Use the Jupyter Notebook for editing and running Python

* The Anaconda package manager is an automated way to install the Jupyter notebook.

    * Click [here](https://nbviewer.jupyter.org/github/mydatastory/py_intro_class/blob/master/_episodes_jupyter/py_install.ipynb) for the Anaconda Distribution installation instructions.
* It also installs all the extra libraries it needs to run.

* Once you have installed Python and the Jupyter Notebook requirements, open a shell and type:

`$ jupyter notebook`

* This will start a Jupyter Notebook server and open your default web browser.

* The server runs locally on your machine only and does not use an internet connection.

* The server sends messages to your browser.

* The server does the work and the web browser renders the notebook.

* You can type code into the browser and see the result when the web page talks to the server.

* This has several advantages:

    * You can easily type, edit, and copy and paste blocks of code.
    * Tab complete allows you to easily access the names of things you are using and learn more about them.
    * It allows you to annotate your code with links, different sized text, bullets, etc. to make it more accessible to you and your collaborators.
    * It allows you to display figures next to the code that produces them to tell a complete story of the analysis.

![Screenshot of a Jupyter Notebook on quantum mechanics by Robert Johansson](https://github.com/mydatastory/py_intro_class/blob/master/fig/jupyter_notebook_example.jpg?raw=true)

## How It's Stored

* The notebook file is stored in a format called JSON.
* Just like a webpage, what's saved looks different from what you see in your browser.
* But this format allows Jupyter to mix source code, text, and images, all in one file.

#### Code vs. Text

We often use the term "code" to mean "the source code of software written in a language such as Python". 
A "code cell" in a Notebook is a cell that contains software; a "text cell" is one that contains ordinary 
prose written for human beings. 
    
    

## The Notebook has Command and Edit modes.

* Open a new notebook from the dropdown menu (that says 'New') in the top right corner of the file browser page.
* Each notebook contains one or more cells that contain code, text, or images.
* If you press <kbd>esc</kbd> and <kbd>return</kbd> alternately, the outer border of your code cell will change from blue to green.
     * The difference in color is subtle.
* These are the command (blue) and edit (green) modes of your notebook.
* In command mode, pressing the <kbd>H</kbd> key will provide a list of all the shortcut keys.
* Command mode alows you to edit notebook-level features, and edit mode changes the content of cells.
* When in command mode (esc/gray),
    * The <kbd>B</kbd> key will make a new cell below the currently selected cell.
    * The <kbd>A</kbd> key will make one above.
    * The <kbd>X</kbd> key will delete the current cell.
    * The <kbd>Z</kbd> key will undo your last cell deletion.
* All actions can be done using the menus, but there are lots of keyboard shortcuts to speed things up.
* If you remember the <kbd>esc</kbd> and <kbd>H</kbd> shortcut, you will be able to find out all the rest.


> #### Command Vs. Edit
> In the Jupyter notebook page are you currently in command or edit mode?  
> Switch between the modes. Use the shortcuts to generate a new cell. Use the shortcuts to delete a cell
> ##### [Answer](#answer_key)

## Use the keyboard and mouse to select and edit cells.

* Pressing the <kbd>enter</kbd> key turns the border green and engages edit mode, which allows you to type within the cell.
* Because we want to be able to write many lines of code in a single cell, pressing the `enter` key when in edit mode (green) moves the cursor to the next line in the cell just like in a text editor.
* We need some other way to tell the Notebook we want to run what's in the cell.
* Pressing the <kbd>shift</kbd> and the <kbd>enter</kbd> key together will execute the contents of the cell.
* Notice that the <kbd>return</kbd> and <kbd>shift</kbd> keys on the right of the keyboard are right next to each other.

## The Notebook will turn Markdown into pretty-printed documentation.

* Notebooks can also render Markdown.
    * A simple plain-text format for writing lists, links, and other things that might go into a web page.
    * Equivalently, a subset of HTML that looks like what you'd send in an old-fashioned email.
* Turn the current cell into a Markdown cell by entering the command mode (esc/gray) and press the "M" key.
* `In [ ]:` will disappear to show it is no longer a code cell and you will be able to write in Markdown.
* Turn the current cell into a Code cell by entering the command mode (esc/gray) and press the "Y" key.

## Markdown does most of what HTML does.

\* Uses asterisks <br>
\* to create <br>
\* bullet lists

******
\* You can use indents <br>
&nbsp; &nbsp; &nbsp; &nbsp; \* To create sublists <br>
&nbsp; &nbsp; &nbsp; &nbsp; \* of the same type <br>
\* Or sublists
    1. Of different
    1. types

******
\# A Level-1 Heading

******
\## A Level-2 Heading (etc.)

******
Line breaks <br>
don't matter.
<br><br>
But blank lines <br>
create new paragraphs.

******
\[Create links](http://software-carpentry.org) with `[...](...)`. <br>
Or use [named links][data_carpentry].

\[data_carpentry]: http://datacarpentry.org

## Questions
#### Q1: Creating Lists in Markdown
Create a nested list in a Markdown cell in a notebook that looks like this:

1.  Get funding.
2.  Do work.
    *   Design experiment.
    *   Collect data.
    *   Analyze.
3.  Write up.
4.  Publish.

##### [Answer](#answer_key)

```python
7 * 3
```

<details><summary>Solution</summary>
<p>  

1.  Get funding. <br> 
2.  Do work. <br>
&nbsp;    \*   Design experiment. <br>
&nbsp;    \*   Collect data. <br>
&nbsp;    \*   Analyze. <br>
3.  Write up. <br> 
4.  Publish. 

</p>
</details>

#### Q2: More Math
What is displayed when a Python cell in a notebook that contains several calculations is executed? For example, what > happens when this cell is executed?


```python
7 * 3
2 + 1
```

##### [Answer](#answer_key)

#### Q3: Change an Existing Cell from Code to Markdown
What happens if you write some Python in a code cell and then you switch it to a Markdown cell? For example, put the following in a code cell:


```python
x = 6 * 7 + 12
print(x)
```

And then run it with **Shift+Enter** to be sure that it works as a code cell. Now go back to the cell and use **Esc** then **M** > to switch the cell to Markdown and “run” it with **Shift+Enter**. What happened and how might this be useful? 
##### [Answer](#answer_key)

#### Q4: Equations
Standard Markdown (such as we're using for these notes) won't render equations, but the Notebook will.  Create a new > Mardown cell and enter the following:

`$\sum_{i=1}^{N} 2^{-i} \approx 1$`

(It’s probably easier to copy and paste.) What does it display? What do you think the underscore, _, circumflex, ^, 
and dollar sign, $, do?

##### [Answer](#answer_key)


******
******
******
******
******
******
******
******
******
******
******
******
******

### <a id='answer_key'> Answers </a>

#### Command vs. Edit

Command mode has a grey border and Edit mode has a green border. Use **esc** and **Enter** to switch between modes. You need to be in command mode (Hit **esc** if your cell is green). Type **B** or **A**. You need to be in command mode (Hit **esc** if your cell is green). Type **X**.

#### Q1: Lists in Markdown 
1.  Get funding.
2.  Do work. <br>
    \*   Design experiment. <br>
    \*   Collect data. <br>
    \*   Analyze. <br>
3.  Write up.
4.  Publish.

#### Q2: More Math


```python
7 * 3
2 + 1
```




    3



#### Q3: Change an Existing Cell from Code to Markdown
The Python code gets treated like Markdown text. The lines appear as if they are part of one contiguous paragraph. This could be useful to temporarily turn on and off cells in notebooks that get used for multiple purposes.

x = 6 * 7 + 12 
print(x)

#### Q4: Equations

The notebook shows the equation as it would be rendered from LaTeX equation syntax. The dollar sign, $, is used to tell Markdown that the text in between is a LaTeX equation. If you’re not familiar with LaTeX, underscore, _, is used for subscripts and circumflex, ^, is used for superscripts. A pair of curly braces, { and }, is used to group text together so that the statement i=1 becomes the the subscript and N becomes the superscript. Similarly, -i is in curly braces to make the whole statement the superscript for 2. \sum and \approx are LaTeX commands for “sum over” and “approximate” symbols.
