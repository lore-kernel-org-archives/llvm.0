Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0843BEA9
	for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 10:44:50 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id v17so1639376wrr.10
        for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 03:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=uaACk8aB106Pm4kBZQjg3nHXs1k6CJRv4crnQ8u87ek=;
        b=yySxSnQGY2vSs0Ooh0WME7QsPEtzT0kZH8QA6e0p3h7P2mM0/eMbxqBtU0EnlsDxbY
         6wOaQjGdYs3TuBNCU/aY8toFqCrnFzcB2PJCHkR3b4mKtMjJUvBl5MNxs22E7OKYRmIc
         UeCwujn1zlhucvFhTdoyDGsEptIxjOvuHdIsM2dhdmn2q8PGBoW76j7hVgfBMJJxVhl3
         YZ5IBifagekDZejKGuyjzKQH8eoFy1a7CtRs9q4fZ8KakXhwqSCnY53Yi90rfbw+QtGo
         YhTcsvJi6WaW5v+QMOqW677XkTKWY8KtTyDcyaXQNLbyphhNqFdUXEE91ZApag6FeYgb
         yJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=uaACk8aB106Pm4kBZQjg3nHXs1k6CJRv4crnQ8u87ek=;
        b=IdEqldrwkmw1HW6e7sPIgRGQMTU6V3I5ze5GYLTfm7gRT2Rg+ZknmLGV6+q9n7oz1K
         9u4Zl4+dNLAnihPs+qX0bkqwyq9x+WouGZBnhgu0MOTyFID4T0+C6miXiQmTNNNPtLuI
         0s1L8DJnAMXE/G2ArpdpA+/S8VYv5/rQ6pkicgjF+7IQ3pNX+Cxj9rFu8h6LhIqBEb1K
         iubxZLK0zonsszWpgEimpebXQsen/uDlKG2mddigKW0BYYIz8aPdo5K1at3huS31DNWP
         AhP35qWGg0LrseZkj5DlCZy7jY4zqVkDP4ewtHzfnNzM+tV84zG6ejfFirznbGSmT41i
         UZoQ==
X-Gm-Message-State: AJIora/4km2ESVTo0P7FHlT9kuLiB5k+ar6M+Fg7qdTLVPKYfZ/kmRVy
	0dqXezUkQeM0bZsH0amcBEoJlw==
X-Google-Smtp-Source: AGRyM1t0fk4z95JoRN2yfEkfac+nUWbfyq1erCDhAfx+Cw6ELn87ZWYprxU4L1CPfP4jVLnvuHpCKQ==
X-Received: by 2002:a5d:4dcc:0:b0:21e:e644:6af8 with SMTP id f12-20020a5d4dcc000000b0021ee6446af8mr3299637wru.219.1659005089287;
        Thu, 28 Jul 2022 03:44:49 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id n65-20020a1c2744000000b0039c54bb28f2sm850255wmn.36.2022.07.28.03.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 03:44:48 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 28 Jul 2022 10:44:47 +0000 (UTC)
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1018614581.3084.1659005088801@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by linux: lib/nodemask: inline
 next_node_in() and node_random()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3083_1227124068.1659005087901"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-release-arm-norov-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_3083_1227124068.1659005087901
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by linux: lib/nodemask: inline next_node_in() and node_random():
commit 9f0b715d001153c4002b39f2e1acdf9183e3735b
Author: Yury Norov <yury.norov@gmail.com>

    lib/nodemask: inline next_node_in() and node_random()

Results regressed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
22763
# First few build errors in logs:
# 00:05:24 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:05:24 make[1]: *** [crypto/wp512.o] Error 1
# 00:09:07 make: *** [crypto] Error 2
# 00:15:25 sound/soc/intel/avs/path.c:815:18: error: stack frame size (1232) exceeds limit (1024) in 'avs_path_create' [-Werror,-Wframe-larger-than]
# 00:15:25 make[4]: *** [sound/soc/intel/avs/path.o] Error 1
# 00:15:51 make[3]: *** [sound/soc/intel/avs] Error 2
# 00:15:51 make[2]: *** [sound/soc/intel] Error 2
# 00:24:21 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
# 00:24:21 make[4]: *** [drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
# 00:24:56 make[3]: *** [drivers/gpu/drm/selftests] Error 2

from
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
22764

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-release-arm-norov-allmodconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allmodconfig/1/artifact/artifacts/build-9f0b715d001153c4002b39f2e1acdf9183e3735b/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allmodconfig/1/artifact/artifacts/build-c3aaaf9e2ada48c0e3d03203ca6458362a639c2c/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allmodconfig/1/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allmodconfig/1/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-linux-9f0b715d001153c4002b39f2e1acdf9183e3735b
cd investigate-linux-9f0b715d001153c4002b39f2e1acdf9183e3735b

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allmodconfig/1/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allmodconfig/1/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allmodconfig/1/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/

cd linux

