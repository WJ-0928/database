/**
 * Created by Administrator on 2017/3/29 0029.
 */
//页面加载完毕后触发
window.onload = function () {
    var obtn = document.getElementById('btn');
    var timer = null;
    var isTop = true;
    //获取页面可视高度
    var clientHeight = document.documentElement.clientHeight;
    //滚动条滚动时触发
    window.onscroll = function () {
        var osTop = document.documentElement.scrollTop || document.body.scrollTop;
        if (osTop >= clientHeight) {
            obtn.style.display = 'block';
        } else {
            obtn.style.display = 'none';
        }
        if (!isTop) {
            clearInterval(timer);
        }
        isTop = false;
    }
    obtn.onclick = function () {
        //设置定时器函数
        timer = setInterval(function () {

            //获取滚动条距离顶部高度
            var osTop = document.documentElement.scrollTop || document.body.scrollTop;

            var ispeed = Math.ceil(osTop / 6);
            document.documentElement.scrollTop = document.body.scrollTop = osTop - ispeed;
            isTop = true;

            if (osTop == 0) {
                clearInterval(timer);
            }
        }, 30);

    }
}