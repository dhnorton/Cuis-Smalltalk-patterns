'From Cuis 4.2 of 25 July 2013 [latest update: #2621] on 8 December 2015 at 4:09:14.169995 pm'!
'Description Minimalist coding examples showing how to deploy the Cuis SystemWindow.'!
!provides: 'Pattern' 1 19!
!classDefinition: #AbstractModel category: #Pattern!
ActiveModel subclass: #AbstractModel
	instanceVariableNames: 'authors authorIndex selectedAuthor quotes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'AbstractModel class' category: #Pattern!
AbstractModel class
	instanceVariableNames: ''!

!classDefinition: #CoupledModel category: #Pattern!
AbstractModel subclass: #CoupledModel
	instanceVariableNames: 'window textPane'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'CoupledModel class' category: #Pattern!
CoupledModel class
	instanceVariableNames: 'window'!

!classDefinition: #DecoupledModel category: #Pattern!
AbstractModel subclass: #DecoupledModel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'DecoupledModel class' category: #Pattern!
DecoupledModel class
	instanceVariableNames: ''!

!classDefinition: #AnotherView category: #Pattern!
WorkspaceWindow subclass: #AnotherView
	instanceVariableNames: 'textPane'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pattern'!
!classDefinition: 'AnotherView class' category: #Pattern!
AnotherView class
	instanceVariableNames: ''!

!classDefinition: #CoupledView category: #Pattern!
WorkspaceWindow subclass: #CoupledView
	instanceVariableNames: 'textMorph'
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


!AbstractModel commentStamp: 'dhn 12/6/2015 15:21' prior: 0!
An abstract class containing methods common to some example models. Used to emphasize commonality and distinctions of the coupled and decoupled models.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!CoupledModel commentStamp: 'dhn 11/27/2015 16:07' prior: 0!
An example model class, used to deploy a SystemWindow when only one view of this instance is anticipated. This is not the more desirable design, compared to a decoupled one. If unanticipated views become necessary, their presence will entail changes to this model.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!DecoupledModel commentStamp: 'dhn 11/17/2015 15:26' prior: 0!
An example model class which is unaware of its view or views. As additional views are deployed, their presence will entail no changes to this model.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!AnotherView commentStamp: '<historical>' prior: 0!
A view which takes advantage of the Cuis SystemWindow behavior.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!CoupledView commentStamp: 'dhn 11/17/2015 15:08' prior: 0!
A view which takes advantage of the Cuis SystemWindow behavior.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!DecoupledView commentStamp: '<historical>' prior: 0!
A view which takes advantage of the Cuis SystemWindow behavior.

The methods of this class are suitable for copying into classes being developed. It is expected that many of the method comments will be removed or modified after they are incorporated in the new code. This class comment should also be changed.!

!AbstractModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 15:00'!
authorIndex
	"Answer the value of authorIndex"

	^ authorIndex! !

!AbstractModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 15:00'!
authors
	"Answer the value of authors"

	^ authors! !

!AbstractModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 15:00'!
authors: anObject
	"Set the value of authors"

	authors _ anObject! !

!AbstractModel methodsFor: 'initialization' stamp: 'dhn 12/6/2015 15:00'!
editorClass

	^ TextEditor! !

!AbstractModel methodsFor: 'operating' stamp: 'dhn 12/6/2015 15:00'!
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

!AbstractModel methodsFor: 'operating' stamp: 'dhn 12/8/2015 12:35'!
fullNames
	"Answer a dictionary which translates list names to full names"
	
	^ (Dictionary new)
		at: 'Yogi' put: 'Yogi Berra';
		at: 'Eddie' put: 'Eddie Murphy';
		at: 'George' put: 'George Bernard Shaw';
		at: 'Winnie' put: 'Winston Churchill';
		at: 'Willy' put: 'William Shakespeare';
		yourself! !

!AbstractModel methodsFor: 'initialization' stamp: 'dhn 12/6/2015 21:12'!
initialize
	super initialize.
	self quotes: self setQuotes.
	self authors: (OrderedCollection with: 'Eddie' with: 'Winnie' with: 'Yogi' with: 'Willy' with: 'George').
	authorIndex _ 0 	"no authors selected in the list"
	! !

!AbstractModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 15:00'!
quotes
	"Answer the value of quotes"

	^ quotes! !

!AbstractModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 15:00'!
quotes: anObject
	"Set the value of quotes"

	quotes _ anObject! !

!AbstractModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 15:00'!
selectedAuthor
	"Answer the value of selectedAuthor"

	^ selectedAuthor! !

!AbstractModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 19:56'!
selectedAuthor: anObject
	"Set the value of selectedAuthor"

	selectedAuthor _ anObject.
	self changed: #authorIndex 	"enables deselection of the list by using the mouse"! !

!AbstractModel methodsFor: 'initialization' stamp: 'dhn 12/6/2015 15:00'!
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

