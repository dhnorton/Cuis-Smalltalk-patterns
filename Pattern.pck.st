'From Cuis 4.2 of 25 July 2013 [latest update: #2621] on 6 December 2015 at 2:53:38.908395 pm'!
'Description Minimalist coding examples showing how to deploy the Cuis SystemWindow.'!
!provides: 'Pattern' 1 13!
!classDefinition: #CoupledModel category: #Pattern!
ActiveModel subclass: #CoupledModel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'CoupledModel class' category: #Pattern!
CoupledModel class
	instanceVariableNames: ''!

!classDefinition: #DecoupledModel category: #Pattern!
ActiveModel subclass: #DecoupledModel
	instanceVariableNames: 'authors authorIndex selectedAuthor quotes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'DecoupledModel class' category: #Pattern!
DecoupledModel class
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
	instanceVariableNames: 'textPane'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'DecoupledView class' category: #Pattern!
DecoupledView class
	instanceVariableNames: ''!


!CoupledModel commentStamp: 'dhn 11/27/2015 16:07' prior: 0!
An example model class, used to deploy a SystemWindow when only one view of this instance is anticipated. This is not the more desirable design, compared to a decoupled one. If unanticipated views become necessary, their presence will entail changes to this model.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!DecoupledModel commentStamp: 'dhn 11/17/2015 15:26' prior: 0!
An example model class which is unaware of its view or views. As additional views are deployed, their presence will entail no changes to this model.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!CoupledView commentStamp: 'dhn 11/17/2015 15:08' prior: 0!
A view which takes advantage of the Cuis SystemWindow behavior.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!DecoupledView commentStamp: '<historical>' prior: 0!
A view which takes advantage of the Cuis SystemWindow behavior.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!CoupledModel class methodsFor: 'instance creation' stamp: 'dhn 11/27/2015 16:03'!
open
"	To start from a Browser or a WorkSpace, do (cmd-d) the following:

	CoupledPattern open.
