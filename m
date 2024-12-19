Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4378F55
	for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 04:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734581106; cv=none; b=hrjxuOVuwBCvLrzmSkQRdZIpyRij9E3c0YYYhlYZu/OkmOkE/silchk6Rm7HWIa+MO2y6LbcQFd+OeUtLdZ53qOA7/sifNUJE4Twn5YTWOCu0zkTQaGhIf7MkfXa7XJif4YQUYsZayGH6Pa86R/TAiIYWbcmylwfIkZ01BZfVY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734581106; c=relaxed/simple;
	bh=1g+eeXt6ljttSRBQ/TtKmda5V7vVXYPf7dt8NRAX5B0=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=aU/OZr5taQe3NdGZOye0souIJVNI/WsTD+KAiBesw+pUJjoDKxbu+6+3jDHzEukv2ejDAQnMj4oICFrNo0xoHPSGXlNqJiTQVUKvHpGCyj2tQQyWzjZ6GemP/Z2cgtgqZtdOSoXGIzuj4or5QtiwVepg92QQtMqpNc042Z8itsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ThvRp7P0; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ThvRp7P0"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aabbb507998so60258266b.2
        for <llvm@lists.linux.dev>; Wed, 18 Dec 2024 20:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734581103; x=1735185903; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4NuEgkUXP57Xv8pN1PK8eLD8VkAGcA/jKz29Cr1hie4=;
        b=ThvRp7P0aiEMLBcHlOGU+mvZG7GP4Dex2gJSKwTLOtsFovsByVcBBuSdZNjV/BiTsJ
         Ju6zSM3SXJhpeVi6xl60fDUbgMat7ZzjI/u1oyb5GsUkWcDjeZlLAcEscpVXw4kLBQe+
         SnPZPVmcDO/vaXxku/Sabiiri2pQvR7RVRYVmEwBsUQOy7zDBZq2+1JHqQwc8kuXQtNZ
         WDFUst8bEfMbi54VVTwa7YSkV/I7fW1CDNvwGB0OljEU1AcYeG5HU00EecDmsuzIfR1O
         lmLtWrgpD0NaWZQCcLNrYNifM37nGWpUIUfTGjslf6Y2ydTTUe1h51qLlAFqLsDI87/s
         KBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734581103; x=1735185903;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4NuEgkUXP57Xv8pN1PK8eLD8VkAGcA/jKz29Cr1hie4=;
        b=RksUbguYshno+5m0fvXlAnxFgQrAjqJKCIq2ghNyQNpPNJBi3RX7QhrsOc9HsDScl/
         akWIFP5HM81M44ZUr0069aLp2XyU3eU41ICx1rHWMxdWFDoJU886cUalB7zKxCwwiEXl
         eEh7Yl8vQv6um1Jr0Ul43BaGcBH/Ml8oDvNjhAgAWaCVC1S6mhIpEzgC0OqNqyi77PDR
         eUAVIaMVp1BZLuCiygitE8E6paSscS0uNd6NnemDj0KKCZrKX9mLzeaSPw38YYf6IeAR
         t/1QlHGTGdVdwa0csf8mdKb33guiQinsXbjbcYq7dI16lTLaAVRQWT08YDL3pVuTz0im
         IkBg==
X-Gm-Message-State: AOJu0YwJWSuliXv6dMnVxQkhWx1SLWQ/1Nzdat3Q++UTaRanYJi8qIPL
	HYlrwr/RF32A+HJ+AY2egISOZNQbeCmXEF0QBX1khVhZpuIX3GLeTGVU3+hgZwqLkjBB9Btn+Mf
	C
X-Gm-Gg: ASbGncspu+X/Gm77wJ4sinYy3gk2pr+xwd6sTPFtSTS6I071t10e9q1dTJ3eXUGEAIw
	TV+priMhmxMxFMg1STeK0QZ/JsrSK51FTtN9+Qa4mUYJLaXzn/s9IS5FhcJQ3H85/We9iU5F75b
	dT+uPbXyMkKUl7OdSOtAOYakdPclKB+xwNNtXlTRIpIMHfGRGvYdUcmOd1MVxZlF/8uIU8/mEkC
	P8iqZZt7vhYx2Pc7q7g0XUo2lvgxcSNq7HoKnE3R3KDt+j8GJgpljFqFNckQJoCw6Q82zRdAauA
	gjdoX5XoYbYLq2Iidj+mcCRkl9Mp
X-Google-Smtp-Source: AGHT+IHWUqEzRaa95Rn3RbpzYk0G9K9TgjkIIJaeNrZVFUOAeoGQB4m0HT5IPl5dfU5kwZwI7C683w==
X-Received: by 2002:a17:906:1346:b0:aa6:7588:cbeb with SMTP id a640c23a62f3a-aabf470b70cmr451390866b.11.1734581103004;
        Wed, 18 Dec 2024 20:05:03 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89887csm18975966b.80.2024.12.18.20.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 20:05:02 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 19 Dec 2024 04:05:00 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <289107071.93101.1734581102392@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.13-rc2-20-gce8fd0500b741: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_93100_1547369066.1734581100516"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-defconfig
X-Jenkins-Result: SUCCESS

------=_Part_93100_1547369066.1734581100516
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-next-defconfig, after:
  | commit v6.13-rc2-20-gce8fd0500b741
  | Author: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  | Date:   Tue Dec 3 10:19:35 2024 +0100
  | 
  |     crypto: qce - use __free() for a buffer that's always freed
  |     
  |     The buffer allocated in qce_ahash_hmac_setkey is always freed before
  |     returning to use __free() to automate it.
  |     
  | ... 3 lines of the commit log omitted.

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
  | 8791
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
  | 10114
  | # linux build successful:
  | all
  | # linux boot successful:
  | boot

Used configuration :
 tcwg_kernel/llvm-master-aarch64-next-defconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1485. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-defconfig-build/205/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-defconfig-build/204/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/ce8fd0500b741b3669c246cc604f1f2343cdd6fd/tcwg_kernel/llvm-master-aarch64-next-defconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/ce8fd0500b741b3669c246cc604f1f2343cdd6fd
------=_Part_93100_1547369066.1734581100516--
