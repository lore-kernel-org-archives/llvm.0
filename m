Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24683155316
	for <llvm@lists.linux.dev>; Sat, 21 Sep 2024 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726911554; cv=none; b=J70bcW8deZARDD0dgbX4Jm0CDGdM7q2Buvd3WIVIr1kQL9vuJo17hoxBELjtG/O4xrEJoDFQOivBYwrNRQxYMFgQU4UYUtNIOTi3lLwtoGOHjGFqUi79lpF+4thZ36y9+ybXX5jw0H9LrV9AIszm9KSaLMOiVjLGVTs4QNYSdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726911554; c=relaxed/simple;
	bh=scqM8QIJ44rKxuDQym3Iy/3eVPPGXdofO9VidzGOuR4=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=qjEY7glBCbzlB+DgfKd1nIIwmNV0G9L2rUu/p61IQFVSn/OFjgipSTf0AbwsJ9RYiWjyppic/A1ZlaEjvrlP3eOyI3qIHtYrRgrKddNSI0MbRUsBBqZMzf9aanR+Pajk+XP08NIVAwVUxPxGxDyk6I0QTcJrR26/JxiEFGO8piY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=We5YG0TW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="We5YG0TW"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c4146c7d5dso3554540a12.3
        for <llvm@lists.linux.dev>; Sat, 21 Sep 2024 02:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726911550; x=1727516350; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AO/GgjT2fMy2ZovubNfBkYeRkNmP0Ld0fYYLdh11WQI=;
        b=We5YG0TW+1czwgWjh602J0QnURXyPsHwx9/x+fkEibTpwsDqePebf1bQ6GI5VVXKJU
         1O1bjNmjGZkGc0OCzxOAUKzmOfhXfPDOAtOqnk+1k1VoTRHzHLXcLxyCWEJvEvDjesQ3
         TVQ9vXK/web8dkRbGh8kExEz5VMu7WLUN7EAwsZ3WtWW8exRCoi9wqpvISObMNrW7BYC
         C1EDGoq7riKzfnmJ5NTiW+ZoBC8R5J0+Hj/WnbFIuczRK9l0smNTfvN2eLruDBrIGySY
         iEoLIm5SIyQX9DzRaMlPGxauqV1vAWe/XT1ZUq/M2M2h8EWVGF5c2CYfnvwjRQHPFCMu
         zxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726911550; x=1727516350;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AO/GgjT2fMy2ZovubNfBkYeRkNmP0Ld0fYYLdh11WQI=;
        b=Zn8uJ4ozKqmvQgISxXSbOuWUoL56JmfuKxsiUnYwzA8QrCs/C7DUqIRribyWZcmKtL
         Zfv/ZhsSBEBUZTmdbhteJjfievteYmD9LfEChx+bTDbRAJQRoeiZHJuxo3daQ6KsBA4g
         tVJXeNfKs9MSTOwmy8MCQdhQp4pSdJrUKlZ2GxegWGat+/I6mmK0Kb1Bd8RbP9VhQ+mI
         crnI2jqYpI5QwpN4fda6IUY0xXJpm/u7fEHBBULioBQ1o7VC5eUbEceY1uQ5WSM6jZUP
         JtnJ/yMWeHPFLc4NRoW+ZALiuFgLOZrgG0mlsAJXdkcXJQGJvv6fLVZeOSW4XHKdLUF0
         wKig==
X-Gm-Message-State: AOJu0YyQjXa9nafYu7tlCV5J78nNZduszSIZUjas4LjoBf3ijMvoM/yz
	oVKF4Np6V12u1cKKQImBbMXsq2LGpJokE0Hb7hrWBk4W3SW5N83nz+QCQsiok2HD7X8Z/QT+vaE
	E
X-Google-Smtp-Source: AGHT+IGFV2/XKpNAAFP7Oj0ra8ritluY9P3sLlPssP4lM5xdH2gRW4HBfOAmttI8kZo3J07bMff5Bg==
X-Received: by 2002:a17:907:efcb:b0:a89:f1b9:d391 with SMTP id a640c23a62f3a-a90d4ffd5e4mr496342366b.14.1726911550286;
        Sat, 21 Sep 2024 02:39:10 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f3acbsm950804266b.64.2024.09.21.02.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 02:39:09 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sat, 21 Sep 2024 09:39:09 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <736663489.4818.1726911549829@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-20-init-6434-ga861ed411a35: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4817_1340084015.1726911549185"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-lts-defconfig
X-Jenkins-Result: SUCCESS

------=_Part_4817_1340084015.1726911549185
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We understand that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1362 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-aarch64-lts-defconfig after:

  | commit llvmorg-20-init-6434-ga861ed411a35
  | Author: Florian Hahn <flo@fhahn.com>
  | Date:   Fri Sep 20 11:22:03 2024 +0100
  | 
  |     [VPlan] Add initial loop-invariant code motion transform. (#107894)
  |     
  |     Add initial transform to move out loop-invariant recipes.
  |     
  |     This also helps to fix a divergence between legacy and VPlan-based cost
  |     model due to legacy using ScalarEvolution::isLoopInvariant in some
  |     cases.
  | ... 4 lines of the commit log omitted.

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
8141

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
9333
# linux build successful:
all
# linux boot successful:
boot

The configuration of this build is:
CI config tcwg_kernel/llvm-master-aarch64-lts-defconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-defconfig-build/177/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-defconfig-build/176/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/a861ed411a359b7cb2b58d642e4a7f2fdcf92057/tcwg_kernel/llvm-master-aarch64-lts-defconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/a861ed411a359b7cb2b58d642e4a7f2fdcf92057

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-aarch64-lts-defconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/a861ed411a359b7cb2b58d642e4a7f2fdcf92057/tcwg_kernel/llvm-master-aarch64-lts-defconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-defconfig-build/177/artifact/artifacts
------=_Part_4817_1340084015.1726911549185--
