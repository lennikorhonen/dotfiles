#!/usr/bin/env bash


TYPE="${BLOCK_INSTANCE:-mem}"

awk -v type=$TYPE '
/^MemTotal:/ {
        mem_total=$2
}
/^MemFree:/{
        mem_free=$2
}
/^Buffers:/ {
	mem_free+=$2
}
/^Cached:/ {
	mem_free+=$2
}
/^SwapTotal:/ {
	swap_total=$2
}
/^SwapFree:/ {
	swap_free=$2
}
END {
    if (type == "swap") {
		free=swap_free/1024/1024
		used=(swap_total-swap_free)/1024/1024
		total=swap_total/1024/1024
	} else {
		free=mem_free/1024/1024
		used=(mem_total-mem_free)/1024/1024
		total=mem_total/1024/1024
	}
	pct=0
	if (total > 0) {
		pct=used/total*100
	}
	# full text
	printf("%.1fG/%.1fG", used, total)
}
' /proc/meminfo