# Reproduce first_bad build
git checkout --detach 9f0b715d001153c4002b39f2e1acdf9183e3735b
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach c3aaaf9e2ada48c0e3d03203ca6458362a639c2c
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 9f0b715d001153c4002b39f2e1acdf9183e3735b
Author: Yury Norov <yury.norov@gmail.com>
Date:   Mon Jul 25 09:39:17 2022 -0700

    lib/nodemask: inline next_node_in() and node_random()
    
    The functions are pretty thin wrappers around find_bit engine, and
    keeping them in c-file prevents compiler from small_const_nbits()
    optimization, which must take place for all systems with MAX_NUMNODES
    less than BITS_PER_LONG (default is 16 for me).
    
    Moving them to header file doesn't blow up the kernel size:
    add/remove: 1/2 grow/shrink: 9/5 up/down: 968/-88 (880)
    
    CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
    CC: Michael Ellerman <mpe@ellerman.id.au>
    CC: Paul Mackerras <paulus@samba.org>
    CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>
    CC: Stephen Rothwell <sfr@canb.auug.org.au>
    CC: linuxppc-dev@lists.ozlabs.org
    Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 MAINTAINERS              |  1 -
 include/linux/nodemask.h | 24 +++++++++++++++++++-----
 lib/Makefile             |  2 +-
 lib/nodemask.c           |  8 --------
 4 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c0b8f28aa25..19c8d0ef1177 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3540,7 +3540,6 @@ F:	lib/bitmap.c
 F:	lib/cpumask.c
 F:	lib/find_bit.c
 F:	lib/find_bit_benchmark.c
-F:	lib/nodemask.c
 F:	lib/test_bitmap.c
 F:	tools/include/linux/bitmap.h
 F:	tools/include/linux/find.h
diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 0f233b76c9ce..4b71a96190a8 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -94,6 +94,7 @@
 #include <linux/bitmap.h>
 #include <linux/minmax.h>
 #include <linux/numa.h>
+#include <linux/random.h>
 
 typedef struct { DECLARE_BITMAP(bits, MAX_NUMNODES); } nodemask_t;
 extern nodemask_t _unused_nodemask_arg_;
@@ -276,7 +277,14 @@ static inline unsigned int __next_node(int n, const nodemask_t *srcp)
  * the first node in src if needed.  Returns MAX_NUMNODES if src is empty.
  */
 #define next_node_in(n, src) __next_node_in((n), &(src))
-unsigned int __next_node_in(int node, const nodemask_t *srcp);
+static inline unsigned int __next_node_in(int node, const nodemask_t *srcp)
+{
+	unsigned int ret = __next_node(node, srcp);
+
+	if (ret == MAX_NUMNODES)
+		ret = __first_node(srcp);
+	return ret;
+}
 
 static inline void init_nodemask_of_node(nodemask_t *mask, int node)
 {
@@ -493,14 +501,20 @@ static inline int num_node_state(enum node_states state)
 
 #endif
 
+static inline int node_random(const nodemask_t *maskp)
+{
 #if defined(CONFIG_NUMA) && (MAX_NUMNODES > 1)
-extern int node_random(const nodemask_t *maskp);
+	int w, bit = NUMA_NO_NODE;
+
+	w = nodes_weight(*maskp);
+	if (w)
+		bit = bitmap_ord_to_pos(maskp->bits,
+			get_random_int() % w, MAX_NUMNODES);
+	return bit;
 #else
-static inline int node_random(const nodemask_t *mask)
-{
 	return 0;
-}
 #endif
+}
 
 #define node_online_map 	node_states[N_ONLINE]
 #define node_possible_map 	node_states[N_POSSIBLE]
diff --git a/lib/Makefile b/lib/Makefile
index f99bf61f8bbc..731cea0342d1 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -33,7 +33,7 @@ lib-y := ctype.o string.o vsprintf.o cmdline.o \
 	 flex_proportions.o ratelimit.o show_mem.o \
 	 is_single_threaded.o plist.o decompress.o kobject_uevent.o \
 	 earlycpio.o seq_buf.o siphash.o dec_and_lock.o \
-	 nmi_backtrace.o nodemask.o win_minmax.o memcat_p.o \
+	 nmi_backtrace.o win_minmax.o memcat_p.o \
 	 buildid.o
 
 lib-$(CONFIG_PRINTK) += dump_stack.o
diff --git a/lib/nodemask.c b/lib/nodemask.c
index e22647f5181b..b8a433d16b51 100644
--- a/lib/nodemask.c
+++ b/lib/nodemask.c
@@ -3,14 +3,6 @@
 #include <linux/module.h>
 #include <linux/random.h>
 
-unsigned int __next_node_in(int node, const nodemask_t *srcp)
-{
-	unsigned int ret = __next_node(node, srcp);
-
-	if (ret == MAX_NUMNODES)
-		ret = __first_node(srcp);
-	return ret;
-}
 EXPORT_SYMBOL(__next_node_in);
 
 #ifdef CONFIG_NUMA
</cut>
------=_Part_3083_1227124068.1659005087901--
