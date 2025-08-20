Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B766E31A046
	for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695645; cv=none; b=p1eSG90F60t9yAuenAblBBNKEs/RhLCCMl8OV59DsaXEqP+e5GzlKzLYDAN8o3FWxjIBfdJ6tvcbtLoqsuuEu0boVVtwIcsJ6WimzHqw21vgSH8aCABiHEmCMoxgUiV4fC4nTPTvE33PJ1eKg6sVFSHRnPoMfsC2TC5WtzTa1JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695645; c=relaxed/simple;
	bh=KPSqciT5t06cKS/juMXRjSVgnjxRqIsScfumcMkysfU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hAxmQuKxT9SJP7FfWkycSKfuJKzM6i3yukxEWLi5qCNSdLPoSJu3VBO7F7isA2cR20CrX05j6hhDHE3EJpxkZLV1Zc2lyIkJs97kx8ztSa1ZCBFLeRKHhOhGePL9T1tszUc1Us/655ojf6yuolgPPz4DrzDehlxabpcCqRdQZrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G5IMLkeD; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G5IMLkeD"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b476cfc2660so359202a12.2
        for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 06:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755695643; x=1756300443; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UEhLj+QpdbdIXsYiUCu+v2MbxwMNrA1QXcK0xjWmvUg=;
        b=G5IMLkeDnXmAgr4nsfml+6yWbtxNfLXmJXzl6kew0N8I/V1T58Pe7g3LkbTyy/beyz
         uGuijg08aQOHF+EbFHELHdEcXL1woIXxxZCyObSLPCF7G+iiLUvukO7kWagAWMcyvQak
         N8se//52TnxDclmxMELl+cTH6EYxj8WBegnUIRrFLizA/Ub/mWQ27SHfi90aCDOriYaS
         vfw5p2qZcB/R6jKxsoQDCX8QEgCYrKk+3rYYuJigskIVFr0Ffy8IcW/n2IvB9vnAoE6n
         8Ro6VOkr5aLY+woXDr90jdR13lrDBWCqxrFJ/W07yh5GfNW4FS3RJY4FOLWhwQhnec2b
         WoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695643; x=1756300443;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UEhLj+QpdbdIXsYiUCu+v2MbxwMNrA1QXcK0xjWmvUg=;
        b=eLEnGP4NR0zj/72sHSexQedCXORaUuXaVvz2I3HBxxF9BhvoZ+MZc7q+7GHeRUtD4d
         FBvA5y0lxY0isVB0QCX5HxzAP1aof4wny99cQLZrFMm/d/aXIBBi3dioZuBkDzgXkP/a
         66Zo8l6vJXU/P8gtCvk8nPssFBtOihhBr6IJq6i0k8n5q9qwoeogWjmApZYpNpOg9UOT
         GGgCT6jA8QLfXorNqdhhQz31BLJ6Rqe8Pq+8/GYPUJ9fCO/Dwbfv3jYZd5LkQ7jXDjYQ
         i8s/F29hBpkTD+KbSO27lCAsZxzTnM52GW95X0f9BK/Mwytgiwb+MvxL2ssa0yI4feH/
         2FYA==
X-Forwarded-Encrypted: i=1; AJvYcCWi7dhxrT9T1fHX+WNKPwgX3ewv5jgQk8HaDGoOWmge7s+Ii1Cn0AoJDN0n5WhvVWwIJBBW@lists.linux.dev
X-Gm-Message-State: AOJu0YxJoMr7Yyccp+WqbvqJcS7l30T344shYVdGN+Ec16mNsZRyXYSp
	Znk0PxXbQ+4OwIY7U0qSIer6+TOBRYliIgnC66CYEvT4k2qifhkHxoJ9LA6f/nwGYL/Z6+u75pE
	YpwaB4ehdRwfN6UTDOUzBp8NSMOPIbebhvPAGmEM4AmfsbkBF40wlIug=
X-Gm-Gg: ASbGncuwSopzGqXRgvrYyEDEmGNxcmGuuDVe5F0ubs4/CUZ1vdEl361J88laR8PxAuR
	+o3nAPBjhhttbrWtjW1SIQSxptZRv6/TYUlC9ch4bXt1IPO/9N4WTVf7giQmqxHoyeWUMUEynyi
	SYJxN8cF88Do07XRpxx3oFkFVzUT1F5SwjtkbglFYVjqFcerHTexbDdUXDaHbuen2JDXNYuCKgX
	OZN/uuNOcUBzdwIFP2A1QVmd3cCvj6AUZhn7cw=
X-Google-Smtp-Source: AGHT+IFBJmOUaT50s2oqxUyYw4FxsnPw5mGp4PfDEiEg3YvV4hdLkFdHYDMKytflbhE2y2paxnWvZ4jXvQbb3KvxgAs=
X-Received: by 2002:a17:903:1b48:b0:243:926:b1f3 with SMTP id
 d9443c01a7336-245ef1728b2mr39549355ad.24.1755695642929; Wed, 20 Aug 2025
 06:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 20 Aug 2025 18:43:51 +0530
X-Gm-Features: Ac12FXxC0MUMoUEpSUxG3tHBnH_B58ps1yvcBAmlPD_lH0pv4jzn6YQynSvCFy4
Message-ID: <CA+G9fYtS9nDqC7g-B4285gmxDNRkYQixyPYMuzgDg5-sy2FumQ@mail.gmail.com>
Subject: next-20250819: sdhci-cadence.c error variable 'hrs37_mode' is
 uninitialized when used here [-Werror,-Wuninitialized]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed with arm64 defconfig
and x86 allyesconfig with clang-20 and clang-nightly toolchains.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250819 sdhci-cadence.c error variable
'hrs37_mode' is uninitialized when used here [-Werror,-Wuninitialized]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
drivers/mmc/host/sdhci-cadence.c:297:9: error: variable 'hrs37_mode'
is uninitialized when used here [-Werror,-Wuninitialized]
  297 |         writel(hrs37_mode, hrs37_reg);
      |                ^~~~~~~~~~
drivers/mmc/host/sdhci-cadence.c:291:16: note: initialize the variable
'hrs37_mode' to silence this warning
  291 |         u32 hrs37_mode;
      |                       ^
      |                        = 0

## Source
* Kernel version: 6.17.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250819
* Git commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
* Architectures: arm64 x86
* Toolchains: clang-20
* Kconfigs: defconfig and allyesconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29595553/log_file/
* Build details x86:
https://regressions.linaro.org/lkft/linux-next-master/next-20250819/log-parser-build-clang/clang-compiler-drivers_mmc_host_sdhci-cadence_c-error-variable-hrs_mode-is-uninitialized-when-used-here/
* Build details arm64:
https://regressions.linaro.org/lkft/linux-next-master/next-20250819/log-parser-build-clang/clang-compiler-drivers_mmc_host_sdhci-cadence_c-warning-variable-hrs_mode-is-uninitialized-when-used-here/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31UgO4773uaneRjyDrf418EXcDd
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31UgO4773uaneRjyDrf418EXcDd/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31UgO4773uaneRjyDrf418EXcDd/config

--
Linaro LKFT
https://lkft.linaro.org
