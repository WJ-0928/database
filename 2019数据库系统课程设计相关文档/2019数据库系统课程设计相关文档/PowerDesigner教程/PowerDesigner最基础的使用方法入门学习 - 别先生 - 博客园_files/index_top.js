/**
 * Created by Administrator on 2017/3/29 0029.
 */
//ҳ�������Ϻ󴥷�
window.onload = function () {
    var obtn = document.getElementById('btn');
    var timer = null;
    var isTop = true;
    //��ȡҳ����Ӹ߶�
    var clientHeight = document.documentElement.clientHeight;
    //����������ʱ����
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
        //���ö�ʱ������
        timer = setInterval(function () {

            //��ȡ���������붥���߶�
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