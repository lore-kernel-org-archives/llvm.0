Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6C62E2DDE
	for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757579838; cv=none; b=s7JhwyTQxAK5Df4w8Dhla3gDCkvY8/w0z/DlxQBefk5p5fOSI4A1yjuCEAgVpuVq1eQbCfct/ZjRvbXFn9yxfkbfbURZzzhH+KzicJ1fENgHM2fgQSjwJZyxF8W5EVSK12o/GpXR+4aq1mtwYRvkHAmOpr8A3qDFjMeQsNvwVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757579838; c=relaxed/simple;
	bh=dXdheL8JephKYsdZVZ5VzVXsD0ljrqlK8eaSDZXPjes=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CUxHpHisoL+IvKqphXbzU3jT/AIf0VNrYIWWKPzqimVclq/BzepTfrNNsRTRbuom+hyYVP5NIjw07yuJ0oMB+ZeuU/zlWOP1KUB+exFlnKFo2S2ivIVIdOZ4VgVocEw86qZolj0xi/JYrcOPD3Zif15H4xk7nUTFUq61AmCYq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eq+7VVmS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eq+7VVmS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-25634c5ebdeso3831475ad.0
        for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757579836; x=1758184636; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XlHLF6IxLX265PKrXSfqim3Osu2zErg+VtcQhos8Amk=;
        b=Eq+7VVmSRqpPznZDKPaPVTdqprJEdFSJvxJZqdaX7GsM1nOJdbh43sjQEZBQqOhRgT
         kaQJcYazA1+fgaaTnVSsYkVaVtH8xc9RMCnqgNfX2ohsJxX00f5VNKC03tf3s9pPXAyl
         fOzHXLb4b3mu35WMf6/HOAR6M9Upj825a9RYQipvRJPgSyqXyPukyZ75R2E7jhgQ6C6K
         vJLOFsCtNKrdQcSJXN++8J0YKtU9HUkhIX5aKgHTDLVDs/nxRgZepyB+ger+S99wvAOH
         hRbHdYchc8rsva/vbTagB2vyGQl9FgWHkWf2cygc78jZZRRp/SX360e8BLBtQvEMU/Xb
         eZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757579836; x=1758184636;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XlHLF6IxLX265PKrXSfqim3Osu2zErg+VtcQhos8Amk=;
        b=uyHdbPYi6lyEyMSCbjLjaZdoXT/HKFLbra6XCggRf7zSONFKi0bv+mEx1Tj8axcwTn
         urZTbYQzTGc5LCHf3FC9U1vm/bccYxQ3oS+m8/HBaYGAn7dhIfKCrj2SsdQQAnqmNFJ+
         nbf1he8A0r48P7koMA3fZmlxIXSWNzFLPWIy0pT5PnwrmrNacgTLlRAf59kv2RBosENd
         D8Dtv2EOAUDks/EZkYL833tdEeWV0mN0ruc3fZISd0STsg/7cFVDv3XKpBA1Ba2nGMfe
         V05SLopHcIJypkvIdxX0FCJ+mdEQuIRvPD77cSL29evt3VTtJEqV0LwctdhYbBkFlWa9
         VsFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqYD/FKwbuc69o5lUkgzhfhFLfLn9+RNa4QV23+x3ijLkfu8BRNrniYme/g2LHj29bfPoZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwExId/VPxciQqAVQlk3QFXy3JHSLzHwsLdurqBu4g29WIAM490
	/1Po7d4a9KMMPvfRuLcEFcVW36hfcgY6VcP36hsqz04zICFuny2fuos8LBgiRwQGHbxZC0lvohh
	3zPZR878pZlvqNw/kPOx/eYxEcG7oHo1c8daKMBEYww==
X-Gm-Gg: ASbGncvu4PCVBj6aS/I6W27C36CBKsM2z6EvSCdIpM1bWwmNsvDSw9JF1c4shpJUQN7
	k8t1v2bUo2Q/NyhzsJoFyKDFOqlKXQpnxZ+TvAKZHXZg8h2d9FaDjiLRu1/bT+nQguzghiyxldK
	rdNaGtTsdblyrCS12Cb1KR8sZJ/L7HzjCaJESM58jA/eoEtvXf52JFSTfG0Q2vGVEX7Tro9reyn
	xI5TmCPnmrVGc1ZVQub3/a37k/2zkylLH0TAOVJDIMd1RQMFlf0QrrqrnnaJXGxa6zzwDf0uZ6+
	yiK3W0k=
X-Google-Smtp-Source: AGHT+IGR2+igFyrerQ3HlTU0fDr7FuwZJE+/EsvxJ0BM47OK3QyzESdHU/BATUPNXmekU8opkqkhhnxnT4KYCn47WJg=
X-Received: by 2002:a17:903:230a:b0:24f:30dc:d3fe with SMTP id
 d9443c01a7336-25170e428f3mr249071415ad.29.1757579835668; Thu, 11 Sep 2025
 01:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 11 Sep 2025 14:07:04 +0530
X-Gm-Features: AS18NWDVnn8cWFJt-IwGb3BydlPhAt8pRyLoCxHvXGT9gVTi8T47w_BuQztkQok
Message-ID: <CA+G9fYtUi3bnZ2zycCot6KGeZcn67JAvz=wZm=6f2w9ZnL=0Uw@mail.gmail.com>
Subject: next-20250911: mm/slub.c:3960:27: error: a function declaration
 without a prototype is deprecated in all versions of C void flush_all_rcu_sheaves()
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>, 
	linux-mm <linux-mm@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed on aram arm64 defconfig
with clang-20 and clang-nightly toolchains on the Linux next-20250911 tag.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250911: mm/slub.c:3960:27: error: a function
declaration without a prototype is deprecated in all versions of C
void flush_all_rcu_sheaves()

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
mm/slub.c:3960:27: error: a function declaration without a prototype
is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
 3960 | void flush_all_rcu_sheaves()
      |                           ^
      |                            void
1 error generated.

## Source
* Kernel version: 6.17.0-rc5
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc5-next-20250911
* Git commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
* Architectures: arm, arm64, i386,  mips, powerpc, riscv, s390
* Toolchains: clang-20 and clang-nightly
* clang: Debian clang version 20.1.8
(++20250809043815+87f0227cb601-1~exp1~20250809163919.3)
* Kconfigs: defconfig+lkftconfigs

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29853978/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250911/build/clang-20-defconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32XlFDtH7RdddaA6FHskupLDDSO
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32XlFDtH7RdddaA6FHskupLDDSO/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32XlFDtH7RdddaA6FHskupLDDSO/config
* Build log details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250911/log-parser-build-clang/clang-compiler-mm_slub_c-error-a-function-declaration-without-a-prototype-is-deprecated-in-all-versions-of-c/

--
Linaro LKFT
