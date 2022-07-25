Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481067E
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 23:26:38 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v13so10200372wru.12
        for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 16:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=mnua0rAs1iBCzu23wrv/ao+wsJJp2DxdMeojjZCW7w0=;
        b=FqvjmXD6nOU88DINpJHCJXL0My2pbPKAS5rLdfoN3K//1Npzmp1d8jiFunU9ry8Owu
         QaG2kJ4y08RvljlIhtNKXZnz/9chLTARgODS+MdpkPSm5sedqzJuxBrRs4Tt4IbMLHvM
         tXA8ZtueS3oVYK2SGPrEmJy2PSm3L57AVHzbN8UC7r7CZ0UXb8BKpB37RcC7lt+SJqhE
         jbZnInM3eC/nuBPjhrjsVY5RiWdDDyZDkOjJ7wnBa/Dm1ypB+HYwvhxovC6NlakquCCg
         bvHBAQTmi2+oYBd56dgQy/f91Bmz0ybpZtGz3+VoqXR3PgSCQ/IGQ3hRQtEdFd4qOWe3
         qZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=mnua0rAs1iBCzu23wrv/ao+wsJJp2DxdMeojjZCW7w0=;
        b=ugQtt5xwgRgAlCiU8BmowBaaMyO8vzHsk3Q1FNFt7EW/SW8hTWyvJBXmdCDqq5TA+s
         FWaFYOvikX43ymNa/m8HqQtETK5QMH38x2oHs4PVw1W3RkctjsiHFLG1+lAli1HiBaPb
         So4JG3kzlk/+6iGwNtD/KIYc86xZ5JSI6YRNygQXHrAtStfmFN4sMEDz4qgz5MMUoiNW
         5kA6V3X9f2qA4U5l7ro9vCfd7f4lPndS6/qqLxpTZdAQKTWRx5dRZVOTKdqDcyy+HKa9
         U/4nsfUw2HPdytkT7RgTLeql9DpKzxuUvYytR1U0aHWGQNKM6WtFcvhmfNAYeW4yxaFB
         keeg==
X-Gm-Message-State: AJIora9PLtA4hF/j8cZedNMH9TQQOHkyS7VsgTuyXJccXLZ3qjRFPwp7
	zTj8S+UVMYmC37PG2aNzLqGL6A==
X-Google-Smtp-Source: AGRyM1tU0WT/gyg3+gd6Sqwtw17K9Odee7NiHb3YO8OgG8eIJhvtcNuWFllQn6sfedQpzJ+GWGb1ow==
X-Received: by 2002:adf:fb10:0:b0:207:af88:1eb9 with SMTP id c16-20020adffb10000000b00207af881eb9mr8979974wrr.238.1658791596206;
        Mon, 25 Jul 2022 16:26:36 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id c17-20020adffb51000000b0021d7fa77710sm12961232wrs.92.2022.07.25.16.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 16:26:35 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 25 Jul 2022 23:26:35 +0000 (UTC)
To: Fangrui Song <i@maskray.me>
Cc: llvm@lists.linux.dev
Message-ID: <980360187.2690.1658791595815@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [Driver] Report
 -Wunused-command-line-argument for unimplemented -mtune=
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2689_699082620.1658791595157"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-next-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_2689_699082620.1658791595157
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [Driver] Report -Wunused-command-line-argument for unimplemented -mtune=:
commit 8f0c901c1a172313a32bc06a1fcface76cd1220f
Author: Fangrui Song <i@maskray.me>

    [Driver] Report -Wunused-command-line-argument for unimplemented -mtune=

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
20629
# First few build errors in logs:
# 00:03:34 arch/arm/kernel/sys_oabi-compat.c:313:25: error: taking address of packed member 'data' of class or structure 'oabi_epoll_event' may result in an unaligned pointer value [-Werror,-Waddress-of-packed-member]
# 00:03:34 arch/arm/kernel/sys_oabi-compat.c:313:25: error: taking address of packed member 'data' of class or structure 'oabi_epoll_event' may result in an unaligned pointer value [-Werror,-Waddress-of-packed-member]
# 00:03:34 arch/arm/kernel/sys_oabi-compat.c:313:25: error: taking address of packed member 'data' of class or structure 'oabi_epoll_event' may result in an unaligned pointer value [-Werror,-Waddress-of-packed-member]
# 00:03:34 arch/arm/kernel/sys_oabi-compat.c:313:25: error: taking address of packed member 'data' of class or structure 'oabi_epoll_event' may result in an unaligned pointer value [-Werror,-Waddress-of-packed-member]
# 00:03:34 make[2]: *** [scripts/Makefile.build:250: arch/arm/kernel/sys_oabi-compat.o] Error 1
# 00:03:43 make[1]: *** [scripts/Makefile.build:525: arch/arm/kernel] Error 2
# 00:03:43 make: *** [Makefile:2005: arch/arm] Error 2
# 00:03:46 drivers/bus/mhi/host/init.c:365:20: error: taking address of packed member 'wp' of class or structure 'mhi_event_ctxt' may result in an unaligned pointer value [-Werror,-Waddress-of-packed-member]
# 00:03:46 drivers/bus/mhi/host/init.c:394:20: error: taking address of packed member 'wp' of class or structure 'mhi_cmd_ctxt' may result in an unaligned pointer value [-Werror,-Waddress-of-packed-member]
# 00:03:46 drivers/bus/mhi/host/init.c:640:23: error: taking address of packed member 'wp' of class or structure 'mhi_chan_ctxt' may result in an unaligned pointer value [-Werror,-Waddress-of-packed-member]

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
20914

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-next-allyesconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/22/artifact/artifacts/build-8f0c901c1a172313a32bc06a1fcface76cd1220f/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/22/artifact/artifacts/build-1f02ba4843a519606a3bdfd7e7a289f3d8c1c14b/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/22/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/22/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-8f0c901c1a172313a32bc06a1fcface76cd1220f
cd investigate-llvm-8f0c901c1a172313a32bc06a1fcface76cd1220f

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/22/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/22/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/22/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 8f0c901c1a172313a32bc06a1fcface76cd1220f
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 1f02ba4843a519606a3bdfd7e7a289f3d8c1c14b
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 8f0c901c1a172313a32bc06a1fcface76cd1220f
Author: Fangrui Song <i@maskray.me>
Date:   Fri Jul 22 15:07:28 2022 -0700

    [Driver] Report -Wunused-command-line-argument for unimplemented -mtune=
    
    Most common architectures (aarch64,riscv,s390x,x86,etc) have implemented -mtune=.
    Don't ignore -mtune= in generic code.
---
 clang/lib/Driver/ToolChains/Clang.cpp | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/clang/lib/Driver/ToolChains/Clang.cpp b/clang/lib/Driver/ToolChains/Clang.cpp
index 092566211ed0..33e3fe267c23 100644
--- a/clang/lib/Driver/ToolChains/Clang.cpp
+++ b/clang/lib/Driver/ToolChains/Clang.cpp
@@ -5392,9 +5392,6 @@ void Clang::ConstructJob(Compilation &C, const JobAction &JA,
 
   TC.addClangTargetOptions(Args, CmdArgs, JA.getOffloadingDeviceKind());
 
-  // FIXME: Handle -mtune=.
-  (void)Args.hasArg(options::OPT_mtune_EQ);
-
   if (Arg *A = Args.getLastArg(options::OPT_mcmodel_EQ)) {
     StringRef CM = A->getValue();
     if (CM == "small" || CM == "kernel" || CM == "medium" || CM == "large" ||
</cut>
------=_Part_2689_699082620.1658791595157--
