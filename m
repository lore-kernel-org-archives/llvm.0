Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB659221F13
	for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 19:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765914785; cv=none; b=Y1AfVJ54lo4nxtcmays/XN1/x7itvxo1n+2TOmsf3w893vRdHSGOuYcc/tpYBfLQsPcYOIHKHJzUd6tLZYI09IaVpDNTB8bxRhnZ3QQ6/U9wUuMNuKXjzQsgiU5r7sB7fZid9PUmfzIho2RGAjLF0tQrbPzW2BLMNrRz67EdfFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765914785; c=relaxed/simple;
	bh=iyfpfta9T3ygezPPDfJaAAlV1FmCLLJlERf9Bqj3wl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmghW5gpXOrJiQWOojxBGxOSSUROG+XLrWMwrSFYuM6yEVLWdXM4pdnLA1cELK7pKmcC8D2Vb4Yu7H8P/owUiGMleJCiQloQZzoC+6B4O2cr2I0V66osKmOyllBUx9NE2NeWd46w/Qf0QZABnErJ7VnIKzabON0Lob8jZBZzbwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=My25HNut; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="My25HNut"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a0d0788adaso27212565ad.3
        for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 11:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765914782; x=1766519582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMv6aJNeWeKxyQePqdx7Y+0/5WaZPbWRmp5WC5tFCto=;
        b=My25HNutXF0fE7SoPVquJ+5XxUFp36d/anOH0kCRShZWUrnFsbkj2sVBT2W2sifhVb
         UKDvJiwTgRKteVHhl/s3lfS2DfiUpb+96Q6G05fl5BFnQzCkpWwkic37p3fq8xe1zQuG
         mL8c0uI3ILAwYgG5H/5x8VkKguqdgO8k37wSR1jbHx+60e+wN5Oq7MP1WjpCHtcALeRy
         OBaG2188EBPpY/p58HVbw1EjZRa++mKDWn8Sqf5oseE+w2f8n+WPefILvlemWWQIyfDi
         X81Ny6/GUE+AzB16c5d7WUWM3V/2amqPh6ZG1SdEhLI7Oqenr2LvIVCNJ6U5K2ftmS61
         W/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765914782; x=1766519582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pMv6aJNeWeKxyQePqdx7Y+0/5WaZPbWRmp5WC5tFCto=;
        b=XXF4YhzGCt7Dfh1CYbmWXdY0DPnX2Fl64aoQLdZ2MTT3Z2I0r3cKvEwSepB0Mkf3nn
         Yxm++YRdDEwbE1256j5vM8bAZBkHPpQ3YwV3+m/kF2jtRSveSvm4P2iTjV4DSXZKHY2m
         2xnOGjd2I7f6ob0D4vr4g7ryENf9P07BhzISdbTZHMpzraDP/5HbYK1lwXsM3z7VdHcD
         FnB5LdCFMqtwm7fms8fqNXsq87zEz3cwI/Jef423YgBNwj9g6sEUCBCkdF0fWsefnCSq
         tlDPKP02aQrK0U0UyxDM1zyQntrw22F4b4SnOvShiSdl56He4hUao6HMFd7Dtq82mU+o
         JkPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHfk+vHeHHm5jshI2hu517mtrp2Wx2kCtrTVkmIKPhlP/orLmYyGeX+lby93n1wvu2EiYK@lists.linux.dev
X-Gm-Message-State: AOJu0YzaRiZKFHbKv2FjCyeDiXHyixT9MR4GamDhjnqv3Eu6iiXAAi9N
	NdYWodj/JsVexE9bJ7it6QXyT3kZrofvq0QGfmVcpBAxEHc1YAGm6KizKSULnsbuI80=
X-Gm-Gg: AY/fxX7e3tlMnaQERK+yErvbk2w6oS2dFXDmgTTtpYkA8QrePT7yClk2aiHk30OCsYL
	ApIwH7JIN6UhAh/3nP+flCvFnyyL5V+6+gmYXtgrhG7rVxE4ZPkezSQm9PzXFQVcCLljznB5ofP
	JWBu0qxQPSR957Djykusb7yKeZBNXc3X+7oL7wQC7Zf+OiNNemin6VtD/+lllB4MaFjgk/SMaBm
	axgSvXgS3F3GDxerNI9n6+9ShhCpARZwx3cSzQwotoYxiIzxxmFOXsfwVLFK9yB0ejjrYUUO8Ra
	rY5BI2q4wH6C1+cTCITmWIYN41j1u+r+LsU2QDGYp73VsQefBBB85CyMKgcmG/RoMXqbRnxKOrd
	SxAJUsahVNjWr1wMd/9H85YVqb1KCLiGUX3pSAl1eBsi8++84XGWLBj1Mso06sdRkJB6itAytki
	u3Xa0jmQ2nOUfg5dprhdvEEI/QI+Gh
X-Google-Smtp-Source: AGHT+IFa53l16N+qvvGO5QmppAyhTeWx1VKPEgvjQDDUEOhJfhKgosxMkNqOmyEm3dPYC+8Wd+jHsQ==
X-Received: by 2002:a17:903:8cc:b0:297:f0a8:e84c with SMTP id d9443c01a7336-29f24386514mr158443655ad.52.1765914782008;
        Tue, 16 Dec 2025 11:53:02 -0800 (PST)
