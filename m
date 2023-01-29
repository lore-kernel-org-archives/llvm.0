Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D7017CB
	for <llvm@lists.linux.dev>; Sun, 29 Jan 2023 07:58:27 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id m14so7997393wrg.13
        for <llvm@lists.linux.dev>; Sat, 28 Jan 2023 23:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VWm3Iqo5RnZRavVAU7Yi8p3SndHN/CTDqjF/9PIayU=;
        b=Cmiube8k3Y9CXToTrps4+tLqfTjpkSBmw0okzUbYPaNrD41RqegBaoAgpLfR5fhIxH
         Vcc08Rq9F+l8GAVkb0qbGyl7onraTKP8+s33rewQ14Bh+oiGeTEiA8PBqoRZbBHXSc/c
         xP5qfkrEcgUArkVO21rGue+w/r9g5fdE+C48g9gaCGhuZmBXuAM4ymJTLwQwXSSwQLSs
         Q6ZVVOqJka/CDxOuShIOuccc9ov4gecBte1jBXnKkPQdQnStmUTuTwT38u29FNvmQEbx
         ZRe9nQOG+g2sMWFBysMCfq/zAXPcCV7IhQO0e9W2dMZo1vDYvqah0jT5V2X3X52XZmEs
         UhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8VWm3Iqo5RnZRavVAU7Yi8p3SndHN/CTDqjF/9PIayU=;
        b=fhvPy5WFK7U6/l18AALZDDLVtePzobqAnB13jjp3w/Y57LSj8evWl/pReZnhnChmhX
         Hnu4L4Durt7XRFZK0lgt26JCLFvxrbMJJBp7syRoyGCfbh5cnT5w/Muvxc2fCL5zZ5qF
         FqAO+ariI4kZvEHhOOpGhjP3WQtcb+CeGQ3EJABod+j0byIeJKvSPCKX18csu48shnu/
         QmHs8UafJS7g/9+KonWgrDrSDSjTNRpL70Wa9233JQqL0tbxxN8dQk7eajrDoTPkA6cM
         OiQq/heeEcMc0nTBw8B2xzfePcyNySXv1sqjYudwXyo+iDi6889VY3Ebt+QsWApgtwNs
         bcsw==
X-Gm-Message-State: AO0yUKW2hZpkz8FBfvwAl2g8NiPsfx0/nZ22gYc2+x1aN13/fSN6z9LS
	3hzZkPQabgh2DcgiMWwfwjxhPNpYN5kppX4j
X-Google-Smtp-Source: AK7set8gjDvcXrd4m2ThdF2L5FL3+GPh/L5D6fNBueoI9RLNKEfQzUI9Afgsiv3jbj0cC4UqDLdl7Q==
X-Received: by 2002:adf:e891:0:b0:2bf:d7d6:5712 with SMTP id d17-20020adfe891000000b002bfd7d65712mr5664094wrm.24.1674979105866;
        Sat, 28 Jan 2023 23:58:25 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id o9-20020adfeac9000000b002bfebe2d67esm638494wrn.9.2023.01.28.23.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 23:58:25 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 29 Jan 2023 07:58:24 +0000 (UTC)
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <594801854.6143.1674979105470@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.2-rc1-1-gc476a78f19ef: ARM: remove
 CONFIG_UNUSED_BOARD_FILES
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6142_1836935544.1674979104731"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-next-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_6142_1836935544.1674979104731
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.2-rc1-1-gc476a78f19ef: ARM: remove CONFIG_UNUSED_BOARD_FILES:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21005
# First few build errors in logs:
# 00:33:08 drivers/gpu/drm/tests/drm_mm_test.c:344:12: error: stack frame size (1040) exceeds limit (1024) in '__drm_test_mm_reserve' [-Werror,-Wframe-larger-than]
# 00:33:08 make[5]: *** [scripts/Makefile.build:252: drivers/gpu/drm/tests/drm_mm_test.o] Error 1
# 00:33:14 make[4]: *** [scripts/Makefile.build:504: drivers/gpu/drm/tests] Error 2
# 01:16:13 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: error: stack frame size (1256) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wframe-larger-than]
# 01:16:14 make[6]: *** [scripts/Makefile.build:252: drivers/net/ethernet/mellanox/mlx5/core/en_main.o] Error 1
# 01:19:43 make[5]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox/mlx5/core] Error 2
# 01:19:43 make[4]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox] Error 2
# 01:19:43 make[3]: *** [scripts/Makefile.build:504: drivers/net/ethernet] Error 2
# 01:19:43 make[2]: *** [scripts/Makefile.build:504: drivers/net] Error 2
# 01:19:46 make[3]: *** [scripts/Makefile.build:504: drivers/gpu/drm] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21030

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
Status of v6.2-rc1-1-gc476a78f19ef commit for tcwg_kernel:
commit c476a78f19ef12f10230e6162c290c17e9c74933
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Thu Sep 29 15:39:48 2022 +0200

    ARM: remove CONFIG_UNUSED_BOARD_FILES
    
    All unused board files are removed, so the Kconfig symbol is no
    longer needed.
    
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
* llvm-master-arm-next-allyesconfig
** Failure after v6.2-rc1-1-gc476a78f19ef: ARM: remove CONFIG_UNUSED_BOARD_FILES:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/558/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/558/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/557/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-c476a78f19ef12f10230e6162c290c17e9c74933
cd investigate-linux-c476a78f19ef12f10230e6162c290c17e9c74933

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/558/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/557/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit c476a78f19ef12f10230e6162c290c17e9c74933
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Thu Sep 29 15:39:48 2022 +0200

    ARM: remove CONFIG_UNUSED_BOARD_FILES
    
    All unused board files are removed, so the Kconfig symbol is no
    longer needed.
    
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 43c7773b89ae..b9130ab831db 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1465,19 +1465,6 @@ config ATAGS
 	  the ARM_ATAG_DTB_COMPAT option) then you may unselect this option
 	  to remove ATAGS support from your kernel binary.
 
-config UNUSED_BOARD_FILES
-	bool "Board support for machines without known users"
-	depends on ATAGS
-	help
-	  Most ATAGS based board files are completely unused and are
-	  scheduled for removal in early 2023, and left out of kernels
-	  by default now.  If you are using a board file that is marked
-	  as unused, turn on this option to build support into the kernel.
-
-	  To keep support for your individual board from being removed,
-	  send a reply to the email discussion at
-	  https://lore.kernel.org/all/CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com/
-
 config DEPRECATED_PARAM_STRUCT
 	bool "Provide old way to pass kernel parameters"
 	depends on ATAGS
</cut>
------=_Part_6142_1836935544.1674979104731--
