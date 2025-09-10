Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DDF31D39F
	for <llvm@lists.linux.dev>; Wed, 10 Sep 2025 05:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757481834; cv=none; b=rK5wj6YMU1PX0yFwlSo0RORTCsWE3GapLwdmvZ9Hl8tc11mKtffzkcnSIKpuS2NE8xMc4pg72TsRoBlaNDnDyszZHrmg9O5spAMsQ7Pis/nWU8lmhSqmdYBSj7tt2tkn6j65MqeKsMY6L6GpjDx70rMXlc95RFuS8gEU29x8/6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757481834; c=relaxed/simple;
	bh=eHYwl2SvdpYCIE+w1VAp1TDDeuuUoFp3VVfWX0rWtFw=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=BqbQLqkHEwJba7AHwKRi7eUHLB3vAhP3zMH0FAyC9Pl+KYFpuookDfFoEBwVIl+GcBARgw+n4ZefubNwty5hXVSYgS4yUZdKAwLe2UyoMjbKnh5yB/jOwMgAhVm4eRBMrGjWzteWuUSrNjO8u+FeA5YV7+25kfPt1ywYzKLeuYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZXRELfAm; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZXRELfAm"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62733e779bbso3895723a12.1
        for <llvm@lists.linux.dev>; Tue, 09 Sep 2025 22:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757481830; x=1758086630; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0SLkTI7VsCIjGKE41hH9Kal8XD5ZHaA/UCLCaUVgP1I=;
        b=ZXRELfAmlPIF5IeaHtLDa3FBl3Qf1uuSn1vxi5+3sbG76XSCaVVw0YBYB/biHKbwmp
         K83ZDuNXEjI/H2eYFKrXdqr5iejs/kI7RiUBKv8kDUwLpwKs6pKK7f9D71+zT/ylhEKt
         4RGntd4xJJQV9pplE9qmu8oShzIrBIMRrOPqe/nZKFZtXGCYO4+LWOqOh1LsXlkUQrnF
         LsjCP0FT+nYC8VfAT1VqyiZpkgkzKtk1WqaUXRZqInECLYaNcul/jGZgxCDXhM1qz6FZ
         GIgVPEX7tfWC8QBKcABjzzqagR2DmkR9s+QmN20n1wYkjWw8XCDPinCDaVR7xVjmquAv
         as2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757481830; x=1758086630;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0SLkTI7VsCIjGKE41hH9Kal8XD5ZHaA/UCLCaUVgP1I=;
        b=edwHcsB4m6DBpuryTFsySF80CzM8sj8E+trrIqmGabSQ8H0GrxMAIzceE7zv2Zvp6d
         +Djk26Lugion4zHe3fKHYtfkJZCucnm4K+cYnKWhgw302BLiUOJ1CHlKsu9w+3RqLLyS
         K2B3gRyDd27yoSsiE2C0iNwmppDhFZO9kPUggCNhEKVjD9bUMbu9UeQv5yAMgFDv4WFm
         6oDzedoFMCkl97yj1LOK1JTDximzj85zbPHXKThKso3/wig6LQwFg9XeF4rOeBUlZR8C
         7rqNo2tVKQmWGSJQV0TnCvUL8cgjun1k375v6xJFR7yxaqG+3kkQB7752yhru7AHmKvf
         U1FA==
X-Gm-Message-State: AOJu0Ywhk1DDeBUcr8sexhuXMBgQCtObxTvlSQM2B/I7t2Eq/pIOpQiA
	U7iyh031TTjYoh2ocj7INvH1ftS80AHPrE2+WUBnKJFOzwFXmnMUKO/j2220j/lQphls6AAkMyR
	yEakq
X-Gm-Gg: ASbGncvEez2B8B92+s5prBS1xAppbJwRBMldIMMaa1yQlkYaZfTfVdSqW6xlcn82dyN
	OZ2fFfpi2TI0lipASFhiLlJePD7IddqQD4k4Dl3muNnILQ4rwgG7BJmpxCoRoX2RQA05IWh7pG1
	el9z6ziBlxmc6OW1q7oECAuhkLgPCGCQQnjMvsdZhxzOUOtTQR9iM6S/YQJ+YN8ovDLpyh+iUoh
	EKpRpFAlxFdcmohgOuBnfYYXUTAIq9TrcKWx+VBKLO0jLHKIN0aevHzgwLZVmbgViptGOiKGlKd
	8U8f/YPrsh/LPNK0lr9OX+h7l4m7q37/M3zyNORMuLHTxdof9Dvat0Gpqaewk0LdrnE8woz+rb7
	aHSQQPI1SwXlfqs56m6vpKNr1rLspgIFYt+guCTN7f+C/+YBwsTx5xpM9vzDLTgAEaYP1P36Ip9
	dpkEc5
X-Google-Smtp-Source: AGHT+IELLssG+C0Q0+J3SVNPuA5ZpvP1mnCQ3Qa1lgs0RgaJ7lMQ1Wfpg2oiQ+v2e4MbvkEQexwaXw==
X-Received: by 2002:a05:6402:1ec8:b0:628:f0df:2ca2 with SMTP id 4fb4d7f45d1cf-628f0df30f3mr7778270a12.9.1757481829961;
        Tue, 09 Sep 2025 22:23:49 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62bfef684a5sm2441542a12.13.2025.09.09.22.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 22:23:49 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Wed, 10 Sep 2025 05:23:47 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1155652020.15599.1757481829520@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-22-init-6898-gdf430c33a71f: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_15598_2058154629.1757481827618"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-stable-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_15598_2058154629.1757481827618
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-stable-allyesconfig, after:
  | commit llvmorg-22-init-6898-gdf430c33a71f
  | Author: Nathan Chancellor <nathan@kernel.org>
  | Date:   Mon Sep 8 11:33:57 2025 -0700
  | 
  |     [Frontend] Define __SANITIZE__ macros for kernel address variants (#156543)
  |     
  |     GCC defines these macros for both userspace and kernel address
  |     sanitizers:
  |     
  | ... 29 lines of the commit log omitted.

Produces Failure:
  | Results changed to
  | # reset_artifacts:
  | -10
  | # build_abe binutils:
  | -9
  | # build_kernel_llvm:
  | -5
  | # build_abe qemu:
  | -2
  | # linux_n_obj:
  | 316
  | # First few build errors in logs:
  | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
  | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
  | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
  | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
  | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
  | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
  | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
  | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
  | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
  | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
  | 
  | From
  | # reset_artifacts:
  | -10
  | # build_abe binutils:
  | -9
  | # build_kernel_llvm:
  | -5
  | # build_abe qemu:
  | -2
  | # linux_n_obj:
  | 24163

Used configuration :
 tcwg_kernel/llvm-master-aarch64-stable-allyesconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-2089. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/366/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/365/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/LinaroLtd/tcwg/ci/interesting-commits/-/raw/master/llvm/sha1/df430c33a71ffb22b8d33d24538775c5fc9de6e1/tcwg_kernel/llvm-master-aarch64-stable-allyesconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/df430c33a71ffb22b8d33d24538775c5fc9de6e1
------=_Part_15598_2058154629.1757481827618--