!CoupledModel methodsFor: 'accessing' stamp: 'dhn 12/8/2015 13:03'!
authorIndex: anObject
	"Set the value of authorIndex"

	authorIndex _ anObject.
	textPane model actualContents: self fullAttribution.
	self selectedAuthor: 
		(authors at: anObject ifAbsent: nil)! !

!CoupledModel methodsFor: 'initialization' stamp: 'dhn 12/6/2015 21:06'!
initialize

	super initialize! !

!CoupledModel methodsFor: 'accessing' stamp: 'dhn 12/8/2015 12:47'!
textPane
	"Answer the value of textPane"

	^ textPane! !

!CoupledModel methodsFor: 'accessing' stamp: 'dhn 12/8/2015 12:47'!
textPane: anObject
	"Set the value of textPane"

	textPane _ anObject! !

!CoupledModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 20:46'!
window
	"Answer the value of window"

	^ window! !

!CoupledModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 20:46'!
window: anObject
	"Set the value of window"

	window _ anObject! !

!DecoupledModel methodsFor: 'accessing' stamp: 'dhn 12/6/2015 15:16'!
authorIndex: anObject
	"Set the value of authorIndex"

	authorIndex _ anObject.
	self triggerEvent: #authorChange. 	"to whom it may concern: a new author has been selected"
	self selectedAuthor: 
		(authors at: anObject ifAbsent: nil)! !

!DecoupledModel methodsFor: 'initialization' stamp: 'dhn 12/6/2015 15:15'!
initialize
	super initialize! !

!AnotherView methodsFor: 'initialization' stamp: 'dhn 12/8/2015 14:16'!
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

!AnotherView methodsFor: 'updating' stamp: 'dhn 12/8/2015 14:27'!
whatWasSaid
	"Set the contents of the text pane"

	textPane model actualContents: model fullAttribution 	"note that the textPane model differs from the model for this view"! !

!AnotherView class methodsFor: 'instance creation' stamp: 'dhn 12/8/2015 14:16'!
includeInNewMorphMenu
	"Enables this class to appear in the  World->New morph... menu"
	
	^ true! !

!AnotherView class methodsFor: 'instance creation' stamp: 'dhn 12/8/2015 14:16'!
initializedInstance
	"Answer an instance of this class which is initialized."
	"This method is required in order that instantiation can occur via the World->New morph... menu"

	^ self open! !

!AnotherView class methodsFor: 'instance creation' stamp: 'dhn 12/8/2015 14:33'!
open
"	Answer an instance of this class.
	To start from a Browser or a WorkSpace, do (cmd-d) the following:

	AnotherView open.
	
	Otherwise, use the World->New morph... menu.	
"
	| mod win |

	win _ (AnotherView
		open: (mod _ DecoupledModel new) "an instance of the model"
		label: 'Another Window on the Decoupled Model') 	"the initial title; can be changed later with #setLabel: "
			setWindowColor:  Theme current fileList. 	"the initial color of the window title bar and frame; other choices below"	
	"#open:label: sends #buildMorphicWindow to the instance of this class, to allow customization of the view"

	mod when: #authorChange send: #whatWasSaid to: win. 	"add an entry to the actionMap of the model"
	
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

!AnotherView class methodsFor: 'instance creation' stamp: 'dhn 12/8/2015 14:57'!
openOn: aModel
"	Answer an instance of this class on aModel.
	To start from a Browser or a WorkSpace, do (cmd-d) the following:

	AnotherView openOn: <some model>.
"
	| win |

	win _ (AnotherView
		open: aModel "an instance of the model"
		label: 'Another Window on the Decoupled Model') 	"the initial title; can be changed later with #setLabel: "
			setWindowColor:  Theme current fileList. 	"the initial color of the window title bar and frame; other choices below"	
	"#open:label: sends #buildMorphicWindow to the instance of this class, to allow customization of the view"

	aModel when: #authorChange send: #whatWasSaid to: win. 	"add an entry to the actionMap of the model"
	
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

!AnotherView class methodsFor: 'example' stamp: 'dhn 12/8/2015 16:08'!
twoViews
	"Demonstrate multiple views on the same model, which is unaware that they exist
	
	self twoViews.
	"
	
	Smalltalk at: #YerGlobal put: DecoupledModel new.	"instantiate the model and make it global"
	AnotherView openOn: YerGlobal.		"open a view on the global"
	DecoupledView openOn: YerGlobal.	"open the second view on the global"
	
	"operate either of the above views and note how they affect each other"

"
	Execute (cmd-d) the following to tidy up by deleting the global:
	
	Smalltalk removeKey: #YerGlobal ifAbsent: [].
"! !

