Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6BF1103
	for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 06:50:53 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l4so915506wrm.13
        for <llvm@lists.linux.dev>; Wed, 27 Jul 2022 23:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=xm4tLB9eH1e9uKOdHWnPyGZf2UuLwImkNYvq/Dcy5kg=;
        b=UQ11KD8nBqjEEHn+aeDwoo0fRh18exd/i4QUJLBFGzldbB6j7UG1oDbHUZBOL+yvXj
         /OTXqUKeYhR7l6CPoujyuMbz82MPgd7rNaVfIynamPBPU3Maq1yZNX12wnNN12iH2qLk
         sH1ijvzxCc2F96XjQYsF1pmgqJ6j108sfB6MMc4B3FspjrplknUlAaMZaIMwQ90CR65i
         OJ9SVSd4pP6K3VnaIWVj5BiUrFYfqjyB+zeEHT1PoIM1OW5OklXWr1KFOvngfX0ItEyr
         TNp8khoXxQb8b3qrI5HmS3rlYgWDjtP82D+rPhzUvcNaUK599W3I3ziXb4ElR6SkjoNN
         9o4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=xm4tLB9eH1e9uKOdHWnPyGZf2UuLwImkNYvq/Dcy5kg=;
        b=3k128Q6IkJMv2VcqLUyXqhb1PY9Rnh1hrFCVQnyVKWCB0ccFTcuFOyFJJBbm0M4P9R
         Hcvo5z/lwLmTCWPqezH0PSWY2vxOP1EpI6klWtThAOs7wr8LrQi0j/+GxoT7fQVudIN7
         39fXHa0Owj8uC3UJlIxYqZciI5zfgwNb+7KDgOJD33ljadFoQwWsPrdiEyJxcgRee3DO
         jpnBY/ldl9fKGfwlgYBBSqFZuER6eceeNxwxXqHyuHTaorHUimWau+lSTrE/L3vZDOeG
         L9R34itKEQJYd1txlFSpdQ4sa/zwuAnV0iJ1uTvhtveNkCGZ+6yI0ulNP5q7naXlM8wD
         j6JA==
X-Gm-Message-State: AJIora9iUzRWWaDaJ+5gH6D2B1hrZEqB7SMOJKot3inicqQLdRZ9qOfm
	RsQQ8gyAhRT0tjPfdosBtsH6tw==
X-Google-Smtp-Source: AGRyM1vSI0MJpFuHlmPkDR8nB2C0EQM86yDZ0BkrX4ao6tcrWCe4jI8O2PyxToS9yDOk9P3kTYN32A==
X-Received: by 2002:adf:f7c7:0:b0:21e:fc10:b81b with SMTP id a7-20020adff7c7000000b0021efc10b81bmr842490wrq.51.1658991051753;
        Wed, 27 Jul 2022 23:50:51 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id u1-20020adfdd41000000b0021d80f53324sm90216wrm.7.2022.07.27.23.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:50:51 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 28 Jul 2022 06:50:50 +0000 (UTC)
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1788368597.3058.1658991051274@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by linux: lib/nodemask: inline
 next_node_in() and node_random()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3057_1223459542.1658991050529"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-release-arm-norov-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_3057_1223459542.1658991050529
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by linux: lib/nodemask: inline next_node_in() and node_random():
commit e0281efe11c987e1ff557dad2a56d90484206597
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
# 00:04:34 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:04:34 make[1]: *** [crypto/wp512.o] Error 1
# 00:08:54 make: *** [crypto] Error 2
# 00:10:45 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
# 00:10:45 make[4]: *** [drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
# 00:11:10 make[3]: *** [drivers/gpu/drm/selftests] Error 2
# 00:16:07 sound/soc/intel/avs/path.c:815:18: error: stack frame size (1232) exceeds limit (1024) in 'avs_path_create' [-Werror,-Wframe-larger-than]
# 00:16:07 make[4]: *** [sound/soc/intel/avs/path.o] Error 1
# 00:16:24 drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: error: stack frame size (1096) exceeds limit (1024) in 'cfi_intelext_writev' [-Werror,-Wframe-larger-than]
# 00:16:24 make[3]: *** [drivers/mtd/chips/cfi_cmdset_0001.o] Error 1

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
# First few build errors in logs:
# 00:05:48 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:05:48 make[1]: *** [crypto/wp512.o] Error 1
# 00:10:09 make: *** [crypto] Error 2
# 00:12:46 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
# 00:12:46 make[4]: *** [drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
# 00:13:12 make[3]: *** [drivers/gpu/drm/selftests] Error 2
# 00:18:08 sound/soc/intel/avs/path.c:815:18: error: stack frame size (1232) exceeds limit (1024) in 'avs_path_create' [-Werror,-Wframe-larger-than]
# 00:18:08 make[4]: *** [sound/soc/intel/avs/path.o] Error 1
# 00:18:31 make[3]: *** [sound/soc/intel/avs] Error 2
# 00:18:43 make[2]: *** [sound/soc/intel] Error 2

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-release-arm-norov-allyesconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/3/artifact/artifacts/build-e0281efe11c987e1ff557dad2a56d90484206597/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/3/artifact/artifacts/build-2f9905799751b4395c942d33ff600cd924324785/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/3/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/3/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-linux-e0281efe11c987e1ff557dad2a56d90484206597
cd investigate-linux-e0281efe11c987e1ff557dad2a56d90484206597

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/3/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/3/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allyesconfig/3/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/

cd linux

# Reproduce first_bad build
git checkout --detach e0281efe11c987e1ff557dad2a56d90484206597
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 2f9905799751b4395c942d33ff600cd924324785
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit e0281efe11c987e1ff557dad2a56d90484206597
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
------=_Part_3057_1223459542.1658991050529--
