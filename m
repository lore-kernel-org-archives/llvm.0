Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1061E5731
	for <llvm@lists.linux.dev>; Thu, 24 Oct 2024 15:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729782326; cv=none; b=cSqW5pyIeeHlVO32zmQmrwaYGBcvzwencBKyyUwvkoJ+7rdwQ+7CMmKQQIRxQ6mTdV7anNPxftL/3Zs/Dz9XOLqJs7OI8lDz+Td6r6CHUFvTQnwI+lzPMwdeKebiSUSQcXz+4liA7t64+0AlZmMVPC+MUsKevECXdZdy5A9r8+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729782326; c=relaxed/simple;
	bh=aqeeharMk17ixLZGkNgDLOJVAmDR4MwZ3UKW8XU+Tjw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JSHc/5vlxU8UG3w4Rkqi6dPCsl6vYTCkFt8Viw/PphCPYCXlu+IcIYA3AN72A2I6Q+Fe7ZcYA7A2nPMPfndwcXMmKvpCARA7sKGK+9+bZziS666Mpej4rhJt/xOsXf2cRAoRxuhz3hjkxQ1qQPwj56XNZpYBaT5iUzxI0QGVuxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D13b1IrZ; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D13b1IrZ"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7180dc76075so576666a34.3
        for <llvm@lists.linux.dev>; Thu, 24 Oct 2024 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729782323; x=1730387123; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jyarlQ6i7toXdr4KNns6qkdDvM4HB4Mkf28BveorRBE=;
        b=D13b1IrZy0d7zliy4WyWckuHG0EKhCBOpDBC6iSG9/CtCYj4EwtEY3n3ZYq0xbIbtB
         7yhjcto2XMXPbKS98gRnuSeqC476pK1CdKY5y+Q3M7B1r76JgL6SsPrpRwVkxiaXL1VK
         OokBcT2+BFeYQjl72CHV+/JbQ4WY2hc55HNVWwXM1zOXKx31HWStjxG0jssKjASanQvL
         UGLBK8zQOnnvy+BIc4J6xNlNXUY1oitdtfBl2lg/TdQJIz6osFOLIYCWpwnuU5wPcUy1
         0EtnE71ub8ks/SGB5OhDNsCo4aq4KAOVmsaPUWtzEYtPQBqhcp2K2xmgt7J3hTR/zA4M
         AxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729782323; x=1730387123;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jyarlQ6i7toXdr4KNns6qkdDvM4HB4Mkf28BveorRBE=;
        b=DoDrkISeH6cRuDXs2YbPiCSHcr2fO0hWam42uhwQJ+yRMJgq5Es1++qLuShJLgGa7M
         4pfl3AtCriwbqDyfWCRGY2l1ZSs51Tk8cpk5JzCq6JGvI3iBHF1b3zrJ1yiMa9Vl5jV9
         07+jmb04yi/sD+bsuGf2sk+Ro+Ffxgtyi6Df0afnGD2A7Kvre8nGOjjHDQzluBvLEdUb
         1cMmdC4+aKXiPbDYgDgS3018XrJPqlFuwYhbTLLLJYb9IEylIAm6HCMN3oBv+JXpnvx5
         4NzG2j2nPR+T1RDXl6GO1pISaofjxo3CyFu3E80rkOaGvmUSzBiPAi8hFWGEOkx02acU
         dGMg==
X-Gm-Message-State: AOJu0Yz8A8r7bqMJqZKNe+d7H4lLo+ICpuTJAiydyoZ8ZvzGz7ytlMEN
	yDr8fKZzr53ACuwJlupqZcVuQBkPiprSStP5lylTCETHWu8od8USzwqFQTDcOyRuqGOBDG3knc/
	LyEQYo14MlVyJZrPz2vQc+/Lshg6AYbdCMN2w+56j/TwdhSZ4xxI=
X-Google-Smtp-Source: AGHT+IEnz1GyTZlftdGpHX3jgxo2wK87KPVx/FAo2DYee8GCdaaTRp24nxaWxYg0SRPKd77LClU0CJyCAJ3uZe9macc=
X-Received: by 2002:a05:6808:180b:b0:3e6:769:b042 with SMTP id
 5614622812f47-3e62cbe6ef9mr2185584b6e.29.1729782323029; Thu, 24 Oct 2024
 08:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 24 Oct 2024 20:35:11 +0530
Message-ID: <CA+G9fYs2G_4jyv-V7f85oE53rw5rX0Tnf2V8RQ=O9CuPcbfb2A@mail.gmail.com>
Subject: powerpc: clang-nightly: fatal error: error in backend: Trying to
 obtain a reserved register "r2".
To: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The powerpc clang-nightly version 20.0.0 build warnings / errors noticed on
the Today's Linux next-20241024 tag.

powerpc:
  build:
    * clang-nightly-maple_defconfig
    * clang-nightly-tinyconfig
    * clang-nightly-tqm8xx_defconfig
    * clang-nightly-mpc83xx_defconfig
    * clang-nightly-defconfig
    * clang-nightly-cell_defconfig
    * clang-nightly-ppc64e_defconfig
    * clang-nightly-allnoconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build errors:
----------
fatal error: error in backend: Trying to obtain a reserved register "r2".
clang: error: clang frontend command failed with exit code 70 (use -v
to see invocation)
Debian clang version 20.0.0
(++20241023112211+699ce16b6284-1~exp1~20241023112229.1038)
Target: powerpc-unknown-linux-gnu

metadata:
----------
kernel: 6.12.0-rc4
git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git_sha: fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
git_describe: next-20241024
Test details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241024
config:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2ns7sv9TltSifV46KaGs3BxlB85/config
download_url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ns7sv9TltSifV46KaGs3BxlB85/
arch: powerpc
toolchain: Clang-nightly (version 20.0.0)

build log link:
------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241024/testrun/25530243/suite/build/test/clang-nightly-defconfig/log
  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2ns7sv9TltSifV46KaGs3BxlB85/

steps to reproduce:
------
# tuxmake --runtime podman --target-arch powerpc --toolchain
clang-nightly --kconfig defconfig LLVM=1 LLVM_IAS=0
LD=powerpc64le-linux-gnu-ld


--
Linaro LKFT
https://lkft.linaro.org
