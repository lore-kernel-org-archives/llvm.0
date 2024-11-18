Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22C61991BB
	for <llvm@lists.linux.dev>; Mon, 18 Nov 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731935453; cv=none; b=om/wmpr5//KEdfdtxtP3cyYxXMJzOc/zamSYQDnYOd6JxeNDj0CeXjypDieN2DCeTdopY2zm6Avb5wT8eNeKans3Owv940Ubz9UP175/RtCqRW0IJkH9rZn5I9AKgo+CnNmcvSQi3kWyZCRV/AtQJKYkVAtEya9BbqLZZ5FYYrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731935453; c=relaxed/simple;
	bh=Op2I8dr35muBs/N0wwVSV8bMfv9/DBnetL23eBdhKSw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kqarYZuMtK1jp5eXx3XMgmn4kO8HBhVULK8aCDwDfYImmoYEXeiQE0anUPdlwRuCR74TTuMuJJZLifwn/6WznabxAYHKK0b03OszQ+eJ5XdiYADMtW+QfrJIVfpLkhmv2mbm1N9iQV71kn4u1bTpkRMUU4Zhi1dwDRRPcl27ayY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ibQtaOp/; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ibQtaOp/"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3e60e57a322so2066664b6e.3
        for <llvm@lists.linux.dev>; Mon, 18 Nov 2024 05:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731935451; x=1732540251; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YTw7RWvWoc0SMzgWBayRA2wygazsMYV1x3KYiELVVeY=;
        b=ibQtaOp/c2tef2715ew/fFuHJTx/QDoJKK1SV6ziAwwCHT6VejJ+NiKCS/1F6JmjTP
         UNdIps2kz5lZAY8tokbQCNXzc+ojRMp2EFa60tZiHG+eAPV3dpaeq7MqXWbjb7dXCTux
         mlONjsCTAZG4QFHFfm0iSmwEvJt8OfdXm30zi9rfeuNnA30GBktlmGaDXIKnjl92aZrh
         3iF5duM1X8vhYMjZPkN2hptGA+D8ETtvy5O50ywBi3Vt+l4HFtfHXDfaVdaS9JxO/fIq
         1vfUK23j49BX3XPKacChW0Yf3G9oqv8yk+5leX2+Q+Aln0e0H8en+a93wtOh8Z7oOlNM
         1p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731935451; x=1732540251;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTw7RWvWoc0SMzgWBayRA2wygazsMYV1x3KYiELVVeY=;
        b=PumpusMbOk37T+hrU16H1tpqzVXIsUQLRY1H4XFsB5sGr8g2ZyificsOn96iqLAYry
         eAYsLvIycrDefBZ4oEhCgwBdphTz7Glaeka0K8q5CY7Xgv7wVtc3xE3jsi49MtYUZyoX
         Pbd3JJYVlw8w5ldIggKJkco5LO/4qp2QjS+pAttDtn3u6D52YmkxDWDBd10dxF8Njx4m
         jVAlO3uAOUdHBPsEd6Lzzdb/CIKhAYC5fnRAi4Tojkap9MROdwWeS9ekXr915Fl2PPVW
         VibzhYwr9k+l6sWeV58Kc/RnLUVHMXFKC+iEh6P7GcQfuFrUjGWVCbqdXHz2lhw6kqKV
         pPqw==
X-Forwarded-Encrypted: i=1; AJvYcCXO1eCCIM3Az/I7G9YHVtjKRDVHUTdT4eBXX+aHuJVqxUyQJi6GF+tiSEi7AgUZnLoigQbF@lists.linux.dev
X-Gm-Message-State: AOJu0YwvAIL2gjq2fCONQYqo/w0LDa1Rh45qukGTmB4yB68OmVQHP6CB
	xuzNorwOYmEJgkToh1J6zzPIUBu4LE3oM/ZouNClg0cJ/a0S6VQvS6lPrSA1Gq/4VaORn+QVtpJ
	E9JPefVYhrme+j09gph6Eb90xAILl+7KlFe/ZPg==
X-Google-Smtp-Source: AGHT+IHGcZHpXIet+VQyE38gSaCHSlt7RMcXTgIjtwxRtsxmDxLBiM8FQSw90gh105xogQgSb+fpkFDsIdEuZz4rOJY=
X-Received: by 2002:a05:6808:2017:b0:3e7:a284:9b13 with SMTP id
 5614622812f47-3e7bc7d87a8mr10574272b6e.21.1731935450734; Mon, 18 Nov 2024
 05:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 18 Nov 2024 18:40:38 +0530
Message-ID: <CA+G9fYs+gwu67Y0Tm2FHfNuUA5eLxT2FAWkfKvYrEbXJUXXiiA@mail.gmail.com>
Subject: drivers/clk/davinci/psc.c:281:10: error: incompatible integer to
 pointer conversion returning 'int' from a function with result type 'struct
 davinci_lpsc_clk *' [-Wint-conversion]
To: linux-clk <linux-clk@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: hanchunchao@inspur.com, Stephen Boyd <sboyd@kernel.org>, david@lechnology.com, 
	Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The davinci_all_defconfig and multi_v5_defconfig builds failed with clang-19 and
clang-nightly on the Linux next-20241115 tag for the arm architectures.
Same build pass with gcc-13.

First seen on Linux next-20241118 tag.
  Good: next-20241115
  Bad:  next-20241118

arm
* arm, build
  - clang-19-davinci_all_defconfig
  - clang-19-multi_v5_defconfig
  - clang-19-multi_v5_defconfig-65236a87
  - clang-nightly-davinci_all_defconfig
  - clang-nightly-multi_v5_defconfig
  - clang-nightly-multi_v5_defconfig-65236a87

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
---------
drivers/clk/davinci/psc.c:281:10: error: incompatible integer to
pointer conversion returning 'int' from a function with result type
'struct davinci_lpsc_clk *' [-Wint-conversion]
  281 |                 return -ENOMEM;
      |                        ^~~~~~~
1 error generated.
make[6]: *** [scripts/Makefile.build:200: drivers/clk/davinci/psc.o] Error 1

Build image:
-----------
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2p15j4StPnjuuRXu3qgndSTbahH/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241118/testrun/25881399/suite/build/test/clang-19-davinci_all_defconfig/history/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241118/testrun/25881399/suite/build/test/clang-19-davinci_all_defconfig/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241118/testrun/25881399/suite/build/test/clang-19-davinci_all_defconfig/log

Steps to reproduce:
------------
- # tuxmake --runtime podman --target-arch arm --toolchain clang-19
--kconfig davinci_all_defconfig LLVM=1 LLVM_IAS=1

metadata:
----
  git describe: next-20241118
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: ae58226b89ac0cffa05ba7357733776542e40216
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2p15j4StPnjuuRXu3qgndSTbahH/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2p15j4StPnjuuRXu3qgndSTbahH/
  toolchain: clang-19
  config: davinci_all_defconfig and multi_v5_defconfig
  arch: arm

--
Linaro LKFT
https://lkft.linaro.org
