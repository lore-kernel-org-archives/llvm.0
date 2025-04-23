Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF6427FD62
	for <llvm@lists.linux.dev>; Wed, 23 Apr 2025 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419559; cv=none; b=D+1Y5/1fXUVcntukNKt4HT4bzAU8xJ3wjj1NcWzjhO3FxGFT4GEhn3Hd7tM47fP3mFl44XHXYkhkNuBVLtoLSt1UHjFnm9g9PL8fWmKUPsslBI6S6ZlphCLVn0rbbRkpzOlcaWygDTxuX+lzc7VUZY0q7jJeeoFTjNfc/PmteLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419559; c=relaxed/simple;
	bh=WuJs1L8beWP8qPqs8QhESGttVeHCU6eXpL36rcMevaQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VR7+u1p6qpMnK0JuC7wcKyx+YUoPSXaOnjG/LNK3+Tr0xXAxejBw+NUltO0obAB5Mhw9tqYxvsfxn3VjmL/KzBEbSzJpx5xpMp60JeZgdMyV0QFHAholo9nWr+Z+1Apv9+WoJP2a4MZmFpJTHdVDdiz+Wafq9BAZgeTpMfJNjYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INHNScAZ; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INHNScAZ"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86b9d9b02cbso2577733241.1
        for <llvm@lists.linux.dev>; Wed, 23 Apr 2025 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745419556; x=1746024356; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XVzS4DFXKFHCvPld98KfR1XMwmy5WtS3R3h/ahLL1ME=;
        b=INHNScAZhKWy+TEKh83crlt4MUKYlSAxtTWknqgNpFfs7uQDDSFfTMOvhT928qFhBA
         sweFnGkSesSGxrxzVTAcD9vJV6zvXq3ZAqyTrPUfeO9BwbwjufTAA3iFb3VaG0Isg976
         doAicXKpmGFRNwRVTmPmHU/K2yjP6/89DVSTFyoNltqxRykpo4U/LERTOtQvSOxbWxuJ
         HvpfmogT6i+BxK6Vvgh3Z8eG4HlxmV8xofZy0pHO4wn188xZJGTNQH+akCk3cQ8HSjTz
         WBCyGDTh9JolEK8MT9NWJBsrgIeLPmbz1vtjXdmsa6nl2w9g9fZ/HPc0uXuqTcNxItfh
         V6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745419556; x=1746024356;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVzS4DFXKFHCvPld98KfR1XMwmy5WtS3R3h/ahLL1ME=;
        b=ftWETkagT7kK77kQOHwA/hjSETjoq8v5T4mqbA641LmILbQdxLpHRXUoWrKC5lgiR0
         mdO/zmur/cfNZlJUgb7vCi8xywzLYj4yN2ez4a9QCbWg3TF9f9/Eowo3vbgL0mO4MuBP
         nT/dkhiE4eSR5bt5UGXgXmM3vBAWX+6bQMRyvnsbCLJo1aXGPBfpyp3c1t8bvoZeaa6Q
         SSYlahX71wZ3DAh2Ep5WWodeMU3QO/bJO0eXxpL1qGYsjEyv91/9LH1aq3ugqOolXh7/
         RUfHArTJyD5fPplkqLLy4gOc+/173qpmpMJjK/HvTBD5nlshL3H56Nj16jF7KYBucDFK
         zSmA==
X-Forwarded-Encrypted: i=1; AJvYcCWl8kiDmVMUPCG5oFJToSKspcCTpaExRQ1vwWxHZ8ruRZ842fxjVYUI7dojasz4XijoUlaN@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu8r+NwEJNkr0W8+cmZhNeOE/5Gb5UDn8gHO7cvr+v6bClTzfX
	WGaXxDIr7+JH8gvY6PCChGwoM+w4MYDDenszX9xNmzvmVL319ZjBS72zjckOG7FSIV5WYW1OCX2
	HlQeEcU1Tufh7lc87gWesYUUO3nUNsxFMcxobrQ==
