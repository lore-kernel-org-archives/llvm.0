Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046D8612F
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 21:16:09 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id d2so5004698wrn.1
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 14:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date;
        bh=3XiJVgp82t7/oRaj8/50Rw+5puXKP8g4X8ap1kXZlIo=;
        b=NvZtdX14e0GjOciUIYWnzwmOhaRh0Ga6RZf2d9ReUtlykX0ZRVg0uIrstqglC6z10r
         p0wSNUqbrWTyFdKLcZROlZFqFf04OtqCu/oLs9GZqA+syLmO22ZrqeZh014b1z3KzbO9
         OySM2f6199E8Em5eJV7hJKn6+AU4/cgSvXeDZH6McQL6K86NtmmKLIQ0ARnE2dSuyKYS
         6/1bH+t376QL+yIoMNbDcfJ+tpdlXree5IjzDnIR0JgjO+cDMRC6VJ66J9M5/7YZCGuY
         Mz3CeuBBa0YBvZu/DGaBwYawlgCLAEw1fXzXH4pSEo+YbyysvozH0pWmqdYNcK3A3A+q
         ft0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3XiJVgp82t7/oRaj8/50Rw+5puXKP8g4X8ap1kXZlIo=;
        b=j0GhgwP5ycuuSTPSYPz88Nu1wFfvOy9ox6vRQTveX9ZOkr5MAuUvql5xkJKIPf49NM
         zNUSWcS1nWYoH4ZBAAAMNfgJe9MfZ44FVQynF7gbO1LKCNNjk+jy69Dx4KeLKWhs5oha
         pV0glKBRPmbjcsR0QnlimWJuiRP62zGTFXLjtY6hwfkg0YoqaW5OqOsazBrFWm0b1zDo
         zqznw195Kd7NsivJ1Z3IThY9+Y9JPxihW9W9tzLknBP5vxS/xeGqY9ppSwOHiJ/+BqW9
         QSp3m5Vh7KTZZfRV/7VMwMd1AxaDfYaqlM+wgnRIFNjEAvrtuihQ6cQkTFXK1H+gWuOL
         peFw==
X-Gm-Message-State: ACgBeo3r4ja+uS3MB+F7ZRuXEvXTU/SlWOsH2faCklFuPrVjyw0ExI/G
	CZnKNwNk9c5cxz96bHCuttkhLA==
X-Google-Smtp-Source: AA6agR7rfuYGRc/eQAsk4fNil4x8C/8SHshbq06NnGcKnV/LLdqpc32siZYwRqNzbRBNZVHWfNFDdA==
X-Received: by 2002:a5d:4904:0:b0:228:610b:296d with SMTP id x4-20020a5d4904000000b00228610b296dmr9508982wrq.450.1662758168110;
        Fri, 09 Sep 2022 14:16:08 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a4efb794d7sm1624805wmi.36.2022.09.09.14.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 14:16:07 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 9 Sep 2022 21:16:06 +0000 (UTC)