Received: from localhost ([2405:201:c00c:2854:178f:356c:b77b:cfc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a13825b9a5sm33850025ad.9.2025.12.16.11.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 11:53:01 -0800 (PST)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: gregkh@linuxfoundation.org
Cc: achill@achill.org,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	conor@kernel.org,
	f.fainelli@gmail.com,
	hargar@microsoft.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	lkft-triage@lists.linaro.org,
	patches@kernelci.org,
	patches@lists.linux.dev,
	pavel@denx.de,
	rwarsow@gmx.de,
	shuah@kernel.org,
	sr@sladewatkins.com,
	stable@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	torvalds@linux-foundation.org,
	dan.carpenter@linaro.org,
	nathan@kernel.org,
	llvm@lists.linux.dev,
	perex@perex.cz,
	lgirdwood@gmail.com,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH 6.18 000/614] 6.18.2-rc1 review
Date: Wed, 17 Dec 2025 01:22:55 +0530
Message-ID: <20251216195255.172999-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216111401.280873349@linuxfoundation.org>
References: <20251216111401.280873349@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm seeing the following allmodconfig and allyesconfig build
failures on arm, arm64, riscv and x86_64.

## Build error
sound/soc/codecs/nau8325.c:430:13: error: variable 'n2_max' is uninitialized when used here [-Werror,-Wuninitialized]
  430 |                 *n2_sel = n2_max;
      |                           ^~~~~~
sound/soc/codecs/nau8325.c:389:52: note: initialize the variable 'n2_max' to silence this warning
  389 |         int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
      |                                                           ^
      |                                                            = 0
sound/soc/codecs/nau8325.c:431:11: error: variable 'ratio_sel' is uninitialized when used here [-Werror,-Wuninitialized]
  431 |                 ratio = ratio_sel;
      |                         ^~~~~~~~~
sound/soc/codecs/nau8325.c:389:44: note: initialize the variable 'ratio_sel' to silence this warning
  389 |         int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
      |                                                   ^
      |                                                    = 0
2 errors generated.
make[6]: *** [scripts/Makefile.build:287: sound/soc/codecs/nau8325.o] Error 1

First seen on 6.18.2-rc1
Good: 6.18.1-rc1
Bad:  6.18.2-rc1

And these build regressions also seen on 6.17.13-rc2.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 6.18.2-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: 103c79e44ce7c81882928abab98b96517a8bce88
* git describe: v6.18-645-g103c79e44ce7
* test details: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.18.y/build/v6.18-645-g103c79e44ce7

## Test Regressions (compared to v6.18-30-g7d4c06f4000f)
* Build,
- clang-21-allmodconfig
- clang-21-allyesconfig
- clang-nightly-allyesconfig

## Metric Regressions (compared to v6.18-30-g7d4c06f4000f)

## Test Fixes (compared to v6.18-30-g7d4c06f4000f)

## Metric Fixes (compared to v6.18-30-g7d4c06f4000f)

## Test result summary
total: 101371, pass: 83553, fail: 3486, skip: 14332, xfail: 0

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 139 total, 138 passed, 1 failed
* arm64: 57 total, 51 passed, 6 failed
* i386: 18 total, 18 passed, 0 failed
* mips: 34 total, 33 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 40 total, 39 passed, 1 failed
* riscv: 25 total, 24 passed, 1 failed
* s390: 22 total, 21 passed, 1 failed
* sh: 5 total, 5 passed, 0 failed
* sparc: 4 total, 3 passed, 1 failed
* x86_64: 49 total, 46 passed, 3 failed

## Test suites summary
* boot
* commands
* kselftest-arm64
* kselftest-breakpoints
* kselftest-capabilities
* kselftest-cgroup
* kselftest-clone3
* kselftest-core
* kselftest-cpu-hotplug
* kselftest-cpufreq
* kselftest-efivarfs
* kselftest-exec
* kselftest-fpu
* kselftest-ftrace
* kselftest-futex
* kselftest-gpio
* kselftest-intel_pstate
* kselftest-ipc
* kselftest-kcmp
* kselftest-kvm
* kselftest-membarrier
* kselftest-memfd
* kselftest-mincore
* kselftest-mm
* kselftest-mqueue
* kselftest-net
* kselftest-net-mptcp
* kselftest-openat2
* kselftest-ptrace
* kselftest-rseq
* kselftest-rtc
* kselftest-rust
* kselftest-seccomp
* kselftest-sigaltstack
* kselftest-size
* kselftest-tc-testing
* kselftest-timers
* kselftest-tmpfs
* kselftest-tpm2
* kselftest-user_events
* kselftest-vDSO
* kselftest-x86
* kunit
* kvm-unit-tests
* lava
* libgpiod
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
* rt-tests-cyclicdeadline
* rt-tests-pi-stress
* rt-tests-pmqtest
* rt-tests-rt-migrate-test
* rt-tests-signaltest

--
Linaro LKFT
https://lkft.linaro.org
