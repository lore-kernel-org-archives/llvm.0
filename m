Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA877E
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 00:51:11 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id g2so3187373wru.3
        for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 17:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=DmFyg1CN2o5VRbsjH2H++Oaq6yIdZnw3gQvIj7LuIXI=;
        b=wuBFOMIUj7RrT6tfp5HXdfHRS2SbTf4JHFkmEME5G4qKkjYWNh0MQUaRgSg/EOwf5k
         JRfvVsgBxw2bdANI1G7gVQJ9ybOo1u/bw5g1p7uj+U9/fJKQ9tFKSplDdCgHLi6erv/1
         HXDnDNql3iMfOk6v9IBxyK3XCgeAj2nlEATjFR9WjFlZDW0eaSHiVbEoIkwdVPFogW9p
         H6LdIC0BvmFVTxtHDjJziwvUNEC6sMl0I8ZMEFagdiHRFFi8ww8QJomDgAi1QDXWS0fs
         3LDtSnhdv8UKjLY0CC3zrcrhwEzlnvESGKtU9KkXCBJUNYcvGmqA9ih1zzaiZppgxaHz
         Iz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=DmFyg1CN2o5VRbsjH2H++Oaq6yIdZnw3gQvIj7LuIXI=;
        b=rW2uk3ogtznZHFYyBq9mymtR0ujxKr+O0k1gNH1Z4vSNOV4qK7npw3Q3ujNTZnlG/k
         N+eKyRBezmrHpKKC463MnaXZl2HxSALpMm2htWBKU31B0vXDYHRVkKW6BtNUXXeG0J+j
         lSoJaCCzNyzaUvoyctBEk19WVOhwAvfMTTgcBSRQndRTBtLnEWNLlfJE7BJPjoj4sEk9
         hH2YX7K8RMr1arU6lFL/uLc5ZFriliHR4Mkl8K//KJi8oHuaUmFrbP3bBRZFUA5VKmBv
         tZVQT6HAFWIiIv0gJ9HldXXfaDUBG7tskouQKA6s7b9PZAHtWFcSrcYCoT4m5GcKympa
         6/FA==
X-Gm-Message-State: AJIora85VWmnVCldx/+6li2qoyQnSDD3WEAOcIUbN0n+kRinTjTF96cH
	+GGlRdPb6JsOHy3ZmU2ZXZACrA==
X-Google-Smtp-Source: AGRyM1tKT2hodyeGooqbZ2mogjArcLBM7h+Rb5JNSfQox/fG53EZfUIEhAmTvh2V3cVoUwTqoUXWuw==
X-Received: by 2002:a5d:595e:0:b0:21e:6e2a:2a11 with SMTP id e30-20020a5d595e000000b0021e6e2a2a11mr3255244wri.46.1658623869347;
        Sat, 23 Jul 2022 17:51:09 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id r16-20020adfdc90000000b0021cf31e1f7csm8361848wrj.102.2022.07.23.17.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 17:51:09 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 24 Jul 2022 00:51:08 +0000 (UTC)
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1255100749.2407.1658623869025@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by linux: lib/nodemask: inline
 next_node_in() and node_random()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2406_1400273107.1658623868345"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-release-arm-norov-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_2406_1400273107.1658623868345
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by linux: lib/nodemask: inline next_node_in() and node_random():
commit bbe8fb1a3c5301384d54cd6d722850182817358e
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
20659
# First few build errors in logs:
# 00:04:42 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:04:42 make[1]: *** [crypto/wp512.o] Error 1
# 00:08:42 make: *** [crypto] Error 2
# 00:11:07 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
# 00:11:07 make[4]: *** [drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
# 00:11:32 make[3]: *** [drivers/gpu/drm/selftests] Error 2
# 00:21:27 drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: error: stack frame size (1096) exceeds limit (1024) in 'cfi_intelext_writev' [-Werror,-Wframe-larger-than]
# 00:21:27 make[3]: *** [drivers/mtd/chips/cfi_cmdset_0001.o] Error 1
# 00:21:43 make[2]: *** [drivers/mtd/chips] Error 2
# 00:21:43 sound/soc/intel/avs/path.c:815:18: error: stack frame size (1232) exceeds limit (1024) in 'avs_path_create' [-Werror,-Wframe-larger-than]

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
20660

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-release-arm-norov-allyesconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/1/artifact/artifacts/build-bbe8fb1a3c5301384d54cd6d722850182817358e/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/1/artifact/artifacts/build-7ac97b2db80a5f6edd333f8b4a6b79610d164f7f/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/1/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/1/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-linux-bbe8fb1a3c5301384d54cd6d722850182817358e
cd investigate-linux-bbe8fb1a3c5301384d54cd6d722850182817358e

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/1/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/1/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/1/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/

cd linux

# Reproduce first_bad build
git checkout --detach bbe8fb1a3c5301384d54cd6d722850182817358e
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 7ac97b2db80a5f6edd333f8b4a6b79610d164f7f
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit bbe8fb1a3c5301384d54cd6d722850182817358e
Author: Yury Norov <yury.norov@gmail.com>
Date:   Sun Jul 10 21:47:11 2022 -0700

    lib/nodemask: inline next_node_in() and node_random()
    
    The functions are pretty thin wrappers around find_bit engine, and
    keeping them in c-file prevents compiler from small_const_nbits()
    optimization, which must take place for all systems with MAX_NUMNODES
    less than BITS_PER_LONG (default is 16 for me).
    
    Moving them in header file doesn't blow up the kernel size:
    add/remove: 1/2 grow/shrink: 9/5 up/down: 968/-88 (880)
    
    CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>
    Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 MAINTAINERS              |  1 -
 include/linux/nodemask.h | 27 ++++++++++++++++++++++-----
 lib/Makefile             |  2 +-
 lib/nodemask.c           | 30 ------------------------------
 4 files changed, 23 insertions(+), 37 deletions(-)

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
index 0f233b76c9ce..48ebe4007955 100644
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
@@ -493,14 +501,23 @@ static inline int num_node_state(enum node_states state)
 
 #endif
 
+/*
+ * Return the bit number of a random bit set in the nodemask.
+ * (returns NUMA_NO_NODE if nodemask is empty)
+ */
+static inline int node_random(const nodemask_t *maskp)
+{
 #if defined(CONFIG_NUMA) && (MAX_NUMNODES > 1)
-extern int node_random(const nodemask_t *maskp);
+	int w, bit = NUMA_NO_NODE;
+
+	w = nodes_weight(*maskp);
+	if (w)
+		bit = find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_int() % w);
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
deleted file mode 100644
index 7dad4ce8ff59..000000000000
--- a/lib/nodemask.c
+++ /dev/null
@@ -1,30 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/nodemask.h>
-#include <linux/module.h>
-#include <linux/random.h>
-
-unsigned int __next_node_in(int node, const nodemask_t *srcp)
-{
-	unsigned int ret = __next_node(node, srcp);
-
-	if (ret == MAX_NUMNODES)
-		ret = __first_node(srcp);
-	return ret;
-}
-EXPORT_SYMBOL(__next_node_in);
-
-#ifdef CONFIG_NUMA
-/*
- * Return the bit number of a random bit set in the nodemask.
- * (returns NUMA_NO_NODE if nodemask is empty)
- */
-int node_random(const nodemask_t *maskp)
-{
-	int w, bit = NUMA_NO_NODE;
-
-	w = nodes_weight(*maskp);
-	if (w)
-		bit = find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_int() % w);
-	return bit;
-}
-#endif
</cut>
------=_Part_2406_1400273107.1658623868345--
