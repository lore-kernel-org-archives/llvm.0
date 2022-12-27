Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D5E620
	for <llvm@lists.linux.dev>; Tue, 27 Dec 2022 23:49:30 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so10330906wms.4
        for <llvm@lists.linux.dev>; Tue, 27 Dec 2022 15:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QgWN6vOgzOsG8KrJlP4S4kou7HYGIHzwKAIy2MCJCM=;
        b=U9+cgm2K8zqx9jzmqQjgjyCo45oSo30p0lGK3e8OfblI6wMVtyBWi/jvEmvq52vAhf
         oPtBPRUZf8eEPCcOcEXdufi0HqCQlVZdIrkGAiYEc0IQjZl3Foi/BVMqqmrYtOEdb6UE
         MgFP7t5SRxvkQO3ZxDer+u9NEzRc6A6VNRy3XorDclwNqO9duQoDTSdFeLnS1NNExKfi
         eafslM08k3BkFb+6HLH/pf3lNSilFon8bPy0MgygR0ScOpyVxg2BM7VfdZ5eXTNEA+Nm
         1oAkT4bjIddH6Y70gPk+Jka8Gdh4qK3Q3Jt5l/vbB2EJM7LENzvU593L4EmLnt/JKJ4M
         xLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0QgWN6vOgzOsG8KrJlP4S4kou7HYGIHzwKAIy2MCJCM=;
        b=vMS2gjjpmbh/TZ0MeaYg4Ltx4K4eMXwsBgFwsxYjEw7QuerDNYc74xPCAt7tud1hKw
         s6fA1tk01/S/dG17wK287ujF5mV/4c4VNYuwB3qtafZJCuWa44IorolkWMP5pvoUz3NY
         qKyewwTxz3GENB9lSmDLi169672qewAK1UmL0eKeXmGFz+uqF/8RFnFV6QoooDUeDGZP
         0IBpHT21+Oh/Xkjkjt/28de1yoBrdujLtkR34jN0S1Xdcej10ufv4b+gGCBkDFuShNHJ
         lyEBnAvnk3kJGzmD8c/8Jt2C+VfYd598oZr46AFp1fueMzxrip8swJPeckztM3aGc5za
         jaLA==
X-Gm-Message-State: AFqh2koRfLXT3sSyb4B2PN7YIjV5zrQzW7wQeIwYUNGfD/8xfu+042K0
	sl4KzgYaEJhPJIW4l5pKjMWv2IReDV/vIKLa
X-Google-Smtp-Source: AMrXdXsFXH26JDZwoqcpatns4xaa7pkuYS+8pvRmgbOBimQ33vxXsWZG1u/mjljlmSCe/ATLR7UASA==
X-Received: by 2002:a05:600c:22c4:b0:3cf:8ed7:712d with SMTP id 4-20020a05600c22c400b003cf8ed7712dmr19513190wmg.14.1672184969242;
        Tue, 27 Dec 2022 15:49:29 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c19c900b003d9876aa04asm7066947wmq.41.2022.12.27.15.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 15:49:28 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Tue, 27 Dec 2022 23:49:28 +0000 (UTC)
To: Josef Bacik <josef@toxicpanda.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1351264102.7965.1672184968838@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.1-rc8-270-g1b19c4c249a1: btrfs: turn on
 -Wmaybe-uninitialized
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7964_1281025303.1672184968242"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_7964_1281025303.1672184968242
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.1-rc8-270-g1b19c4c249a1: btrfs: turn on -Wmaybe-uninitialized:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23449
# First few build errors in logs:
# 00:31:50 error: unknown warning option '-Wmaybe-uninitialized'; did you mean '-Wuninitialized'? [-Werror,-Wunknown-warning-option]
# 00:31:50 make[3]: *** [scripts/Makefile.build:250: fs/btrfs/super.o] Error 1
# 00:31:50 error: unknown warning option '-Wmaybe-uninitialized'; did you mean '-Wuninitialized'? [-Werror,-Wunknown-warning-option]
# 00:31:50 make[3]: *** [scripts/Makefile.build:250: fs/btrfs/ctree.o] Error 1
# 00:31:50 error: unknown warning option '-Wmaybe-uninitialized'; did you mean '-Wuninitialized'? [-Werror,-Wunknown-warning-option]
# 00:31:50 make[3]: *** [scripts/Makefile.build:250: fs/btrfs/extent-tree.o] Error 1
# 00:31:50 error: unknown warning option '-Wmaybe-uninitialized'; did you mean '-Wuninitialized'? [-Werror,-Wunknown-warning-option]
# 00:31:50 make[3]: *** [scripts/Makefile.build:250: fs/btrfs/print-tree.o] Error 1
# 00:31:50 error: unknown warning option '-Wmaybe-uninitialized'; did you mean '-Wuninitialized'? [-Werror,-Wunknown-warning-option]
# 00:31:50 make[3]: *** [scripts/Makefile.build:250: fs/btrfs/root-tree.o] Error 1

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
32292
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
Status of v6.1-rc8-270-g1b19c4c249a1 commit for tcwg_kernel:
commit 1b19c4c249a196301a2a3a69aeba2c6407dad25d
Author: Josef Bacik <josef@toxicpanda.com>
Date:   Fri Dec 16 15:15:58 2022 -0500

    btrfs: turn on -Wmaybe-uninitialized
    
    We had a recent bug that would have been caught by a newer compiler with
    -Wmaybe-uninitialized and would have saved us a month of failing tests
    that I didn't have time to investigate.
    
    Reviewed-by: Qu Wenruo <wqu@suse.com>
    Signed-off-by: Josef Bacik <josef@toxicpanda.com>
    Reviewed-by: David Sterba <dsterba@suse.com>
    Signed-off-by: David Sterba <dsterba@suse.com>
* llvm-master-aarch64-next-allmodconfig
** Failure after v6.1-rc8-270-g1b19c4c249a1: btrfs: turn on -Wmaybe-uninitialized:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/601/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/601/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/600/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-1b19c4c249a196301a2a3a69aeba2c6407dad25d
cd investigate-linux-1b19c4c249a196301a2a3a69aeba2c6407dad25d

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/601/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/600/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit 1b19c4c249a196301a2a3a69aeba2c6407dad25d
Author: Josef Bacik <josef@toxicpanda.com>
Date:   Fri Dec 16 15:15:58 2022 -0500

    btrfs: turn on -Wmaybe-uninitialized
    
    We had a recent bug that would have been caught by a newer compiler with
    -Wmaybe-uninitialized and would have saved us a month of failing tests
    that I didn't have time to investigate.
    
    Reviewed-by: Qu Wenruo <wqu@suse.com>
    Signed-off-by: Josef Bacik <josef@toxicpanda.com>
    Reviewed-by: David Sterba <dsterba@suse.com>
    Signed-off-by: David Sterba <dsterba@suse.com>
---
 fs/btrfs/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/Makefile b/fs/btrfs/Makefile
index 555c962fdad6..eca995abccdf 100644
--- a/fs/btrfs/Makefile
+++ b/fs/btrfs/Makefile
@@ -7,6 +7,7 @@ subdir-ccflags-y += -Wmissing-format-attribute
 subdir-ccflags-y += -Wmissing-prototypes
 subdir-ccflags-y += -Wold-style-definition
 subdir-ccflags-y += -Wmissing-include-dirs
+subdir-ccflags-y += -Wmaybe-uninitialized
 condflags := \
 	$(call cc-option, -Wunused-but-set-variable)		\
 	$(call cc-option, -Wunused-const-variable)		\
</cut>
------=_Part_7964_1281025303.1672184968242--
