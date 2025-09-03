Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07412E8B8A
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 09:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756892501; cv=none; b=P9v5qa5NgSDpTThSc9GrVtQW/XlFb7gaWoimNprC7nuiAoE8jyOfZq7IMSZvBn7VwieJU5BL4Tb6qIHOerozkcIdpy9jAHyIUNlAlYKzN0ZiZwbuTLfvTg95IIwpnr4L3ZXXN145eOGEDcv4cLZUSyjjeK297ATJN2HSB1JG6Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756892501; c=relaxed/simple;
	bh=X5qyQf22DbH1IYod+3PsYB3pEsfk4pvQaKk6qYflNiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ky6oTFuwt8VPI6w6vAbs2aTxkNm2AQ64Q54Dl28NpyJILDt+bmSfIv+TtgNmEnZRh8chW3iJ1UZorrckMf9Sbb1xbPQoOwhlHfy4PzAChAkuRtBWVcanRiUUIbh5158J4owWe5b0ZmKG1qUv3YNOmcUOeoSc3s8hijaWPefbebE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WuFzrq9h; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WuFzrq9h"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-248a638dbbeso55865965ad.2
        for <llvm@lists.linux.dev>; Wed, 03 Sep 2025 02:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756892499; x=1757497299; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UoMKbHlNGmTXnkCs4iUjjPCof1fgD5XFokjCFBKuEr4=;
        b=WuFzrq9hxM3zfVbLwwqqErw22qBlYXlT1HY51sWn1QT4if6/T95zb4v4o8IFFNfqwo
         OoQc1fztx74txke9TRhwUDxb0ns3jGlE+aM6derswgM4Qc6v9YEg2AVqBrRm/LE4QytE
         5T9/LPQUWaspz9BFnQ2IeBrE598doa56O7UDvEOSClrlW18KjmLMLVz2p0QcXbrSr3+G
         bO6w7lB3rdWIelZ5RyjgSIN9mbZULqBKdckmpkwTShRcYyycb1JKkF9eAMI6kKBK4DNN
         qEpjpZ0WzyOexKCW2sOTvChwMe7YwcT5pdH35JQmqo4IDink+Gz4c4OkeUo77SUnqPFh
         MuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756892499; x=1757497299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoMKbHlNGmTXnkCs4iUjjPCof1fgD5XFokjCFBKuEr4=;
        b=sfMDdEUl7U87OzbDQhqIbM4QUscQCdkdGFbdr911zTeewqE/WAuKOl4XKUMOjmgl4w
         L2CZPpcqeNyRZOC4T1syZ003Pvb09vJXtbpiN5AKPcterHC/iVwfXxerw+ZkWa95XIVa
         NtgPtfRxKWkhYkXRhcvL8p+VQEUsdKeu4bTxQS2DOy97ghs2hvS5QUjG5Rq4EGoW01BZ
         z+0EaqA4wCXcRlW/vmUl32VDkWgaw++bLF+DjxR8BuLoivdoFTBI0hNGtQ5HqyTnNWGu
         glRJuqGC7GJJChlevHzBXquRx1BCLMydn+Q1VN/CA2ndS6qUUyP5c0fKS0QU42p27h5z
         lBcA==
X-Forwarded-Encrypted: i=1; AJvYcCVz0swlj178BV/wzdWhf98IfPuJlbWSoK0ej2R5JGuizJjekiAnNP5plmcwHY5hLZviVuM+@lists.linux.dev
X-Gm-Message-State: AOJu0YxRPKAZJlZa2TXPFbA2JvD49/spW7uTQRLPyYasiIFOB6oJ4yNN
	VSntMPxbRiL/en6RASqKaY8loPw50Cl1bReOWbVds0TKEid94N7olvIw4TgXewbhxZ0her+QrX9
	f2lsuLhIGwSOmINMvSS5HTfmw8CoWslld0S2mI1hYlw==
X-Gm-Gg: ASbGncsXQEQCGyX4mRIgUEY+sEuthbXtUQV6ZTI3612z8da3o2BPQ/O+BNegge5a3ec
	CU/kskMKzfVTKMLr/Y1vxUQImOGMRBgawlUh92EjbxCdRUlDfw5AAhlUGmOL0g1hv6bHMlC1PZx
	eW9nSUGoFVOoebITcUzOfhoKWPc4RHAmKt4StkiCrc0595t8PNUtuAXuYf3tXcTfA+mDZ6beMTu
	2pxafjrTxh21ZliwCZ9AOd0I3++uBuFoLb4mStDGjRcrVW4IfM=
X-Google-Smtp-Source: AGHT+IFNtimxcRyY/PfCxn/AsH/+0KLjvu7CF4KnB+v7iOQeJU0cUYnhzwPd/MarBMyTmB7aKOrGR3tKLghdyPhBNEw=
X-Received: by 2002:a17:902:dacc:b0:246:2e9:daa4 with SMTP id
 d9443c01a7336-2494486ec54mr168081805ad.6.1756892498999; Wed, 03 Sep 2025
 02:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902131924.720400762@linuxfoundation.org>
