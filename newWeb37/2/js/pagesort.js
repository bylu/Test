function Pager(header, cur_span, source_container, dest_container, per_page, page_wnd){
    this.$header = header ? $(header) : null;
    this.$sctn = $(source_container);
    this.$dctn = $(dest_container);
    this.$cur_span = $(cur_span);
    this.max_page = Math.ceil(this.$sctn.children().length / per_page);
    this.per_page = per_page;
    this.page_wnd = Math.min(page_wnd, this.max_page);
    this.cur_page = this.start_page = (this.max_page > 0) ? 1 : 0;
    this.pagebtns = []; // store all page buttons
}
Pager.prototype._cal_start_page = function(){
    var start = Math.max(1, this.cur_page - Math.ceil(this.page_wnd / 2 - 1));
    var end = Math.min(this.max_page, start + this.page_wnd - 1);
    start = end - this.page_wnd + 1;
    this.start_page = start;
};
Pager.prototype.page = function(page_no){
    if(page_no < 1 || page_no > this.max_page){
        return;
    }

    this.cur_page = page_no;
    this._cal_start_page();

    var start = (page_no - 1) * this.per_page;
    var end = start + this.per_page;
    this.$dctn.empty();
    if(this.$header){
        this.$dctn.append(this.$header);
    }
    this.$dctn.append(this.$sctn.children().slice(start ,end).clone());
};
Pager.prototype.to_page = function(page_no){
    // turn to page..
    this.page(page_no);

    // detach all page buttons and current page span.
    this.$cur_span.detach();
    for(var i = 0; i < this.pagebtns.length; i++){
        this.pagebtns[i].detach();
    }

    // atach page buttons and current page span.
    for(var i = this.start_page + this.page_wnd - 2; i > this.cur_page - 1; i--){
        this.pagebtns[i].prependTo($('.dPages'));
    }
    this.$cur_span.text(1 + i--).prependTo($('.dPages'));
    for(; i >= this.start_page - 1; i--){
        this.pagebtns[i].prependTo($('.dPages'));
    }

    $('#aPrevPage').show();
    $('#aNextPage').show();

    // hide any button?
    if(this.max_page <= 1){
        $('.dPages').hide();
    }
    if(this.cur_page == 1){
        $('#aPrevPage').hide();
    }
    if(this.cur_page == this.max_page){
        $('#aNextPage').hide();
    }
};


function get_related(aid, tp, div){
    var article_title = $('#article_title').text();
    $.ajax({
        url: config.get_related_api,
        data: { pg:1, plen:8, qs:article_title, tp: tp, aid: aid }
    }).done(function(ret){
        if(ret.estimate_cnt){
            for(var i = 0, count = 0, row; row = ret.result[i++];){
                if(row.aid == parseInt(aid)){
                    continue;
                }
                if(count == 8){
                    break;
                }

                var li = $('<li><a href="'
                    + row.link + '" target="_blank">'
                    + '</a></li>');
                li.children('a').text(row.title);
                $(div).append(li);
                count++;
            }
        }else{
            $(div).parent().hide();
        }
    }).fail(function(){
    });
}


function show_mark(data){
    $('#mark_count').text(data.count);
    if(data.first_time){
        $('#success').show();
    }
    if(data.i_marked){
        // TODO change color
    }
}
function mark(article_id){
    $.getJSON(config.mark_api + '?article_id=' + article_id,
        function(data){
            if(data.hasOwnProperty('is_logined') && data.is_logined === false){
                popShow('collection2');
                // no login, mark after login
                addLoginNotifyFunc(function(login_data){
                    if(login_data.is_logined){
                        mark(article_id);
                    }
                });
            }else{
                show_mark(data);
            }
        })
}

function show_help(data){
    $('#help_count').text(data.count);
    if(data.i_marked){
        // TODO change color
    }
}
function help(article_id){
    if(window.helped)
        return;
    $.getJSON(config.help_api + '?article_id=' + article_id,
        function(data){
            show_help(data);
            window.helped = true;
        });
}


//editor
function editor_on_submit(e) {
    document.getElementsByName('body')[0].value = image_encode(UE.getEditor('baike-editor').getContent());
    //e.preventDefault();
    var appendix = {};
    var rescs = UE.getEditor('baike-editor').options.resources||window.resources;
    appendix['default_album_id'] = rescs['default_album_id'];
    var list = [];
    for(var i = 0, album; album = rescs.albums[i++];){
        var tmp = {}, tmp_list = [];
        tmp['id'] = album.id.toString().indexOf('fake') != -1 ? '' : parseInt(album.id);
        tmp['description'] = album['description'];
        tmp['cover'] = album['cover'];
        for(var j = 0, image; image = album.images[j++];){
            var tmp_image = {
                id: image.id,
                description: image.description,
                url: image.url,
                thumbnail_url: image.thumbnail_url
            };
            tmp_list.push(tmp_image);
        }
        tmp['images'] = tmp_list;
        list.push(tmp);
    }
    appendix['albums'] = list;
    document.getElementsByName('resources')[0].value = JSON.stringify(appendix);
}
function preview(){
    if(!beforeSubmit()){
        return false;
    }
    $('#previewForm').empty();
    $('#submit_form :input[name]').each(function(){
        var i = $(this).clone().removeAttr('id')
            .appendTo('#previewForm');
        console.log(i.val());
    });
    $('#previewForm').submit();
}

