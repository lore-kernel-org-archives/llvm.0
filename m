Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7C62DAFDD
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756894104; cv=none; b=sa8kyhEZwfi/lX+nke511IQh8D1+WVfwn5ZXLbgvQqnsdoUPEtGJ11gpl9XyzEJpv1x2rp6iEe2UmRIZwkBL+kUK7onxFqKf5vP0WuspdZTJ0V6MVPgKOMWdTAE5xlYDcv7+tnO+z/Ur1Z3V/KEZiynIybilebOLWCPO3rVmPM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756894104; c=relaxed/simple;
	bh=N60bxwoBK42jCkCkhaiyJ2RpMvLMJ+7cNdqT2d4o0Pw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fVT5nHcvk9up4xaH+6dpRy/DIuxAz5fdv7YpSSE8fJNjs+K2J/oNd5u9Hu20A7U8k+qd+erTbASWkLskBEq4ilgr0HvEpyKES6lGDn25MYJovd/XrZIG5L1BHBjNFYIcTEziZG58BMqr+AJ24vuy5prUFnOusPZauaYGsfq6kyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QD6Eo5R5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QD6Eo5R5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3280264a6e8so3352201a91.3
        for <llvm@lists.linux.dev>; Wed, 03 Sep 2025 03:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756894102; x=1757498902; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m8UwOAQLFxlapL4wJjDPziLZroOio1WKHWOdBe615V4=;
        b=QD6Eo5R54PIu2KzHjRhEnmLkGhh6ZsdSRiBC1KexRhDjZz17jfryQhhBkl5eDidEoT
         +K0H3HkUApBkrDLbkcm/ctgBdvbcabqF0rmg9m70Gikjrd6p51QP+hMIMJDP1SySwvUn
         aT5YdBz1hbe8qrTgwkmdV/EVMEyLSS+9FaSi0JM46yKUgVXB3TdC4X9y60HgwaJhEMo/
         AZeJcaYo7TZQ7aMCmxiJXLH90DZeAbIyUjRy2DgY731qZTXPT1ilPRWD9VoFIkV+v9xN
         ugHEVwzXJXpfIkOmNuL4w1lXuQi9r4YgTx9jJn/fuiX0YZbZ3ur9eZVEb+p75mtJX7BR
         WN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756894102; x=1757498902;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m8UwOAQLFxlapL4wJjDPziLZroOio1WKHWOdBe615V4=;
        b=o7WY83NnFhoqLKC6486cymXYSDy6Q7WxF662C4W3CSiQhSwwcQpn53b0lLHDdp97dE
         AnBKqH17MzRMRqYJNxVxXGEDn/yUUaB7jt7HXWX0yCUFc6xFbr2YYVGDZ6nor44F46tP
         Ne97NwDIl/BWwMjrqJA8FMqVUueRUjfnvMsDGhFO4gElO1J24vb4TNM9nQLQuQ6ZP76j
         ECV3LJxwbrU6odLDJNazYAZqgAQSz91D7fquCXWQINcH/tyZEN4TMd+eIk8CYFRksEKV
         6/VWWshX6oAIcbBlVPBrDOWsVL11MLKSUVE2ahLeP0BRDm9j+FPSSA56u6/jEZpIac0z
         EIoA==
X-Gm-Message-State: AOJu0YyIQq+FZGkrZAproAI1f7cNap8T3NR7LmuqRS9c69CfqsYT3KCE
	y8izv/MKeuokNRSQI22InQlKlf7mpBOtG3I2NALzKVnCNKtBehNU/ULuY0SIxq/EtTRAvCdZD+9
	VvYI6xDCVS8URZI5iaWHEwDFXOE1Bx64Cyi37xM2yvXyGJHe737BcUOU=
X-Gm-Gg: ASbGnctIhcw56Qr609Zrw+7/fFoAUduMrMcJruU7HTXOYNzmnsOE8acV2cp5m0ZmkvW
	IvlCh+LA/f14wVp4l0XT5vRD9rO75SNcDB/C19QPpz5n4vzlThW/u1HHTsgF8KQbqC1ZpTAtaKB
	S4IUpb0NQw99nPSKxnFRhmd7aIHAMdgIWAZho5tz6XwoUSc89zMl5//4RPoWgkOz9wnkxKdZKs4
	yMvxKuluuE7Ivj8Re9UTgaf6WMrStn9klUuovpf
X-Google-Smtp-Source: AGHT+IFXPS/WTlketDT7Ry+T0jvnXkJWiEWLHz4L2qR0cIclYFFQxTiDX5NTPXgKjBbk7T07stAxT1Awro5pXflUEHw=
X-Received: by 2002:a17:90b:54c5:b0:329:8160:437a with SMTP id
 98e67ed59e1d1-3298160446amr17933963a91.24.1756894102326; Wed, 03 Sep 2025
 03:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 3 Sep 2025 15:38:11 +0530
X-Gm-Features: Ac12FXxzMFZM2zT7oOOLzDits6M_03K1dnyTRhCYTrY8QuqW8ke90eorpMyKwq0
Message-ID: <CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com>
Subject: next-20250903 x86_64 clang-20 allyesconfig mmp_pdma.c:1188:14: error:
 shift count >= width of type [-Werror,-Wshift-count-overflow]
To: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	dmaengine@vger.kernel.org, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Vinod Koul <vkoul@kernel.org>, Guodong Xu <guodong@riscstar.com>, 
	Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors were noticed on x86_64 allyesconfig
with clang-20 toolchain running on Linux next-20250903 tag.

But the gcc-13 builds passed.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

First seen on next-20250903
Bad: next-20250903
Good: next-20250902

Build regression: next-20250903 x86_64 clang-20 allyesconfig
mmp_pdma.c:1188:14: error: shift count >= width of type
[-Werror,-Wshift-count-overflow]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

x86_64:
  build:
    * clang-20-allyesconfig

Build error:
drivers/dma/mmp_pdma.c:1188:14: error: shift count >= width of type
[-Werror,-Wshift-count-overflow]
 1188 |         .dma_mask = DMA_BIT_MASK(64),   /* force 64-bit DMA
addr capability */
      |                     ^~~~~~~~~~~~~~~~
include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
   73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
      |                                                      ^ ~~~
1 error generated.
make[5]: *** [scripts/Makefile.build:287: drivers/dma/mmp_pdma.o] Error 1


## Source
* Kernel version: 6.17.0-rc4
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250903
* Git commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
* Architectures: x86_64
* Toolchains: clang-20
* Kconfigs: allyesconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29752023/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250903/build/clang-20-allyesconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32B39xPuITjxcbak13h2MrLZJP4
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32B39xPuITjxcbak13h2MrLZJP4/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32B39xPuITjxcbak13h2MrLZJP4/config

--
Linaro LKFT
https://lkft.linaro.org
