window.onload=function(){
    var tags = gon.tagnames;                    /* 모든 태그들이 tags에 ["dawdawawd", 1],["ㅁㅈㅇㅁㅈ",1] 형태로  들어감 */
    var car = {type:"Fiat", model:"500", color:"white"};
    $('.autocomplete_tags').textcomplete([{
        match: /()([ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]{1,})$/,  /* # 이후 한/영/숫자를 첫째자리부터 포착 */
        search: function (term, callback) {
            callback($.map(tags, function (whole) {        /*tags = whole = ["dawdawawd", 1] 와 같은 형식*/
                if (whole.name.indexOf(term) === 0) {     /* 입력된 단어(term)로 시작하면 whole 그대로, 아니면 null값으로 처리 */
                    return whole;         /*whole = ["dawdawawd", 1] 와 같은 형식으로 리턴됨*/
                } else {
                    whole : null;
                }
            }));
        },
        template: function (whole) {                           /*여기서 whole = "dawdawawd"가 되어버림*/
            return '<span class="name">' + whole.name + '</span>' + '<span class="count">' + whole.count +'개</span>';
        },                                                  /*따라서 whole[0]="d", whole[1] = "a"가 출력됨 */
        replace: function (whole) {
            return whole.name;
        }
    }]);
};
