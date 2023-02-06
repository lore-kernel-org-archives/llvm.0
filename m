Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB98E17CE
	for <llvm@lists.linux.dev>; Mon,  6 Feb 2023 03:42:09 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id g6so1177465wrv.1
        for <llvm@lists.linux.dev>; Sun, 05 Feb 2023 19:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEuvIGdQYG7EVSJ6a+1uOiOnJHhBAFt/kFv6xVOFk10=;
        b=tWQFUDz1usmBE8rZ2LbxeH38LLGq/zhk3XBrRcJCcT0lHdPT1HlFSvaavtyuvz93Ou
         ADjTZq8cfIz4yAOPriv7dgar4StmMGwzLWzzDSJ2Z3B8wu5nww68iKE2VCRl9oyO+vad
         pyA7JwAwIhznICffKMbZK84NMyvHjbUiQgN66WpVEUC9Fh3v7tpeob4rHmBNE7Qf3AhN
         P75Y3M/QNIms7lJ8Lw5Srfl0Dd6oYlikF39Iwp6USPkA8LnASS39/ReHjrEd0EQnWWW9
         M2NkTpvuUAPKRzpLhFNrkmRGnN3jDx1fXXz5j93hA8lxwrvnP+gjjHdZb09y/U/IIySH
         mh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEuvIGdQYG7EVSJ6a+1uOiOnJHhBAFt/kFv6xVOFk10=;
        b=6h6w9vZERpsFVs7G0zWV4R3HiaBeFYPkKtwoup7FOyhONNioLiMOiW9xMCx+f48vib
         MTXKvvepX1hCOWz7L2EJrcQSypv8rKDSwtnjXBVKg8AkeGWtwQzOug0GQG6H8ZIwG1ER
         wU8LlCXgOklcPR0liod4DxEG75P5J9PAW6XgxQ8pMQ/KHk8afIBg0cmmsT0fMG8Tz5c1
         XMZ8OjIZu7szy6ag722lAif2W4OZzaseMGCpWOIGPBW7pPZlSya5wGEAJrChlQyVcYZJ
         9fa0rpJjpcvnGZ9Yrg3ojiNGZApYraYzQqaFPYJoqGPfy+jTNRU7DhNbNCjOsr2L8jh2
         H9ig==
X-Gm-Message-State: AO0yUKXnHS5UaNgsbGKN8VJmQwElp704rKRbBUJkaPjQrWUJF+kQUJtc
	z7WZYF68C4QdaWGIoxQYIe1CdQ==
X-Google-Smtp-Source: AK7set+RJ/2KMPLTlmpKMus6/3yBgMThYH6ATXZwbs2IZzVr5kT3SES0+cMF4td/VNNN2wcL5MhHXQ==
X-Received: by 2002:a05:6000:102:b0:2bf:ad61:6023 with SMTP id o2-20020a056000010200b002bfad616023mr15758732wrx.71.1675654928075;
        Sun, 05 Feb 2023 19:42:08 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d690a000000b002bbedd60a9asm7775583wru.77.2023.02.05.19.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 19:42:07 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 6 Feb 2023 03:42:06 +0000 (UTC)
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1896363883.10092.1675654927497@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.1.8-105-gf5e58b546cbe: drm/panfrost: fix
 GENERIC_ATOMIC64 dependency
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_10091_1985341758.1675654926810"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-stable-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_10091_1985341758.1675654926810
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.1.8-105-gf5e58b546cbe: drm/panfrost: fix GENERIC_ATOMIC64 dependency:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23010
# First few build errors in logs:
# 00:31:22 ./include/linux/fortify-string.h:543:4: error: call to '__read_overflow' declared with 'error' attribute: detected read beyond size of object (1st parameter)
# 00:31:23 make[4]: *** [scripts/Makefile.build:250: drivers/infiniband/core/cma.o] Error 1
# 00:31:55 make[3]: *** [scripts/Makefile.build:500: drivers/infiniband/core] Error 2
# 00:31:55 make[2]: *** [scripts/Makefile.build:500: drivers/infiniband] Error 2
# 00:32:29 make[1]: *** [scripts/Makefile.build:500: drivers] Error 2
# 00:32:29 make: *** [Makefile:2005: .] Error 2

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
Status of v6.1.8-105-gf5e58b546cbe commit for tcwg_kernel:
commit f5e58b546cbe76f049df97570cf0580aaaf3f900
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue Jan 17 17:44:43 2023 +0100

    drm/panfrost: fix GENERIC_ATOMIC64 dependency
    
    [ Upstream commit 6437a549ae178a3f5a5c03e983f291ebcdc2bbc7 ]
    
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
    Signed-off-by: Sasha Levin <sashal@kernel.org>
* llvm-master-arm-stable-allmodconfig
** Failure after v6.1.8-105-gf5e58b546cbe: drm/panfrost: fix GENERIC_ATOMIC64 dependency:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-stable-allmodconfig/548/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-stable-allmodconfig/548/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-stable-allmodconfig/547/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-f5e58b546cbe76f049df97570cf0580aaaf3f900
cd investigate-linux-f5e58b546cbe76f049df97570cf0580aaaf3f900

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-stable-allmodconfig/548/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-stable-allmodconfig/547/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit f5e58b546cbe76f049df97570cf0580aaaf3f900
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue Jan 17 17:44:43 2023 +0100

    drm/panfrost: fix GENERIC_ATOMIC64 dependency
    
    [ Upstream commit 6437a549ae178a3f5a5c03e983f291ebcdc2bbc7 ]
    
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
    Signed-off-by: Sasha Levin <sashal@kernel.org>
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
------=_Part_10091_1985341758.1675654926810--