X-Gm-Gg: ASbGncteTlq/tNQegqtAVm0ODO1gc1qoHc22vjarGmquAqjA9FQJ/SGmYsNK7PlymUw
	FY9OeIeaL5BllfrgWI+2JwzUtxGdMwaTMfPkbxsDEGI6Yz74/sSUWhaDwQ33YIZa0qaehkDNPGr
	dowuKH0/85jxXZcW/bVfXedl/KW7kV1VTe54tsj/P1GHW6cOQ2PfsWvVWG0CdwolFkyEE=
X-Google-Smtp-Source: AGHT+IERRJGw6BAbTzZ7eENF+DT2FWTrJnr1CWFNiPg11ivsYpv0iKhIOifBDRXvHHv1G8kwWKWca5Of8Ul4FmXDow8=
X-Received: by 2002:a05:6102:3195:b0:4bb:db41:3b6c with SMTP id
 ada2fe7eead31-4cb8012897dmr13504466137.12.1745419556210; Wed, 23 Apr 2025
 07:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 23 Apr 2025 20:15:45 +0530
X-Gm-Features: ATxdqUFKPsvKE8tS36jt8rkB_HWHxH1SfL5siJ13k1SJ6uSB3Mz80W-5YsuEDvs
Message-ID: <CA+G9fYtN2ie+YtK3H9mrQ5QqrSCFGGjVbtJcfiYX0oHMVWMn9w@mail.gmail.com>
Subject: next-20250422: arch/riscv/kernel/vdso/vdso.so.dbg: dynamic
 relocations are not supported
To: open list <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Nam Cao <namcao@linutronix.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on riscv tinyconfig and lkftconfig failed with clang-20
and gcc-13 on the Linux next-20250422 tag onwards.

The defconfig builds pass but tinyconfig and lkftconfig (compat and
VDSO) failed.

First seen on the next-20250422
 Good: next-20250417
 Bad:  next-20250422..next-20250423

Regressions found on riscv:
  - build/rv32-clang-20-tinyconfig
  - build/rv32-clang-20-tinyconfig
  - build/korg-clang-20-lkftconfig-hardening
  - build/gcc-13-lkftconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: riscv vdso.so.dbg dynamic relocations are not supported

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log riscv
build errors with gcc
arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
make[3]: *** [arch/riscv/kernel/vdso/Makefile:60:
arch/riscv/kernel/vdso/vdso.so.dbg] Error 1

build errors with clang
ld.lld: error: version script assignment of 'LINUX_4.15' to symbol
'__vdso_getrandom' failed: symbol not defined
llvm-nm: error: arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg: No
such file or directory
ld.lld: error: version script assignment of 'LINUX_4.15' to symbol
'__vdso_getrandom' failed: symbol not defined
llvm-objcopy: error:
'arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg': No such file or
directory
arch/riscv/kernel/compat_signal.c:220:28: error: use of undeclared
identifier 'compat__vdso_rt_sigreturn_offset'
  220 |         regs->ra = (unsigned long)COMPAT_VDSO_SYMBOL(
      |                                   ^
arch/riscv/include/asm/vdso.h:29:42: note: expanded from macro
'COMPAT_VDSO_SYMBOL'
   29 |         (void __user *)((unsigned long)(base) +
compat__vdso_##name##_offset)
      |                                                 ^
<scratch space>:317:1: note: expanded from here
  317 | compat__vdso_rt_sigreturn_offset
      | ^
1 error generated.


## Source
* Kernel version: 6.15.0-rc3
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
* Git describe: next-20250422
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250422/
* Architectures: riscv
* Toolchains: clang-20, gcc-13
* Kconfigs: lkftconfig

## Build riscv
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250422/testrun/28190346/suite/build/test/gcc-13-lkftconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250422/testrun/28190346/suite/build/test/gcc-13-lkftconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250422/testrun/28190346/suite/build/test/gcc-13-lkftconfig/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2w5Fmeq3a09b3torxIis2kurhBY/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2w5Fmeq3a09b3torxIis2kurhBY/config

## Steps to reproduce on riscv
 - tuxmake --runtime podman --target-arch riscv --toolchain clang-20
--kconfig tinyconfig --kconfig-add rv32_defconfig LLVM=1
 - tuxmake --runtime podman --target-arch riscv --toolchain gcc-13
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2w5Fmeq3a09b3torxIis2kurhBY/config

--
Linaro LKFT
https://lkft.linaro.org