In-Reply-To: <20250902131924.720400762@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 3 Sep 2025 15:11:26 +0530
X-Gm-Features: Ac12FXzErOtFUn8jcmcJByfeaKsz65msV8WaepA4390E28mrBrhvxK7ANHNvAFA
Message-ID: <CA+G9fYtoKARW00i0ct=M+-1OAWoQhE_rvsS6RJPPQ7YEcZ4C1w@mail.gmail.com>
Subject: Re: [PATCH 5.4 00/23] 5.4.298-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, achill@achill.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	clang-built-linux <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Sept 2025 at 19:17, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.4.298 release.
> There are 23 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 04 Sep 2025 13:19:14 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.298-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


The following build warnings / errors were noticed on powerpc cell_defconfig
and mpc83xx_defconfig with clang-20 toolchain on stable-rc 5.4.298-rc1.

But the gcc-12 build passed.

* powerpc, build
  - clang-20-cell_defconfig
  - clang-20-mpc83xx_defconfig
  - clang-nightly-cell_defconfig
  - clang-nightly-mpc83xx_defconfig

Regression Analysis:
- New regression? yes
- Reproducibility? yes

First seen on 5.4.298-rc1
Bad: 5.4.298-rc1
Good: v5.4.297

Build regression: stable-rc 5.4.298-rc1 powerpc/boot/util.S:44: Error:
junk at end of line, first unrecognized character is `0'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


Build error:
--------
arch/powerpc/boot/main.c:107:18: warning: array comparison always
evaluates to a constant [-Wtautological-compare]
  107 |         if (_initrd_end > _initrd_start) {
      |                         ^
1 warning generated.
/arch/powerpc/boot/util.S: Assembler messages:
/arch/powerpc/boot/util.S:44: Error: junk at end of line, first
unrecognized character is `0'
/arch/powerpc/boot/util.S:49: Error: syntax error; found `b', expected `,'
/arch/powerpc/boot/util.S:49: Error: junk at end of line: `b'
clang: error: assembler command failed with exit code 1 (use -v to see
invocation)

Links:
 - https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.4.y/v5.4.297-24-g79c1b3cebd7a/log-parser-build-clang/clang-compiler-single-line-clang-error-assembler-command-failed-with-exit-code-use-v-to-see-invocation/
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/329ANlwlmsEF0DVWfAhYuSJx9Vp
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/329ANlwlmsEF0DVWfAhYuSJx9Vp/

## Build
* kernel: 5.4.298-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: 79c1b3cebd7a938fa4288b4e4e63a4265bd570a4
* git describe: v5.4.297-24-g79c1b3cebd7a
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.4.y/build/v5.4.297-24-g79c1b3cebd7a

## Test Regressions (compared to v5.4.296-404-ga860ce417cb1)

* powerpc, build
  - clang-20-cell_defconfig
  - clang-20-mpc83xx_defconfig
  - clang-nightly-cell_defconfig
  - clang-nightly-mpc83xx_defconfig

## Metric Regressions (compared to v5.4.296-404-ga860ce417cb1)

## Test Fixes (compared to v5.4.296-404-ga860ce417cb1)

## Metric Fixes (compared to v5.4.296-404-ga860ce417cb1)

## Test result summary
total: 39592, pass: 30278, fail: 2135, skip: 7024, xfail: 155

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 131 total, 131 passed, 0 failed
* arm64: 31 total, 29 passed, 2 failed
* i386: 18 total, 13 passed, 5 failed
* mips: 25 total, 25 passed, 0 failed
* parisc: 3 total, 0 passed, 3 failed
* powerpc: 26 total, 22 passed, 4 failed
* riscv: 9 total, 3 passed, 6 failed
* s390: 6 total, 6 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 6 total, 6 passed, 0 failed
* x86_64: 27 total, 27 passed, 0 failed

## Test suites summary
* boot
* kselftest-arm64
* kselftest-breakpoints
* kselftest-capabilities
* kselftest-clone3
* kselftest-core
* kselftest-cpu-hotplug
* kselftest-exec
* kselftest-fpu
* kselftest-futex
* kselftest-intel_pstate
* kselftest-kcmp
* kselftest-membarrier
* kselftest-mincore
* kselftest-mqueue
* kselftest-openat2
* kselftest-ptrace
* kselftest-rseq
* kselftest-rtc
* kselftest-sigaltstack
* kselftest-size
* kselftest-timers
* kselftest-tmpfs
* kselftest-tpm2
* kselftest-user_events
* kselftest-vDSO
* kselftest-x86
* kunit
* lava
* libhugetlbfs
* log-parser-boot
* log-parser-build-clang
* log-parser-build-gcc
* log-parser-test
* ltp-capability
* ltp-commands
* ltp-containers
* ltp-controllers
* ltp-cpuhotplug
* ltp-crypto
* ltp-cve
* ltp-dio
* ltp-fcntl-locktests
* ltp-fs
* ltp-fs_bind
* ltp-fs_perms_simple
* ltp-hugetlb
* ltp-math
* ltp-mm
* ltp-nptl
* ltp-pty
* ltp-sched
* ltp-smoke
* ltp-syscalls
* ltp-tracing
* perf
* rcutorture

--
Linaro LKFT
https://lkft.linaro.org