"
	"#open:label: will send #buildMorphicWindow to the instance of the view class, to allow customization of the view"
	^ (CoupledView 	"the name of the window class, the view"
		open: CoupledModel new	"the name of the model, which is this class; alternatively use 'self new' "
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
		! !

!DecoupledModel methodsFor: 'accessing' stamp: 'dhn 11/27/2015 20:22'!
authorIndex
	"Answer the value of authorIndex"

	^ authorIndex! !

!DecoupledModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 12:04'!
authorIndex: anObject
	"Set the value of authorIndex"

	authorIndex _ anObject.
	self triggerEvent: #authorChange. 	"to whom it may concern: a new author has been selected"
	self selectedAuthor: 
		(authors at: anObject ifAbsent: nil)! !

!DecoupledModel methodsFor: 'accessing' stamp: 'dhn 11/27/2015 16:11'!
authors
	"Answer the value of authors"

	^ authors! !

!DecoupledModel methodsFor: 'accessing' stamp: 'dhn 11/27/2015 16:11'!
authors: anObject
	"Set the value of authors"

	authors _ anObject! !

!DecoupledModel methodsFor: 'initialization' stamp: 'dhn 11/27/2015 20:53'!
editorClass

	^ TextEditor! !

!DecoupledModel methodsFor: 'operating' stamp: 'dhn 12/6/2015 13:25'!
fullAttribution
	"Answer the quote and author's full name"
	| ix text |

	ix _ self authorIndex.
	text _ String new writeStream.
	(ix ~= 0)
		ifTrue: [
			self selectedAuthor: (self authors at: ix).
			text 
				nextPutAll: (self quotes at: self selectedAuthor);
				newLine; newLine; tab; tab;
				nextPutAll: '- ';
				nextPutAll: (self fullNames at: self selectedAuthor)]
		ifFalse: [text nextPutAll: ''].
	^ text contents! !

!DecoupledModel methodsFor: 'operating' stamp: 'dhn 12/6/2015 14:40'!
fullNames
	"Answer a dictionary which translates list names to full names"
	
	^ (Dictionary new)
		at: 'Yogi' put: 'Yogi Berra';
		at: 'Eddie' put: 'Eddie Murphy';
		at: 'George' put: 'George Bernard Shaw';
		at: 'Winnie' put: 'Winston Churchill';
		at: 'Willy' put: 'William Shakespear';
		yourself! !

!DecoupledModel methodsFor: 'initialization' stamp: 'dhn 12/6/2015 14:41'!
initialize
	super initialize.
	self quotes: self setQuotes.
	self authors: (OrderedCollection with: 'Eddie' with: 'Winnie' with: 'Yogi' with: 'Willy' with: 'George').
	self authorIndex: 0 	"no authors selected in the list"
	! !

!DecoupledModel methodsFor: 'accessing' stamp: 'dhn 11/27/2015 16:11'!
quotes
	"Answer the value of quotes"

	^ quotes! !

!DecoupledModel methodsFor: 'accessing' stamp: 'dhn 11/27/2015 16:11'!
quotes: anObject
	"Set the value of quotes"

	quotes _ anObject! !

!DecoupledModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 11:32'!
selectedAuthor
	"Answer the value of selectedAuthor"

	^ selectedAuthor! !

!DecoupledModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 11:32'!
selectedAuthor: anObject
	"Set the value of selectedAuthor"

	selectedAuthor _ anObject! !

!DecoupledModel methodsFor: 'initialization' stamp: 'dhn 12/6/2015 14:52'!
setQuotes
	"Answer a dictionary of quotes"
	
	^ (Dictionary new)
		at: 'Yogi' put: 'When you come to a fork in the road, take it.';
		at: 'Eddie' put: 'One never knows, do one?';
		at: 'George' put: 'England and America are two countries separated by the same language.';
		at: 'Winnie' put: 'This report, by its very length, defends itself against the risk of being read.';
		at: 'Willy' put: 'There is a tide in the affairs of men
Which, taken at the flood, leads on to fortune...';
		yourself! !

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

!CoupledView class methodsFor: 'instance creation' stamp: 'dhn 11/27/2015 15:54'!
initializedInstance
	"Answer an instance of this class which is initialized."
	"This method is required in order that instantiation can occur via World->New morph... menu"

	^ CoupledModel open! !

!DecoupledView methodsFor: 'initialization' stamp: 'dhn 12/5/2015 11:39'!
buildMorphicWindow
	"Specify the layout of the view"
	| listM |
	
	self layoutMorph beRow 	"make use of the layoutMorph already in SystemWindow; change it from column to row"
		name: #'Pattern Row'. 	"give the layoutMorph a name which will appear in the halos"

	listM _ (PluggableListMorph
				model: model 	"the object specified in self class open"
				listGetter: #authors 	"the method in 'model' which answers the list content"
				indexGetter: #authorIndex 	"the method in 'model' which answers the selection made in the list"
				indexSetter: #authorIndex:	"the method in 'model' which sets the list index"
				mainView: nil
				menuGetter: nil
				keystrokeAction: nil)
					name: #author. 	"give the PluggableListMorph a name which will appear in the halos"

	textPane _ (TextModelMorph 
		withModel: (TextModel withText: 'foo')) 	"note the different model specification"
			askBeforeDiscardingEdits: false;	"discard changes to the text"
			name: #quote. 	"give the TextModelMorph a name which will appear in the halos"

	self layoutMorph 	"add the above morphs to the window"
		addMorph: listM;
		addAdjusterAndMorph: textPane layoutSpec: (LayoutSpec useAll)
! !

!DecoupledView methodsFor: 'updating' stamp: 'dhn 12/6/2015 13:54'!
newText
	"Set the contents of the text pane"

	textPane model actualContents: model fullAttribution 	"note that the textPane model differs from the model for this view"! !

!DecoupledView class methodsFor: 'instance creation' stamp: 'dhn 12/6/2015 13:50'!
includeInNewMorphMenu
	"Enables this class to appear in the  World->New morph... menu"
	
	^ true! !

!DecoupledView class methodsFor: 'instance creation' stamp: 'dhn 11/18/2015 14:34'!
initializedInstance
	"Answer an instance of this class which is initialized."
	"This method is required in order that instantiation can occur via the World->New morph... menu"

	^ self open! !

!DecoupledView class methodsFor: 'instance creation' stamp: 'dhn 12/6/2015 13:42'!
open
"	Answer an instance of this class.
	To start from a Browser or a WorkSpace, do (cmd-d) the following:

	DecoupledView open.
	
	Otherwise, use the World->New morph... menu.	
"
	| mod win |
	
	mod _ DecoupledModel new. "an instance of the model"

	win _ (self
		open: mod
		label: 'A Title for a Window on the Decoupled Model') 	"the initial title; can be changed later with #setLabel: "
			setWindowColor:  Theme current transcript. 	"the initial color of the window title bar and frame; other choices below"	
	"#open:label: sends #buildMorphicWindow to the instance of this class, to allow customization of the view"

	mod when: #authorChange send: #newText to: win. 	"add an entry to the actionMap of the model"
	
	^ win
	
	"the following answer specific colors which match Cuis themes: 
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
	or, use a Color class method"
! !
