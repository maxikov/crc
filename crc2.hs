erCase(),j=c.attr(k,"tabindex");return(/input|select|textarea|button|object/.test(l)?!k.disabled:"a"==l||"area"==l?k.href||!isNaN(j):!isNaN(j))&&!c(k)["area"==l?"parents":"closest"](":hidden").length},tabbable:function(k){var j=c.attr(k,"tabindex");return(isNaN(j)||j>=0)&&c(k).is(":focusable")}});function g(m,n,o,l){function k(q){var p=c[m][n][q]||[];return(typeof p=="string"?p.split(/,?\s+/):p)}var j=k("getter");if(l.length==1&&typeof l[0]=="string"){j=j.concat(k("getterSetter"))}return(c.inArray(o,j)!=-1)}c.widget=function(k,j){var l=k.split(".")[0];k=k.split(".")[1];c.fn[k]=function(p){var n=(typeof p=="string"),o=Array.prototype.slice.call(arguments,1);if(n&&p.substring(0,1)=="_"){return this}if(n&&g(l,k,p,o)){var m=c.data(this[0],k);return(m?m[p].apply(m,o):undefined)}return this.each(function(){var q=c.data(this,k);(!q&&!n&&c.data(this,k,new c[l][k](this,p))._init());(q&&n&&c.isFunction(q[p])&&q[p].apply(q,o))})};c[l]=c[l]||{};c[l][k]=function(o,n){var m=this;this.namespace=l;this.widgetName=k;this.widgetEventPrefix=c[l][k].eventPrefix||k;this.widgetBaseClass=l+"-"+k;this.options=c.extend({},c.widget.defaults,c[l][k].defaults,c.metadata&&c.metadata.get(o)[k],n);this.element=c(o).bind("setData."+k,function(q,p,r){if(q.target==o){return m._setData(p,r)}}).bind("getData."+k,function(q,p){if(q.target==o){return m._getData(p)}}).bind("remove",function(){return m.destroy()})};c[l][k].prototype=c.extend({},c.widget.prototype,j);c[l][k].getterSetter="option"};c.widget.prototype={_init:function(){},destroy:function(){this.element.removeData(this.widgetName).removeClass(this.widgetBaseClass+"-disabled "+this.namespace+"-state-disabled").removeAttr("aria-disabled")},option:function(l,m){var k=l,j=this;if(typeof l=="string"){if(m===undefined){return this._getData(l)}k={};k[l]=m}c.each(k,function(n,o){j._setData(n,o)})},_getData:function(j){return this.options[j]},_setData:function(j,k){this.options[j]=k;if(j=="disabled"){this.element[k?"addClass":"removeClass"](this.widgetBaseClass+"-disabled "+this.namespace+"-state-disabled").attr("aria-disabled",k)}},enable:function(){this._setData("disabled",false)},disable:function(){this._setData("disabled",true)},_trigger:function(l,m,n){var p=this.options[l],j=(l==this.widgetEventPrefix?l:this.widgetEventPrefix+l);m=c.Event(m);m.type=j;if(m.originalEvent){for(var k=c.event.props.length,o;k;){o=c.event.props[--k];m[o]=m.originalEvent[o]}}this.element.trigger(m,n);return !(c.isFunction(p)&&p.call(this.element[0],m,n)===false||m.isDefaultPrevented())}};c.widget.defaults={disabled:false};c.ui.mouse={_mouseInit:function(){var j=this;this.element.bind("mousedown."+this.widgetName,function(k){return j._mouseDown(k)}).bind("click."+this.widgetName,function(k){if(j._preventClickEvent){j._preventClickEvent=false;k.stopImmediatePropagation();return false}});if(c.browser.msie){this._mouseUnselectable=this.element.attr("unselectable");this.element.attr("unselectable","on")}this.started=false},_mouseDestroy:function(){this.element.unbind("."+this.widgetName);(c.browser.msie&&this.element.attr("unselectable",this._mouseUnselectable))},_mouseDown:function(l){l.originalEvent=l.originalEvent||{};if(l.originalEvent.mouseHandled){return}(this._mouseStarted&&this._mouseUp(l));this._mouseDownEvent=l;var k=this,m=(l.which==1),j=(typeof this.options.cancel=="string"?c(l.target).parents().add(l.target).filter(this.options.cancel).length:false);if(!m||j||!this._mouseCapture(l)){return true}this.mouseDelayMet=!this.options.delay;if(!this.mouseDelayMet){this._mouseDelayTimer=setTimeout(func ��tion(){k.mouseDelayMet=true},this.options.delay)}if(this._mouseDistanceMet(l)&&this._mouseDelayMet(l)){this._mouseStarted=(this._mouseStart(l)!==false);if(!this._mouseStarted){l.preventDefault();return true}}this._mouseMoveDelegate=function(n){return k._mouseMove(n)};this._mouseUpDelegate=function(n){return k._mouseUp(n)};c(document).bind("mousemove."+this.widgetName,this._mouseMoveDelegate).bind("mouseup."+this.widgetName,this._mouseUpDelegate);(c.browser.safari||l.preventDefault());l.originalEvent.mouseHandled=true;returutton <- buttonNewWithLabel "Декодировать"
	boxPackStart decodebox decodebutton PackNatural 0


	widgetShowAll window
	onPressed encbutton (guiEncode inffield polbox encreslabel)
	onPressed errorbutton (guiMakeError encreslabel errorspinbutton errres)
	onPressed decodebutton (guiDecode errres polbox decoderes)
	onDestroy window mainQuit
	mainGUI

readInf :: String ->[Int]
readInf str
	| foldl (\x y -> ((y /= 0) && (y /= 1)) || x) False res = []
	| length str /= 4 = []
	| otherwise = res
	where res = map (\x -> read [x]) str 

readInf7 :: String ->[Int]
readInf7 str
	| foldl (\x y -> ((y /= 0) && (y /= 1)) || x) False res = []
	| length str /= 7 = []
	| otherwise = res
	where res = map (\x -> read [x]) str 


guiEncode :: Entry -> ComboBox -> Label -> IO()
guiEncode inff cb res = do	
	inf' <- entryGetText inff
	inf <- (return (readInf $ inf'))
	ntxt' <- comboBoxGetActiveText cb
	ntxt <- return (ntxt')
	pol <- return (getPol ntxt)
	if inf == [] then
		do
			errorDialog "Введите четырёхразрядную информационную часть"
		else if pol == [] then do
			errorDialog "Выберите многочлен"
		else
			labelSetText res (map  (\x -> (show x)!!0) (encode inf pol))

makePol :: IO ComboBox
makePol = do
	cb <- comboBoxNewText
	comboBoxAppendText cb "1011"
	comboBoxAppendText cb "1101"
	comboBoxSetActive cb 0
	return cb

getPol :: Maybe String -> [Int]
getPol ntxt = case ntxt of
	(Just "1011")	-> [1,0,1,1]
	(Just "1101") 	-> [1,1,0,1]
	Nothing		-> []

errorDialog :: String -> IO ()
errorDialog errormsg = do
	dialog <- messageDialogNew Nothing [DialogModal] MessageError ButtonsOk errormsg
	rid <- dialogRun dialog
	widgetDestroy dialog
	return ()

guiMakeError::Label -> SpinButton -> Label -> IO()
guiMakeError codel errspin resl = do
	code' <- labelGetText codel
	code <- return (readInf7 $ code')
	err' <- spinButtonGetValueAsInt errspin
	err <- return (err')
	if code == [] then do
			errorDialog "Сначала надо закодировать!"
		else do
			labelSetText resl  (map  (\x -> (show x)!!0) (makeError code err))

guiDecode::Label -> ComboBox -> Label -> IO()
guiDecode codel polb resl = do
	code' <- labelGetText codel
	code <- return (readInf7 $ code')
	ntxt' <- comboBoxGetActiveText polb
	ntxt <- return (ntxt')
	pol <- return (getPol ntxt)
	if code == [] then do
		errorDialog "Сначала надо сделать ошибку!"
		else do
			labelSetText resl (map  (\x -> (show x)!!0) (decode code pol))	
