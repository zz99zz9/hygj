/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
* 
* 站长图库 - http://www.zztuku.com
*
* @author Roddy <fmamcn@vip.qq.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/

KindEditor.plugin('zibiaoti', function(K) {
	var self = this, name = 'zibiaoti';
	self.clickToolbar(name, function() {
		var lang = self.lang(name + '.'),
			html = ['<div style="padding:10px;">',
				'<input class="ke-input-text" type="text" id="keName" name="name" value="" style="width:300px;" />',
				'</div>'].join('');
				var dialog = self.createDialog({
				name : name,
				title : self.lang(name),
				body : html,
				yesBtn : {
					name : self.lang('yes'),
					click : function(e) {
						self.insertHtml('[page]' + nameBox.val() + '[/page]').hideDialog().focus();
					}
				}
			});			
		var div = dialog.div,
			nameBox = K('input[name="name"]', div);
		var img = self.plugin.getSelectedAnchor();
		if (img) {
			nameBox.val(unescape(img.attr('data-ke-name')));
		}
		nameBox[0].focus();
		nameBox[0].select();
	});
});
