
#!/bin/bash
#每隔n秒，抓一次 内存、goroutine的数据

if [ $# -lt 3 ]
then
echo "please input two args, arg1: Number of times; arg2: interval in seconds"
exit
fi

CRTDIR=/home/guoling/`date "+%Y%m%d_%H%M%S"`
if [ ! -d "${CRTDIR}" ];then
	mkdir ${CRTDIR}
fi


for((i=0; i<$1; i++));do
#goroutinelog=/home/guoling/log/`date "+%Y%m%d_%H%M%S"`.goroutine.log
#heaplog=/home/guoling/log/`date "+%Y%m%d_%H%M%S"`.heap.out
goroutinelog=${CRTDIR}/`date "+%Y%m%d_%H%M%S"`.goroutine.log
heaplog=${CRTDIR}/`date "+%Y%m%d_%H%M%S"`.heap.out
echo "========================================================"`date` >>  $log

#curl  http://100.109.137.61:11400/debug/pprof/goroutine?debug=1 >> $goroutinelog
#curl  http://100.109.137.61:11400/debug/pprof/heap >> $heaplog

curl  http://$3:11400/debug/pprof/goroutine?debug=1 >> $goroutinelog
curl  http://$3:11400/debug/pprof/heap >> $heaplog

sleep $2
done
exit