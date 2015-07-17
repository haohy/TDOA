(function ($) {
            $.fn.extend({
                MultDropList: function (options) {
                    var op = $.extend({ wraperClass: "wraper", width: "150px", height: "200px", data:"", selected: "" }, options);
                    return this.each(function () {
                        var $this = $(this); //指向TextBox
                        var $hf = $(this).next(); //指向隐藏控件存
                        var conSelector = "#" + $this.attr("id") + ",#" + $hf.attr("id");
                        var $wraper = $(conSelector).wrapAll("<div><div></div></div>").parent().parent().addClass(op.wraperClass);

                        var $list = $('<div class="list"></div>').appendTo($wraper);
                        $list.css({ "width": op.width, "height": op.height });
                        //控制弹出页面的显示与隐藏
                        $this.click(function (e) {
                            $(".list").hide();
                            $list.toggle();
                            e.stopPropagation();
                        });

                        $(document).click(function () {
                            $list.hide();
                        });

                        $list.filter("*").click(function (e) {
                            e.stopPropagation();
                        });
                        //加载默认数据
                        $list.append('<ul style="list-style-type:none;margin:0;"><li style="margin:0;padding-left: 10px;padding-top: 2px;padding-bottom: 2px;border-top: 1px solid black;"><input type="checkbox" class="selectAll" value="" /><span>全部</span></li></ul>');
                        var $ul = $list.find("ul");

                        //加载json数据
                        // var listArr = op.data.split("|");
                        // var jsonData;
                        // for (var i = 0; i < listArr.length; i++) {
                        //     jsonData = eval("(" + listArr[i] + ")");
                        //     $ul.append('<li><input type="checkbox" value="' + jsonData.k + '" /><span>' + jsonData.v + '</span></li>');
                        // }
                        {% for a in account_list %}
                            $ul.append('<li><input type="checkbox" value="' + {{a['account_id']}} + '" /><span>' + {{a['account_username']}} + '</span></li>');
                        {% endfor %}
                        //加载勾选项
                        var seledArr;
                        if (op.selected.length > 0) {
                            seledArr = selected.split(",");
                        }
                        else {
                            seledArr = $hf.val().split(",");
                        }

                        $.each(seledArr, function (index) {
                            $("li input[value='" + seledArr[index] + "']", $ul).attr("checked", "checked");

                            var vArr = new Array();
                            $("input[class!='selectAll']:checked", $ul).each(function (index) {
                                vArr[index] = $(this).next().text();
                            });
                            $this.val(vArr.join(","));
                        });
                        //全部选择或全不选
                        $("li:first input", $ul).click(function () {
                            if ($(this).attr("checked")) {
                                $("li input", $ul).attr("checked", "checked");
                            }
                            else {
                                $("li input", $ul).removeAttr("checked");
                            }
                        });
                        //点击其它复选框时，更新隐藏控件值,文本框的值
                        $("input", $ul).click(function () {
                            var kArr = new Array();
                            var vArr = new Array();
                            $("input[class!='selectAll']:checked", $ul).each(function (index) {
                                kArr[index] = $(this).val();
                                vArr[index] = $(this).next().text();
                            });
                            $hf.val(kArr.join(","));
                            $this.val(vArr.join(","));
                        });
                    });
                }
            });
        })(jQuery);
        $(document).ready(function () {
            $("#txtTest").MultDropList({ data: account_list);
        });
