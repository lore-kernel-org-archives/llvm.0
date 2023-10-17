Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DFF1F606
	for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 21:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BxoUTvhN"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507ad511315so3779701e87.0
        for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697577646; x=1698182446; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YLqkTI6vR2tWYnFN+W6Diu3XdGs+XBePZt+SQIcTiUA=;
        b=BxoUTvhNieKnZPWscessTC4DdHLGYx5AHtdSRnRYTranKDM9koHns/YrtTV524qOkR
         GUeN1z9CIUBnm4LRd9hvRyugKcwFxNSrwiMFxwX7X6tNqcnDaX4D7pL4BLcaqctyNdgL
         jqeOn2uEVgyu7Kf+tW3ms2/GyYM/FSn3Sa+ohDKmZ7gcr9zSdArjXLINvTreNBs2y1gz
         kVsaTV4UrFlnnu7u/ETiY7qQGGQCETieu2oJ3Wz+r1DN/oDLlgdbT6N78psYL+ciFRkF
         g6gXG2EwKstLYciPJrmhaT4pMaYbW1Jdx0L9533LByE5UiH8iISdeV+Ue9A9QLME3A4p
         EHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697577646; x=1698182446;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YLqkTI6vR2tWYnFN+W6Diu3XdGs+XBePZt+SQIcTiUA=;
        b=OteRXP12lMH/MSKJSsufiR6JU3C24uYvA/cTf0YRbu3hlKnswXYFlNC2viS7sth+WW
         MPHXvj2kCT0JMRksLhOpNVEhur63VPkbAw6WWs+Dxt+alo72FuyG9jFlvreXRiAfEWt4
         okSfG50qyyNq2Kc7Yxt8dhJwBxx1lV3+0HgbCQ1LcadDaiZrbv62G2ceBNLmh4tPSPMy
         duI7cQc6pgQlk9rcE3aJS8pG+g3m5dM/YcEtDngMBNNpP82+kb/T8TA705j/j4IDNASH
         z+Ilh5KcvoDnzEA9iQwL2duaSmRlcO7opHIbCE/SDI4cSJtYtlXQBTV+t2928R5UOMTW
         AKbQ==
X-Gm-Message-State: AOJu0YxX7ulZL/YPr9fMHIQ6xmFbxiFOuwX3PiOXHBAVnCOLdSg+X5Vd
	SnXQ9pIerrfJ1ZSxdNjm8gZIbxJUHiBOjw1qx/c=
X-Google-Smtp-Source: AGHT+IEX66yGLsUmWpfPuM7qG4EZifdUZj5cmuIWShTCT3XjtT7PriVg4+B3fJa3odYHvc+U59+Pwg==
X-Received: by 2002:a19:9153:0:b0:507:a8d1:6e57 with SMTP id y19-20020a199153000000b00507a8d16e57mr2270797lfj.40.1697577646432;
        Tue, 17 Oct 2023 14:20:46 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id eo9-20020a056402530900b0053defc8c15asm1769060edb.51.2023.10.17.14.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 14:20:46 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Tue, 17 Oct 2023 21:20:45 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <771768025.42201.1697577646021@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.6-rc1-17-ge0750d947352: Failure on arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_42200_2085860166.1697577645493"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-next-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_42200_2085860166.1697577645493
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

In CI config tcwg_kernel/llvm-master-arm-next-allmodconfig after:

  | commit v6.6-rc1-17-ge0750d947352
  | Author: Kent Overstreet <kent.overstreet@gmail.com>
  | Date:   Thu Mar 16 22:18:50 2017 -0800
  | 
  |     bcachefs: Initial commit
  |     
  |     Initially forked from drivers/md/bcache, bcachefs is a new copy-on-write
  |     filesystem with every feature you could possibly want.
  |     
  |     Website: https://bcachefs.org
  |     
  | ... 1 lines of the commit log omitted.

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
23730
# First few build errors in logs:

# 00:20:55 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
# 00:20:56 fs/bcachefs/alloc.c:332:9: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
# 00:20:56 make[4]: *** [scripts/Makefile.build:243: fs/bcachefs/alloc.o] Error 1
# 00:21:08 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
# 00:21:08 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
# 00:21:08 make[4]: *** [scripts/Makefile.build:243: fs/bcachefs/bset.o] Error 1
# 00:21:09 fs/bcachefs/btree_cache.c:67:9: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
# 00:21:09 fs/bcachefs/btree_cache.c:120:2: error: array index 0 is past the end of the array (that has type '__u64[0]' (aka 'unsigned long long[0]')) [-Werror,-Warray-bounds]
# 00:21:09 fs/bcachefs/btree_cache.c:201:6: error: array index 0 is past the end of the array (that has type 'const __u64[0]' (aka 'const unsigned long long[0]')) [-Werror,-Warray-bounds]
# 00:21:09 fs/bcachefs/btree_cache.c:607:3: error: array index 0 is past the end of the array (that has type '__u64[0]' (aka 'unsigned long long[0]')) [-Werror,-Warray-bounds]

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
32815
# linux build successful:
all
# linux boot successful:
boot

The configuration of this build is:
CI config tcwg_kernel/llvm-master-arm-next-allmodconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allmodconfig-build/135/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allmodconfig-build/134/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/e0750d9473522d076b33ee257a21e27a5dd75031/tcwg_kernel/llvm-master-arm-next-allmodconfig/reproduction_instructions.txt

Full commit : https://git.linaro.org/kernel-org/linux-next.git/commit/?id=e0750d9473522d076b33ee257a21e27a5dd75031

Latest bug report status : https://linaro.atlassian.net/browse/LLVM-1005

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-arm-next-allmodconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/e0750d9473522d076b33ee257a21e27a5dd75031/tcwg_kernel/llvm-master-arm-next-allmodconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allmodconfig-build/135/
------=_Part_42200_2085860166.1697577645493--
