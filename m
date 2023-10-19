Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8739455
	for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 02:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FvL3h1IG"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507bd19eac8so3793600e87.0
        for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 19:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697682701; x=1698287501; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2p08wC4tKVROHRqaVb3YQYT+vGh6GpV+SUcuVPLxDk=;
        b=FvL3h1IGR02fniN/QjJWzFgAife9UFZdwsLF7nT/oFesXGeGz7IhF9vSipNx4uqwCk
         iWiWSLooG1AxCneaQ7Q065eGVjAZNNk5/KgGme8GYfvLP4EoksB7rpxu3deyTDxWZ7Jf
         Tt7HzhyMGwnpgQ4lgl5yto7PaS/4ilfyq7/tFa6MG1vxQE8scDDktGrI/BvbsSHCkLxn
         YrQdw51gC/hJLC4db9b2syvY8Jsymrqufr7pPS/lQcZznUMV7uuINcwIGQh36fgxXVGS
         GB4AjgMK9LiUuxbFOQ9hKHErWIpbAP0otFl+fIg7FjNWmOzeHxpPq3y8ue9wIyHq/cCV
         NX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697682701; x=1698287501;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2p08wC4tKVROHRqaVb3YQYT+vGh6GpV+SUcuVPLxDk=;
        b=KtJzF7eeX0qiFfTqOzxIFvOJ9tEruPJ5hvb3PtnNhzlMNeKiuoPBnmK76poXd5Z63H
         sQRIvfRZ+Eq98JhUXqL2l1ztdrgik6VLNS0ULYsOZvalgNSv//JyLSqMaPvUPCEky8W5
         g8uLhZ8B5523pZtlgQoo3kByp32o/7a1SYgwpOlfp+RpyqNRzFbS6fHX0cmInwuiMINM
         3G7wQ4fngChkgs33b5Mh26oxidFE/rvrw0BWaa7XOf8q29fcafqCz8M0YTzE8Wx4BnaY
         +UMk6E6+izQ6vTCxvobuUS1nJPUSNCY+FipApT/f5T82Rc43NK+wKlzjCksh1b5OdCv0
         16/A==
X-Gm-Message-State: AOJu0YyrC9DQ1HwosOOkihEm4i86MF8bbw/Oh2fZx1uGBIejGqWEB8Od
	OWtymjupjVtPNtUj5nMZgIpF2kZwA9ayPeB7g0M=
X-Google-Smtp-Source: AGHT+IHg0C86vg1RmHxX74AHtIQ/ML4ZpTw7gL6b4imecjDE85QYX/rXD97wZV+KKwi4GAl/6AB0/A==
X-Received: by 2002:ac2:46c5:0:b0:503:1c07:f7f9 with SMTP id p5-20020ac246c5000000b005031c07f7f9mr419867lfo.29.1697682701500;
        Wed, 18 Oct 2023 19:31:41 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id fj27-20020a0564022b9b00b005309eb7544fsm3599964edb.45.2023.10.18.19.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 19:31:41 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 19 Oct 2023 02:31:40 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <937553743.43340.1697682701023@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-18-init-8757-gfd311126349b: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_43339_1784571385.1697682700344"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-stable-defconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_43339_1784571385.1697682700344
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

In CI config tcwg_kernel/llvm-master-aarch64-stable-defconfig after:

  | commit llvmorg-18-init-8757-gfd311126349b
  | Author: Florian Hahn <flo@fhahn.com>
  | Date:   Tue Oct 17 19:17:40 2023 +0100
  | 
  |     [VPlan] Insert Trunc/Exts for reductions directly in VPlan.
  |     
  |     Update the code to create Trunc/Ext recipes directly in
  |     adjustRecipesForReductions instead of fixing it up later in
  |     fixReductions.
  |     
  |     This explicitly models the required conversions and also makes sure they
  | ... 2 lines of the commit log omitted.

Results changed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
8020
# First few build errors in logs:

# 00:12:40 clang: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:12:40 make[5]: *** [scripts/Makefile.build:243: drivers/platform/chrome/cros_ec_i2c.o] Error 1
# 00:13:18 make[4]: *** [scripts/Makefile.build:480: drivers/platform/chrome] Error 2
# 00:13:18 make[3]: *** [scripts/Makefile.build:480: drivers/platform] Error 2
# 00:13:37 clang: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:13:37 make[7]: *** [scripts/Makefile.build:243: drivers/net/ethernet/intel/igb/igb_main.o] Error 1
# 00:13:46 make[6]: *** [scripts/Makefile.build:480: drivers/net/ethernet/intel/igb] Error 2
# 00:13:53 make[5]: *** [scripts/Makefile.build:480: drivers/net/ethernet/intel] Error 2
# 00:16:54 make[4]: *** [scripts/Makefile.build:480: drivers/net/ethernet] Error 2
# 00:16:54 make[3]: *** [scripts/Makefile.build:480: drivers/net] Error 2

From
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
9166
# linux build successful:
all
# linux boot successful:
boot

The configuration of this build is:
CI config tcwg_kernel/llvm-master-aarch64-stable-defconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-defconfig-build/60/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-defconfig-build/59/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/fd311126349b8fe1684d62154a9fa5a7bbb0b713/tcwg_kernel/llvm-master-aarch64-stable-defconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/fd311126349b8fe1684d62154a9fa5a7bbb0b713

Latest bug report status : https://linaro.atlassian.net/browse/LLVM-1007

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-aarch64-stable-defconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/fd311126349b8fe1684d62154a9fa5a7bbb0b713/tcwg_kernel/llvm-master-aarch64-stable-defconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-defconfig-build/60/
------=_Part_43339_1784571385.1697682700344--
