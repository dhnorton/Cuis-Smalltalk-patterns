'From Cuis 4.2 of 25 July 2013 [latest update: #2571] on 15 November 2015 at 3:23:08.193677 pm'!
'Description Please enter a description for this package'!
!provides: 'Pattern' 1 0!
!classDefinition: #UsefulPattern category: #Pattern!
ActiveModel subclass: #UsefulPattern
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'UsefulPattern class' category: #Pattern!
UsefulPattern class
	instanceVariableNames: ''!

!classDefinition: #UsefulView category: #Pattern!
SystemWindow subclass: #UsefulView
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'UsefulView class' category: #Pattern!
UsefulView class
	instanceVariableNames: ''!


!UsefulPattern commentStamp: 'dhn 11/14/2015 22:14' prior: 0!
An example model class, used to illustrate an effective way of employing a SystemWindow.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!UsefulView commentStamp: 'dhn 11/14/2015 22:14' prior: 0!
A view which takes advantage of the Cuis SystemWindow.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!UsefulPattern class methodsFor: 'instance creation' stamp: 'dhn 11/14/2015 21:48'!
includeInNewMorphMenu
	"Enable starting from the  World->New morph... menu"
	^ true! !

!UsefulPattern class methodsFor: 'instance creation' stamp: 'dhn 11/14/2015 21:53'!
open
"	To start from a Browser or a WorkSpace, do (cmd-d) the following:

	UsefulPattern open.
"
	(UsefulView 	"the name of the window class, the view"
		open: UsefulPattern 	"the name of the model, which is this class; alternatively use 'self new' "
		label: 'A Title for the Window') 	"the initial title; can be changed later with #setLabel: "
		setWindowColor:  Color skyBlue 	
							" alternative color specification which matches Cuis themes: 
									Theme current browser 
									Theme current debugger 
									Theme current workspace 
							the above are Theme class methods which answer specific colors
							"
		"#open:label:setWindowColor: will send #buildMorphicWindow to the view instance, to allow customization of the view"! !

!UsefulView methodsFor: 'initialization' stamp: 'dhn 11/14/2015 22:20'!
buildMorphicWindow
	"Specify the layout of the view"
	
	(self layoutMorph beRow 	"make use of the layoutMorph already in SystemWindow; change it from column to row"
		name: #'Pattern Row') 	"give the layoutMorph a name which will appear in the halos"
		addMorph: self buildUsefulList fixedWidth: 200;
		addMorph: self buildUsefulPane
			layoutSpec: (LayoutSpec useAll)! !