function extract_keyword(){
    var text = $('#baidu_editor_0').contents().find('body').text();
    $.post(config.exkw_api, {
        'body': text
    }, function(data){
        var keywords = $.trim($('input[name="keywords"]').val()).split(/\s+/);
        for(var i = 0; i < data.keywords.length; i++){
            if($.inArray(data.keywords[i], keywords) == -1){
                // new keyword found
                keywords.push(data.keywords[i]);
            }
        }
        $('input[name="keywords"]').val(keywords.join(' '));
    }, 'json');
}

function show_author(username){
    $('#article-author').text('浣滆€咃細' + username + ' |');
}
function get_author(article_id){
    $.getJSON(config.article_api + article_id + '/author',
        function(data){
            if(data.author){
                show_author(data.author);
            }
        })
}

// multi-droplist
function push_options($select, list, parent_id){
    $select.empty();
    for(var i = 0; i < list.length; i++){
        if(list[i][2] == parent_id){
            $('<option>',{
                value: list[i][0],
                text: list[i][1]
            }).appendTo($select);
        }
    }
    ($select.children().length == 0) ? $select.hide() : $select.show();
}
function init_droplist(root, inputVal, list, initRootVal){
    // bind change event
    $(root).nextAll().andSelf().change(function(){
        var this_id = $(this).val();
        if(this_id != null){
          $(inputVal).val(this_id);
        }
        push_options($(this).next(), list, this_id);
        $(this).next().change();
    });
    // push init data to root
    push_options($(root), list, 0);
    if(initRootVal){
        $(root).val(initRootVal);
    }
    // trigger other root change to init rest lists
    $(root).change();
}

var LoginNotifyArray = [];
function addLoginNotifyFunc(func){
    LoginNotifyArray.push(func);
}

function show_login_state(login_data){
    if(login_data.is_logined){
        $('.ulLog').hide();
        $('#nav_username').text(login_data.user_name || login_data.ursname);
        $('.ulMes').fadeIn();
        $('#loglist').hide();
        $('#warning').hide();
    }else{
        $('.ulMes').hide();
        $('.ulLog').fadeIn();
    }
    for(var i = 0; i < LoginNotifyArray.length; i++){
        LoginNotifyArray[i](login_data);
    }
}
function get_login_state(){
    $.getJSON(config.userinfo_api, function(data){
        $(function(){
            show_login_state(data);
        });
    });
}

// check
function checkMes(){
    var text="";
    //鏍囬
    if($("#Title").val().length>50){
        text+="鏂囩珷鏍囬涓嶈兘瓒呰繃50瀛?</br>";
    }else if($("#Title").val().length==0){
        text+="鏂囩珷鏍囬涓嶈兘涓虹┖</br>";
    }
    //淇敼鍘熷洜
    if($("#Reason").length > 0){
        if($("#Reason").val().length==0){
            text+="淇敼鍘熷洜涓嶈兘涓虹┖</br>";
        }
    }
    //姝ｆ枃
    if($("#Content").val().length==0 && !($("#articleLink").val())){
        text+="姝ｆ枃鍐呭涓嶅緱涓虹┖</br>";
    }

    if(text.length>0){
        $("#Tips .li_3").html(text);
        popWindow("Tips");
        return false;
    }else{
        return true;
    }
}
function beforeSubmit(){
    editor_on_submit(null);
    return checkMes();
}
function afterSubmit(data, url){
    if(data.is_logined == false){
        get_login_state();
        $("#Tips .li_3").html('鏈櫥褰曪紝璇峰厛鐧诲綍銆?');
        popWindow("Tips");
        return false;
    }
    if(data._error == true){
        $("#Tips .li_3").html(data.msg);
        popWindow("Tips");
        return false;
    }
    return true;
}
function disableSubmitBtns(){
    $('#sumbit_article, #save_draft, #editout .save').attr('disabled', true);

}
function enableSubmitBtns(){
    $('#sumbit_article, #save_draft, #editout .save').removeAttr('disabled');

}
function addInternalLinks(dom, dict, rall){
    aho = new AhoCorasick();
    Node_TEXT_NODE = 3;
    var word_checked = {};
    var keys = [];
    for (var word in dict){
        aho.add(word, dict[word]);
        word_checked[word] = false;
    }
    dom.contents().filter(function(){
        return this.nodeType === Node_TEXT_NODE;
    }).each(function(){
        var _this = $(this)[0];
        if(_this.data){
            var offset = 0;
            aho.search(_this.data, function(word, link, pos){
                if(!word_checked[word]){
                    var _a = $('<a></a>').attr('href', link).attr('target', '_blank').text(word);
                    var endText = _this.data.substring(pos - offset + word.length);
                    var frontTextNode = document.createTextNode(_this.data.substring(0, pos - offset));
                    _this.data = endText;
                    _a.insertBefore($(_this));
                    $(frontTextNode).insertBefore(_a);
                    offset = pos + word.length;
                    if(!rall)
                        word_checked[word] = true;
                }
            }, true);
        }
    });
    /*
    var ss = {'key':'link', '鍏朵粬澶у攼':'link2', 'x澶у攼瀹樺簻':'link3', '瀹樺簻':'link4', '瀹樺簻t':'link5',
    '甯淳':'link6', '姝﹀櫒':'link7'};
    for(var i = 0; i < 1200; i++){
        ss[toString(i)] = 'l'+i;
    }
    addInternalLinks($('article p'), ss);*/
}