!CoupledView methodsFor: 'initialization' stamp: 'dhn 12/8/2015 12:55'!
buildMorphicWindow
	"Specify the layout of the view"
	| listM |
	
	listM _ (PluggableListMorph
				model: model 	"the object specified in self class open"
				listGetter: #authors 	"the method in 'model' which answers the list content"
				indexGetter: #authorIndex 	"the method in 'model' which answers the selection made in the list"
				indexSetter: #authorIndex:	"the method in 'model' which sets the list index"
				mainView: nil
				menuGetter: nil
				keystrokeAction: nil)
					name: #author. 	"give the PluggableListMorph a name which will appear in the halos"

	textMorph _ (TextModelMorph 
		withModel: (TextModel withText: 'foo')) 	"note the different model specification"
			askBeforeDiscardingEdits: false;	"discard changes to the text"
			name: #quote. 	"give the TextModelMorph a name which will appear in the halos"

	(self layoutMorph beRow 	"make use of the layoutMorph already in SystemWindow; change it from column to row"
		name: #'Pattern Row') 	"give the layoutMorph a name which will appear in the halos"
		
		setProperty: #handlesKeyboard toValue: #xxx; 	"enable a quiet start from World->New morph... menu"
		"the property must be present; its actual value does not matter for this purpose except that it cannot be nil"
		
		addMorph: listM fixedWidth: 200;
		addAdjusterAndMorph: textMorph
			layoutSpec: (LayoutSpec useAll).
			
	self model window: self
! !

!CoupledView methodsFor: 'accessing' stamp: 'dhn 12/8/2015 13:01'!
textMorph
	"Answer the value of textMorph"

	^ textMorph! !

!CoupledView methodsFor: 'accessing' stamp: 'dhn 12/8/2015 13:01'!
textMorph: anObject
	"Set the value of textMorph"

	textMorph _ anObject! !

!CoupledView class methodsFor: 'instance creation' stamp: 'dhn 11/16/2015 15:32'!
includeInNewMorphMenu
	"Enable starting from the  World->New morph... menu"
	"Requires #handlesKeyboard property"
	
	^ true! !

!CoupledView class methodsFor: 'instance creation' stamp: 'dhn 12/6/2015 21:08'!
initializedInstance
	"Answer an instance of this class which is initialized."
	"This method is required in order that instantiation can occur via World->New morph... menu"

	^ self open! !

!CoupledView class methodsFor: 'instance creation' stamp: 'dhn 12/8/2015 12:53'!
open
"	Answer an instance of this class.
	To start from a Browser or a WorkSpace, do (cmd-d) the following:

	CoupledView open.
	
	Otherwise, use the World->New morph... menu.	
"
	| win mod |

	win _ (self
		open: (mod _ CoupledModel new) "an instance of the model"
		label: 'A Title for a Window on the Coupled Model') 	"the initial title; can be changed later with #setLabel: "
			setWindowColor:  Color lightBlue. 	"the initial color of the window title bar and frame; other choices below"	
	"#open:label: sends #buildMorphicWindow to the instance of this class, to allow customization of the view"
	
	mod textPane: win textMorph.		"get access to the text pane"

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

!DecoupledView class methodsFor: 'instance creation' stamp: 'dhn 12/6/2015 20:31'!
open
"	Answer an instance of this class.
	To start from a Browser or a WorkSpace, do (cmd-d) the following:

	DecoupledView open.
	
	Otherwise, use the World->New morph... menu.	
"
	| mod win |

	win _ (self
		open: (mod _ DecoupledModel new) "an instance of the model"
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

!DecoupledView class methodsFor: 'instance creation' stamp: 'dhn 12/8/2015 14:52'!
openOn: aModel
"	Answer an instance of this class on aModel.
	To start from a Browser or a WorkSpace, do (cmd-d) the following:

	DecoupledView openOn: <some model>.
"
	| win |

	win _ (self
		open: aModel "an instance of the model"
		label: 'A Title for a Window on the Decoupled Model') 	"the initial title; can be changed later with #setLabel: "
			setWindowColor:  Theme current transcript. 	"the initial color of the window title bar and frame; other choices below"	
	"#open:label: sends #buildMorphicWindow to the instance of this class, to allow customization of the view"

	aModel when: #authorChange send: #newText to: win. 	"add an entry to the actionMap of the model"
	
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

!DecoupledView class methodsFor: 'example' stamp: 'dhn 12/8/2015 16:06'!
twoViews
	"Demonstrate multiple views on the same model, which is unaware that they exist
	
	self twoViews.
	"

	Smalltalk at: #YerGlobal put: DecoupledModel new.	"instantiate the model and make it global"
	AnotherView openOn: YerGlobal.		"open a view on the global"
	DecoupledView openOn: YerGlobal.	"open the second view on the global"
	
	"operate either of the above views and note how they affect each other"

"
	Execute (cmd-d) the following to tidy up by deleting the global:
	
	Smalltalk removeKey: #YerGlobal ifAbsent: [].
"! !
