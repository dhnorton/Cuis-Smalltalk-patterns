'From Cuis 4.2 of 25 July 2013 [latest update: #2571] on 18 November 2015 at 2:34:50.87613 pm'!
'Description Please enter a description for this package'!
!provides: 'Pattern' 1 4!
!classDefinition: #CoupledPattern category: #Pattern!
ActiveModel subclass: #CoupledPattern
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'CoupledPattern class' category: #Pattern!
CoupledPattern class
	instanceVariableNames: ''!

!classDefinition: #DecoupledPattern category: #Pattern!
ActiveModel subclass: #DecoupledPattern
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'DecoupledPattern class' category: #Pattern!
DecoupledPattern class
	instanceVariableNames: ''!

!classDefinition: #CoupledView category: #Pattern!
SystemWindow subclass: #CoupledView
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'CoupledView class' category: #Pattern!
CoupledView class
	instanceVariableNames: ''!

!classDefinition: #DecoupledView category: #Pattern!
WorkspaceWindow subclass: #DecoupledView
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'DecoupledView class' category: #Pattern!
DecoupledView class
	instanceVariableNames: ''!


!CoupledPattern commentStamp: 'dhn 11/17/2015 14:59' prior: 0!
An example model class, used to deploy a SystemWindow when only one view of this instance is anticipated. This is not the more desirable design, compared to a loosely coupled one. If unanticipated views become necessary, their presence will entail changes to this model.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!DecoupledPattern commentStamp: 'dhn 11/17/2015 15:26' prior: 0!
An example model class which is unaware of its view or views. As additional views are deployed, their presence will entail no changes to this model.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!CoupledView commentStamp: 'dhn 11/17/2015 15:08' prior: 0!
A view which takes advantage of the Cuis SystemWindow behavior.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!DecoupledView commentStamp: '<historical>' prior: 0!
A view which takes advantage of the Cuis SystemWindow behavior.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!CoupledPattern class methodsFor: 'instance creation' stamp: 'dhn 11/17/2015 15:54'!
open
"	To start from a Browser or a WorkSpace, do (cmd-d) the following:

	CoupledPattern open.
"
	^ (CoupledView 	"the name of the window class, the view"
		open: CoupledPattern new	"the name of the model, which is this class; alternatively use 'self new' "
		label: 'A Title for a Window on a Coupled Model') 	"the initial title; can be changed later with #setLabel: "
		setWindowColor:  Color skyBlue  	
							" alternative color specification which matches Cuis themes: 
									Theme current browser 
									Theme current changeList 
									Theme current changeSorter 
									Theme current fileContentsBrowser 
									Theme current packageList 
									Theme current debugger 
									Theme current fileList 
									Theme current messageNames 
									Theme current messageSet 
									Theme current object 
									Theme current testRunner 
									Theme current textEditor 
									Theme current transcript 
									Theme current versionsBrowser 
									Theme current workspace 
							the above are Theme class methods which answer specific colors
							"
		"#open:label: will send #buildMorphicWindow to the view instance, to allow customization of the view"! !

!CoupledView methodsFor: 'initialization' stamp: 'dhn 11/16/2015 15:39'!
buildMorphicWindow
	"Specify the layout of the view"
	
	(self layoutMorph beRow 	"make use of the layoutMorph already in SystemWindow; change it from column to row"
		name: #'Pattern Row') 	"give the layoutMorph a name which will appear in the halos"
		
		setProperty: #handlesKeyboard toValue: #xxx; 	"enable a quiet start from World->New morph... menu"
		"the property must be present; its actual value does not matter for this purpose except that it cannot be nil"
		
		addMorph: self buildUsefulList fixedWidth: 200;
		addMorph: self buildUsefulPane
			layoutSpec: (LayoutSpec useAll)
! !

!CoupledView methodsFor: 'initialization' stamp: 'dhn 11/15/2015 16:07'!
buildUsefulList

	^ LayoutMorph newColumn name: #'Some List'! !

!CoupledView methodsFor: 'initialization' stamp: 'dhn 11/15/2015 16:06'!
buildUsefulPane

	^ LayoutMorph newColumn name: #UsefulArea! !

!CoupledView class methodsFor: 'instance creation' stamp: 'dhn 11/16/2015 15:32'!
includeInNewMorphMenu
	"Enable starting from the  World->New morph... menu"
	"Requires #handlesKeyboard property"
	
	^ true! !

!CoupledView class methodsFor: 'instance creation' stamp: 'dhn 11/17/2015 15:01'!
initializedInstance
	"Answer an instance of this class which is initialized."
	"This method is required in order that instantiation can occur via World->New morph... menu"

	^ CoupledPattern open! !

!DecoupledView methodsFor: 'initialization' stamp: 'dhn 11/17/2015 15:42'!
buildMorphicWindow
	"Specify the layout of the view"
	
	(self layoutMorph beRow 	"make use of the layoutMorph already in SystemWindow; change it from column to row"
		name: #'Pattern Row') 	"give the layoutMorph a name which will appear in the halos"
		
		setProperty: #handlesKeyboard toValue: #xyz; 	"enable a quiet start from World->New morph... menu"
		"the property must be present; its actual value does not matter for this purpose except that it cannot be nil"
		
		addMorph: self buildUsefulList fixedWidth: 200;
		addMorph: self buildUsefulPane
			layoutSpec: (LayoutSpec useAll)
! !

!DecoupledView methodsFor: 'initialization' stamp: 'dhn 11/17/2015 15:27'!
buildUsefulList

	^ LayoutMorph newColumn name: #'Some List'! !

!DecoupledView methodsFor: 'initialization' stamp: 'dhn 11/17/2015 15:43'!
buildUsefulPane

	^ LayoutMorph newColumn name: #'An Area'! !

!DecoupledView class methodsFor: 'instance creation' stamp: 'dhn 11/17/2015 15:27'!
includeInNewMorphMenu
	"Enable starting from the  World->New morph... menu"
	"Requires #handlesKeyboard property"
	
	^ true! !

!DecoupledView class methodsFor: 'instance creation' stamp: 'dhn 11/18/2015 14:34'!
initializedInstance
	"Answer an instance of this class which is initialized."
	"This method is required in order that instantiation can occur via the World->New morph... menu"

	^ self open! !

!DecoupledView class methodsFor: 'instance creation' stamp: 'dhn 11/18/2015 13:49'!
open
"	To start from a Browser or a WorkSpace, do (cmd-d) the following:

	DecoupledView open.
"
	| mod |
	
	mod _ DecoupledPattern new. "an instance of the model"
	^ (self
		open: mod
		label: 'A Title for a Window on the Decoupled Model') 	"the initial title; can be changed later with #setLabel: "
		setWindowColor:  Theme current transcript   	
							" alternative color specification which matches Cuis themes: 
									Theme current browser 
									Theme current changeList 
									Theme current changeSorter 
									Theme current fileContentsBrowser 
									Theme current packageList 
									Theme current debugger 
									Theme current fileList 
									Theme current messageNames 
									Theme current messageSet 
									Theme current object 
									Theme current testRunner 
									Theme current textEditor 
									Theme current transcript 
									Theme current versionsBrowser 
									Theme current workspace 
							the above are Theme class methods which answer specific colors
							"
		"#open:label: will send #buildMorphicWindow to self, to allow customization of the view"! !