To: Menglong Dong <imagedong@tencent.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1466385441.16156.1662758167647@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.0-rc3-161-g9cb252c4c1c5: net: skb:
 export skb drop reaons to user by TRACE_DEFINE_ENUM
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_16155_355025725.1662758167045"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-mainline-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_16155_355025725.1662758167045
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.0-rc3-161-g9cb252c4c1c5: net: skb: export skb drop reaons to user by TRACE_DEFINE_ENUM:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23020
# First few build errors in logs:
# 00:05:23 crypto/wp512.c:782:13: error: stack frame size (1160) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:05:23 make[1]: *** [scripts/Makefile.build:249: crypto/wp512.o] Error 1
# 00:08:01 make: *** [Makefile:1853: crypto] Error 2
# 00:08:21 sound/soc/atmel/mchp-spdiftx.c:505:20: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
# 00:08:21 make[3]: *** [scripts/Makefile.build:249: sound/soc/atmel/mchp-spdiftx.o] Error 1
# 00:08:48 make[2]: *** [scripts/Makefile.build:465: sound/soc/atmel] Error 2
# 00:15:57 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
# 00:15:57 make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
# 00:16:16 make[3]: *** [scripts/Makefile.build:465: drivers/gpu/drm/selftests] Error 2
# 00:28:00 make[1]: *** [scripts/Makefile.build:465: sound/soc] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23021

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
Status of v6.0-rc3-161-g9cb252c4c1c5 commit for tcwg_kernel:
commit 9cb252c4c1c53ae58bc565bab76e98133288f23a
Author: Menglong Dong <imagedong@tencent.com>
Date:   Mon Sep 5 11:50:15 2022 +0800

    net: skb: export skb drop reaons to user by TRACE_DEFINE_ENUM
    
    As Eric reported, the 'reason' field is not presented when trace the
    kfree_skb event by perf:
    
    $ perf record -e skb:kfree_skb -a sleep 10
    $ perf script
      ip_defrag 14605 [021]   221.614303:   skb:kfree_skb:
      skbaddr=0xffff9d2851242700 protocol=34525 location=0xffffffffa39346b1
      reason:
    
    The cause seems to be passing kernel address directly to TP_printk(),
    which is not right. As the enum 'skb_drop_reason' is not exported to
    user space through TRACE_DEFINE_ENUM(), perf can't get the drop reason
    string from the 'reason' field, which is a number.
    
    Therefore, we introduce the macro DEFINE_DROP_REASON(), which is used
    to define the trace enum by TRACE_DEFINE_ENUM(). With the help of
    DEFINE_DROP_REASON(), now we can remove the auto-generate that we
    introduced in the commit ec43908dd556
    ("net: skb: use auto-generation to convert skb drop reason to string"),
    and define the string array 'drop_reasons'.
    
    Hmmmm...now we come back to the situation that have to maintain drop
    reasons in both enum skb_drop_reason and DEFINE_DROP_REASON. But they
    are both in dropreason.h, which makes it easier.
    
    After this commit, now the format of kfree_skb is like this:
    
    $ cat /tracing/events/skb/kfree_skb/format
    name: kfree_skb
    ID: 1524
    format:
            field:unsigned short common_type;       offset:0;       size:2; signed:0;
            field:unsigned char common_flags;       offset:2;       size:1; signed:0;
            field:unsigned char common_preempt_count;       offset:3;       size:1; signed:0;
            field:int common_pid;   offset:4;       size:4; signed:1;
    
            field:void * skbaddr;   offset:8;       size:8; signed:0;
            field:void * location;  offset:16;      size:8; signed:0;
            field:unsigned short protocol;  offset:24;      size:2; signed:0;
            field:enum skb_drop_reason reason;      offset:28;      size:4; signed:0;
    
    print fmt: "skbaddr=%p protocol=%u location=%p reason: %s", REC->skbaddr, REC->protocol, REC->location, __print_symbolic(REC->reason, { 1, "NOT_SPECIFIED" }, { 2, "NO_SOCKET" } ......
    
    Fixes: ec43908dd556 ("net: skb: use auto-generation to convert skb drop reason to string")
    Link: https://lore.kernel.org/netdev/CANn89i+bx0ybvE55iMYf5GJM48WwV1HNpdm9Q6t-HaEstqpCSA@mail.gmail.com/
    Reported-by: Eric Dumazet <edumazet@google.com>
    Signed-off-by: Menglong Dong <imagedong@tencent.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>
* llvm-master-arm-mainline-allmodconfig
** Failure after v6.0-rc3-161-g9cb252c4c1c5: net: skb: export skb drop reaons to user by TRACE_DEFINE_ENUM:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-mainline-allmodconfig/482/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-mainline-allmodconfig/482/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-mainline-allmodconfig/481/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-9cb252c4c1c53ae58bc565bab76e98133288f23a
cd investigate-linux-9cb252c4c1c53ae58bc565bab76e98133288f23a

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-mainline-allmodconfig/482/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-mainline-allmodconfig/481/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit 9cb252c4c1c53ae58bc565bab76e98133288f23a
Author: Menglong Dong <imagedong@tencent.com>
Date:   Mon Sep 5 11:50:15 2022 +0800

    net: skb: export skb drop reaons to user by TRACE_DEFINE_ENUM
    
    As Eric reported, the 'reason' field is not presented when trace the
    kfree_skb event by perf:
    
    $ perf record -e skb:kfree_skb -a sleep 10
    $ perf script
      ip_defrag 14605 [021]   221.614303:   skb:kfree_skb:
      skbaddr=0xffff9d2851242700 protocol=34525 location=0xffffffffa39346b1
      reason:
    
    The cause seems to be passing kernel address directly to TP_printk(),
    which is not right. As the enum 'skb_drop_reason' is not exported to
    user space through TRACE_DEFINE_ENUM(), perf can't get the drop reason
    string from the 'reason' field, which is a number.
    
    Therefore, we introduce the macro DEFINE_DROP_REASON(), which is used
    to define the trace enum by TRACE_DEFINE_ENUM(). With the help of
    DEFINE_DROP_REASON(), now we can remove the auto-generate that we
    introduced in the commit ec43908dd556
    ("net: skb: use auto-generation to convert skb drop reason to string"),
    and define the string array 'drop_reasons'.
    
    Hmmmm...now we come back to the situation that have to maintain drop
    reasons in both enum skb_drop_reason and DEFINE_DROP_REASON. But they
    are both in dropreason.h, which makes it easier.
    
    After this commit, now the format of kfree_skb is like this:
    
    $ cat /tracing/events/skb/kfree_skb/format
    name: kfree_skb
    ID: 1524
    format:
            field:unsigned short common_type;       offset:0;       size:2; signed:0;
            field:unsigned char common_flags;       offset:2;       size:1; signed:0;
            field:unsigned char common_preempt_count;       offset:3;       size:1; signed:0;
            field:int common_pid;   offset:4;       size:4; signed:1;
    
            field:void * skbaddr;   offset:8;       size:8; signed:0;
            field:void * location;  offset:16;      size:8; signed:0;
            field:unsigned short protocol;  offset:24;      size:2; signed:0;
            field:enum skb_drop_reason reason;      offset:28;      size:4; signed:0;
    
    print fmt: "skbaddr=%p protocol=%u location=%p reason: %s", REC->skbaddr, REC->protocol, REC->location, __print_symbolic(REC->reason, { 1, "NOT_SPECIFIED" }, { 2, "NO_SOCKET" } ......
    
    Fixes: ec43908dd556 ("net: skb: use auto-generation to convert skb drop reason to string")
    Link: https://lore.kernel.org/netdev/CANn89i+bx0ybvE55iMYf5GJM48WwV1HNpdm9Q6t-HaEstqpCSA@mail.gmail.com/
    Reported-by: Eric Dumazet <edumazet@google.com>
    Signed-off-by: Menglong Dong <imagedong@tencent.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>
---
 include/net/dropreason.h   | 67 ++++++++++++++++++++++++++++++++++++++++++++++
 include/trace/events/skb.h | 15 ++++++++++-
 net/core/.gitignore        |  1 -
 net/core/Makefile          | 22 +--------------
 net/core/skbuff.c          |  6 ++++-
 5 files changed, 87 insertions(+), 24 deletions(-)

diff --git a/include/net/dropreason.h b/include/net/dropreason.h
index fae9b40e54fa..c1cbcdbaf149 100644
--- a/include/net/dropreason.h
+++ b/include/net/dropreason.h
@@ -3,6 +3,73 @@
 #ifndef _LINUX_DROPREASON_H
 #define _LINUX_DROPREASON_H
 
+#define DEFINE_DROP_REASON(FN, FNe)	\
+	FN(NOT_SPECIFIED)		\
+	FN(NO_SOCKET)			\
+	FN(PKT_TOO_SMALL)		\
+	FN(TCP_CSUM)			\
+	FN(SOCKET_FILTER)		\
+	FN(UDP_CSUM)			\
+	FN(NETFILTER_DROP)		\
+	FN(OTHERHOST)			\
+	FN(IP_CSUM)			\
+	FN(IP_INHDR)			\
+	FN(IP_RPFILTER)			\
+	FN(UNICAST_IN_L2_MULTICAST)	\
+	FN(XFRM_POLICY)			\
+	FN(IP_NOPROTO)			\
+	FN(SOCKET_RCVBUFF)		\
+	FN(PROTO_MEM)			\
+	FN(TCP_MD5NOTFOUND)		\
+	FN(TCP_MD5UNEXPECTED)		\
+	FN(TCP_MD5FAILURE)		\
+	FN(SOCKET_BACKLOG)		\
+	FN(TCP_FLAGS)			\
+	FN(TCP_ZEROWINDOW)		\
+	FN(TCP_OLD_DATA)		\
+	FN(TCP_OVERWINDOW)		\
+	FN(TCP_OFOMERGE)		\
+	FN(TCP_RFC7323_PAWS)		\
+	FN(TCP_INVALID_SEQUENCE)	\
+	FN(TCP_RESET)			\
+	FN(TCP_INVALID_SYN)		\
+	FN(TCP_CLOSE)			\
+	FN(TCP_FASTOPEN)		\
+	FN(TCP_OLD_ACK)			\
+	FN(TCP_TOO_OLD_ACK)		\
+	FN(TCP_ACK_UNSENT_DATA)		\
+	FN(TCP_OFO_QUEUE_PRUNE)		\
+	FN(TCP_OFO_DROP)		\
+	FN(IP_OUTNOROUTES)		\
+	FN(BPF_CGROUP_EGRESS)		\
+	FN(IPV6DISABLED)		\
+	FN(NEIGH_CREATEFAIL)		\
+	FN(NEIGH_FAILED)		\
+	FN(NEIGH_QUEUEFULL)		\
+	FN(NEIGH_DEAD)			\
+	FN(TC_EGRESS)			\
+	FN(QDISC_DROP)			\
+	FN(CPU_BACKLOG)			\
+	FN(XDP)				\
+	FN(TC_INGRESS)			\
+	FN(UNHANDLED_PROTO)		\
+	FN(SKB_CSUM)			\
+	FN(SKB_GSO_SEG)			\
+	FN(SKB_UCOPY_FAULT)		\
+	FN(DEV_HDR)			\
+	FN(DEV_READY)			\
+	FN(FULL_RING)			\
+	FN(NOMEM)			\
+	FN(HDR_TRUNC)			\
+	FN(TAP_FILTER)			\
+	FN(TAP_TXFILTER)		\
+	FN(ICMP_CSUM)			\
+	FN(INVALID_PROTO)		\
+	FN(IP_INADDRERRORS)		\
+	FN(IP_INNOROUTES)		\
+	FN(PKT_TOO_BIG)			\
+	FNe(MAX)
+
 /**
  * enum skb_drop_reason - the reasons of skb drops
  *
diff --git a/include/trace/events/skb.h b/include/trace/events/skb.h
index 45264e4bb254..50a974f7dfb4 100644
--- a/include/trace/events/skb.h
+++ b/include/trace/events/skb.h
@@ -9,6 +9,15 @@
 #include <linux/netdevice.h>
 #include <linux/tracepoint.h>
 
+#undef FN
+#define FN(reason)	TRACE_DEFINE_ENUM(SKB_DROP_REASON_##reason);
+DEFINE_DROP_REASON(FN, FN)
+
+#undef FN
+#undef FNe
+#define FN(reason)	{ SKB_DROP_REASON_##reason, #reason },
+#define FNe(reason)	{ SKB_DROP_REASON_##reason, #reason }
+
 /*
  * Tracepoint for free an sk_buff:
  */
@@ -35,9 +44,13 @@ TRACE_EVENT(kfree_skb,
 
 	TP_printk("skbaddr=%p protocol=%u location=%p reason: %s",
 		  __entry->skbaddr, __entry->protocol, __entry->location,
-		  drop_reasons[__entry->reason])
+		  __print_symbolic(__entry->reason,
+				   DEFINE_DROP_REASON(FN, FNe)))
 );
 
+#undef FN
+#undef FNe
+
 TRACE_EVENT(consume_skb,
 
 	TP_PROTO(struct sk_buff *skb),
diff --git a/net/core/.gitignore b/net/core/.gitignore
deleted file mode 100644
index df1e74372cce..000000000000
--- a/net/core/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-dropreason_str.c
diff --git a/net/core/Makefile b/net/core/Makefile
index e8ce3bd283a6..5857cec87b83 100644
--- a/net/core/Makefile
+++ b/net/core/Makefile
@@ -5,7 +5,7 @@
 
 obj-y := sock.o request_sock.o skbuff.o datagram.o stream.o scm.o \
 	 gen_stats.o gen_estimator.o net_namespace.o secure_seq.o \
-	 flow_dissector.o dropreason_str.o
+	 flow_dissector.o
 
 obj-$(CONFIG_SYSCTL) += sysctl_net_core.o
 
@@ -40,23 +40,3 @@ obj-$(CONFIG_NET_SOCK_MSG) += skmsg.o
 obj-$(CONFIG_BPF_SYSCALL) += sock_map.o
 obj-$(CONFIG_BPF_SYSCALL) += bpf_sk_storage.o
 obj-$(CONFIG_OF)	+= of_net.o
-
-clean-files := dropreason_str.c
-
-quiet_cmd_dropreason_str = GEN     $@
-cmd_dropreason_str = awk -F ',' 'BEGIN{ print "\#include <net/dropreason.h>\n"; \
-	print "const char * const drop_reasons[] = {" }\
-	/^enum skb_drop/ { dr=1; }\
-	/^\};/ { dr=0; }\
-	/^\tSKB_DROP_REASON_/ {\
-		if (dr) {\
-			sub(/\tSKB_DROP_REASON_/, "", $$1);\
-			printf "\t[SKB_DROP_REASON_%s] = \"%s\",\n", $$1, $$1;\
-		}\
-	}\
-	END{ print "};" }' $< > $@
-
-$(obj)/dropreason_str.c: $(srctree)/include/net/dropreason.h
-	$(call cmd,dropreason_str)
-
-$(obj)/dropreason_str.o: $(obj)/dropreason_str.c
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 84bb5e188d0d..417463da4fac 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -91,7 +91,11 @@ static struct kmem_cache *skbuff_ext_cache __ro_after_init;
 int sysctl_max_skb_frags __read_mostly = MAX_SKB_FRAGS;
 EXPORT_SYMBOL(sysctl_max_skb_frags);
 
-/* The array 'drop_reasons' is auto-generated in dropreason_str.c */
+#undef FN
+#define FN(reason) [SKB_DROP_REASON_##reason] = #reason,
+const char * const drop_reasons[] = {
+	DEFINE_DROP_REASON(FN, FN)
+};
 EXPORT_SYMBOL(drop_reasons);
 
 /**
</cut>
------=_Part_16155_355025725.1662758167045--
