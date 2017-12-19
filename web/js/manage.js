/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function(){
    var ModalEffects = (function() {//弹出框
        function init() {
            var overlay = $('.md-overlay');
            var close=$(".md-close");
            var h3=$(".md-content h3");
            var form=$(".md-content form");
            $('.md-trigger' ).click(function() {
                var modal_num=$(this).attr( 'data-modal' );
                var modal = $('#'+modal_num);
                var userid=$(this).attr( 'user-id' );
                var username=$(this).attr( 'user-name' );
                var userpass=$(this).attr( 'user-pass' );
                //动态更改弹出框的标题和form的接受文件
                h3.text("修改用户信息");
                form.attr("action",'changeinfo.jsp');
                //自动填入信息
                $("#userid").val(userid);
                $("#username").val(username);
                $("#userpass").val(userpass);
                function removeModal() {
                    modal.removeClass('md-show');
                }
                modal.addClass('md-show');
                overlay.click(function () {
                    removeModal();
                });
                close.click(function() {
                    removeModal();
                });
            });
        };
        init();
    })();
})

