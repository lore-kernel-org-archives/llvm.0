Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092307C
	for <llvm@lists.linux.dev>; Fri,  3 Feb 2023 00:34:27 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso4983990wms.0
        for <llvm@lists.linux.dev>; Thu, 02 Feb 2023 16:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeCAYQB7ICZ18gbJkhbp8SH0lULxAVXpx8/uVsrZbsE=;
        b=lnuiAxCdeXNNYe9LgOi7cXwpQL/nRJietMAkuAN+lLT37SEw8xSK/8emJebN7VhLh+
         lro8CoQEP39nQIvYdfSIVkqJM4umZB8UECtOimkEJRBKMadprUYMLQa5xq2hiAcSSxOr
         WG5TReiAVtLDKRmD3JgIe6fqcEW7w21iEwBHdcmKmU6TekSY1XMy5yMqwqBlsL4mnzzY
         tMxByHdszN8kVZhLOTem6oocBwFRMhSCEgOnZJ5RlFk7LVcRmW+6tPg5HVyme8hbwKcq
         dJiirruH2+H6nCRdEnPmf9Ma7WZGVU1eL7EbxSPaAix6iwd+5rENs0sGvY8fjlqtQ0++
         pcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JeCAYQB7ICZ18gbJkhbp8SH0lULxAVXpx8/uVsrZbsE=;
        b=nDYErFCf0VS1LzEJhjnptsMYYuf3U+2647Um/VhHKTB87AxYbysvtYj98/17J/m1OZ
         mxPnAqrD7niJlcrjGnCFK2TXHrzKk/1WgGnMmLEpqU6lOzlWbu80xt57lUdq24nwSPrh
         tjtHujRFBS8+W91p8ZF3l5WLSak1UrVy1cFNqe8r5MOwJQVDfBBbkS6+NqpcvpNIwTPz
         rcwT9fcO7qruNbkVaQ3AxHRNuY7yllN1Iiq98KXQSHxnRdSutBxxI8G6M1hOt/985vyG
         MDqH5rKXB13xcihc6FTtMDGLPFs9+XAaucQO8pgPopt5aQp8ROeEB86RKC0ozGsOV7+G
         uMmQ==
X-Gm-Message-State: AO0yUKUhsTYevHyuCfv0CtPC7SkvFJ4oJqnnquucaNQ5fq9T2T9BqSSG
	Rp0TogceGOBGplyvX4PEQoy5sg==
X-Google-Smtp-Source: AK7set+3uTQc21QXo4yg7WPRSvXxRJr8d8yvk+7Op/RSNBUseuFOgJfKwVLhUZJ+j3F2ebJ0Dtr1gQ==
X-Received: by 2002:a05:600c:4e88:b0:3df:db20:b0ae with SMTP id f8-20020a05600c4e8800b003dfdb20b0aemr2720235wmq.17.1675384466260;
        Thu, 02 Feb 2023 16:34:26 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id x9-20020a5d4449000000b002c3cf230b60sm353430wrr.73.2023.02.02.16.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 16:34:25 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 3 Feb 2023 00:34:25 +0000 (UTC)
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1876530996.8739.1675384465825@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.2-rc2-24-g6437a549ae17: drm/panfrost:
 fix GENERIC_ATOMIC64 dependency
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8738_1507034881.1675384465181"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-mainline-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_8738_1507034881.1675384465181
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.2-rc2-24-g6437a549ae17: drm/panfrost: fix GENERIC_ATOMIC64 dependency:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23221
# First few build errors in logs:
# 00:41:02 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: error: stack frame size (1256) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wframe-larger-than]
# 00:41:02 make[6]: *** [scripts/Makefile.build:252: drivers/net/ethernet/mellanox/mlx5/core/en_main.o] Error 1
# 00:46:08 make[5]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox/mlx5/core] Error 2
# 00:46:08 make[4]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox] Error 2
# 00:46:08 make[3]: *** [scripts/Makefile.build:504: drivers/net/ethernet] Error 2
# 00:46:08 make[2]: *** [scripts/Makefile.build:504: drivers/net] Error 2
# 00:46:41 make[1]: *** [scripts/Makefile.build:504: drivers] Error 2
# 00:46:41 make: *** [Makefile:2008: .] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23232

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
Status of v6.2-rc2-24-g6437a549ae17 commit for tcwg_kernel:
commit 6437a549ae178a3f5a5c03e983f291ebcdc2bbc7
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue Jan 17 17:44:43 2023 +0100

    drm/panfrost: fix GENERIC_ATOMIC64 dependency
    
    On ARMv5 and earlier, a randconfig build can still run into
    
    WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
      Depends on [n]: IOMMU_SUPPORT [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
      Selected by [y]:
      - DRM_PANFROST [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=y]) && MMU [=y]
    
    Rework the dependencies to always require a working cmpxchg64.
    
    Fixes: db594ba3fcf9 ("drm/panfrost: depend on !GENERIC_ATOMIC64 when using COMPILE_TEST")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Reviewed-by: Steven Price <steven.price@arm.com>
    Signed-off-by: Steven Price <steven.price@arm.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20230117164456.1591901-1-arnd@kernel.org
* llvm-master-arm-mainline-allmodconfig
** Failure after v6.2-rc2-24-g6437a549ae17: drm/panfrost: fix GENERIC_ATOMIC64 dependency:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-mainline-allmodconfig/541/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-mainline-allmodconfig/541/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-mainline-allmodconfig/540/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-6437a549ae178a3f5a5c03e983f291ebcdc2bbc7
cd investigate-linux-6437a549ae178a3f5a5c03e983f291ebcdc2bbc7

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-mainline-allmodconfig/541/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-mainline-allmodconfig/540/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit 6437a549ae178a3f5a5c03e983f291ebcdc2bbc7
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue Jan 17 17:44:43 2023 +0100

    drm/panfrost: fix GENERIC_ATOMIC64 dependency
    
    On ARMv5 and earlier, a randconfig build can still run into
    
    WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
      Depends on [n]: IOMMU_SUPPORT [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
      Selected by [y]:
      - DRM_PANFROST [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=y]) && MMU [=y]
    
    Rework the dependencies to always require a working cmpxchg64.
    
    Fixes: db594ba3fcf9 ("drm/panfrost: depend on !GENERIC_ATOMIC64 when using COMPILE_TEST")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Reviewed-by: Steven Price <steven.price@arm.com>
    Signed-off-by: Steven Price <steven.price@arm.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20230117164456.1591901-1-arnd@kernel.org
---
 drivers/gpu/drm/panfrost/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/Kconfig b/drivers/gpu/drm/panfrost/Kconfig
index 079600328be1..e6403a9d66ad 100644
--- a/drivers/gpu/drm/panfrost/Kconfig
+++ b/drivers/gpu/drm/panfrost/Kconfig
@@ -3,7 +3,8 @@
 config DRM_PANFROST
 	tristate "Panfrost (DRM support for ARM Mali Midgard/Bifrost GPUs)"
 	depends on DRM
-	depends on ARM || ARM64 || (COMPILE_TEST && !GENERIC_ATOMIC64)
+	depends on ARM || ARM64 || COMPILE_TEST
+	depends on !GENERIC_ATOMIC64    # for IOMMU_IO_PGTABLE_LPAE
 	depends on MMU
 	select DRM_SCHED
 	select IOMMU_SUPPORT
</cut>
------=_Part_8738_1507034881.1675384465181--
