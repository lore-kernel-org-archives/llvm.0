Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6E9173
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 18:27:33 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id v64so9211779ybi.5
        for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 10:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=QJClJoOTl1ARv5tnKdMN0rMx96zafbI3qCWhIbJDc30=;
        b=w0ugai6Dn8XOEPvRxQYilxGR3zY2XfFm7+jDms/cPqf3izF+PROHQ14QCZ3O7BlD83
         wMjIX0eulhNbDoaezo3ZgHhCMa1XPQRpoAbZHbQYdCkQnqV6NP7mpb1g4vkMDKuzQENL
         mXZk8jJTeU/6ZkhgybkB1BrChMNxQzdiDftU7UuMj/nepmUe9//FO2xhS+Bb7GseViJv
         8uxM65XNXoB9J8kIhPUQYqQffsyRaLs6TnIDoGeskiGJ++fTtaUPqS0MQloANgPgRCxW
         PQASh94wj7TX/Sz5yqZ3TmY9LA2i8MqA4bguI0aFUcjWxdU+sp/TCBFiuITh8U5dksjE
         F3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=QJClJoOTl1ARv5tnKdMN0rMx96zafbI3qCWhIbJDc30=;
        b=j6Yx2EiYxo4UlZVqV5U55J8g59wFDskxuZ4HU6XKRbDeRW6qlHUR4/hYnCDpJ6b2ro
         EyZjsRH4SQrya8zZkbynjVhJ1hMMeqIM9mQmIWrhOPKqdYOoKMTq9qemwct0STPgHMUe
         doo4r8KkL6FbSxbod4GbooyVLMf6YwjAtoJs7rETvkiJFYfdBnGiYrnuSHrbaA42Kpqk
         abYXjuC8Jfa3zNpbrL0U5I0yUmfnrtPrTNL7T9+ITcort2yaUWNThmYgboRndJtUykS4
         5T15Gc4glb/pG9PGpsE/Z8yOyrvspDiZ107qcFUqVE8xRqa+rrkvu01npVba9uHvVgts
         VEvQ==
X-Gm-Message-State: AOAM533Ubz8vq0ZEoPQjo2VmZF2TGoaXVAjjA5BjwFs34iruUcrJw+c8
	E2gnIOrRPwBLppRERhgUnEFkgWdBP970n4eBd4OXWEg3lM3zFQ==
X-Google-Smtp-Source: ABdhPJwYGC9HHg23pilOsMA2c3TNq8h63uaodL6Mek/QLEVhBnePq19ow/BNUMK7ibcrZBIpI33mOf9azEORPMhN4zQ=
X-Received: by 2002:a25:d68e:: with SMTP id n136mr6521994ybg.520.1640197651952;
 Wed, 22 Dec 2021 10:27:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 22 Dec 2021 23:57:20 +0530
Message-ID: <CA+G9fYuz1Bfkfga7xVPVdTLETBQK3=4UsXq15kZW8C85DhyXJQ@mail.gmail.com>
Subject: [next] arm: current.h:53:6: error: out of range pc-relative fixup value
To: llvm@lists.linux.dev, open list <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Nicolas Pitre <nico@fluxnic.net>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

[ Please ignore this email if it is already reported ]

On Linux next 20211220 (and  20211222) tag following arm config builds failed
with clang-11, clang-12, clang-13 and clang-nightly.

Build errors:
-------------
In file included from /builds/linux/kernel/sched/core.c:10:
In file included from /builds/linux/include/trace/events/sched.h:8:
In file included from /builds/linux/include/linux/kthread.h:6:
In file included from /builds/linux/include/linux/sched.h:12:
/builds/linux/arch/arm/include/asm/current.h:53:6: error: out of range
pc-relative fixup value
        asm(LOAD_SYM_ARMV6(%0, __current) : "=r"(cur));
            ^
/builds/linux/arch/arm/include/asm/insn.h:25:2: note: expanded from
macro 'LOAD_SYM_ARMV6'
        "       ldr     " #reg ", =" #sym "                     \n\t"   \
        ^
<inline asm>:1:3: note: instantiated into assembly here
                ldr     r2, =__current
                ^

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


meta data:
-----------
    git describe: next-20211220 to next-20211222
    git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
    git_sha: 2bd48302750c652889a2604b3df8b591c1d3af08
    git_short_log: 2bd48302750c (\"Add linux-next specific files for 20211222\")
    target_arch: arm
    toolchain: clang-11, clang-12, clang-13 and clang-nightly

Build log:
https://builds.tuxbuild.com/22doqqkr5uM1RUG67iJevPNL9nQ/

Regressions found on arm:

  -  clang-11-vexpress_defconfig
  -  clang-11-shmobile_defconfig
  -  clang-13-at91_dt_defconfig
  -  clang-13-lpc32xx_defconfig
  -  clang-11-omap2plus_defconfig
  -  clang-12-allnoconfig
  -  clang-13-imx_v6_v7_defconfig
  -  clang-11-mini2440_defconfig
  -  clang-13-imx_v4_v5_defconfig
  -  clang-12-multi_v5_defconfig
  -  clang-13-mxs_defconfig
  -  clang-13-ixp4xx_defconfig
  -  clang-11-lpc32xx_defconfig
  -  clang-nightly-s3c6400_defconfig
  -  clang-13-nhk8815_defconfig
  -  clang-12-imx_v6_v7_defconfig
  -  clang-11-nhk8815_defconfig
  -  clang-12-ixp4xx_defconfig
  -  clang-13-footbridge_defconfig
  -  clang-11-tinyconfig
  -  clang-11-axm55xx_defconfig
  -  clang-12-bcm2835_defconfig
  -  clang-12-davinci_all_defconfig
  -  clang-12-omap2plus_defconfig
  -  clang-11-at91_dt_defconfig
  -  clang-11-multi_v5_defconfig
  -  clang-11-s3c2410_defconfig
  -  clang-11-footbridge_defconfig
  -  clang-12-s3c2410_defconfig
  -  clang-12-mxs_defconfig
  -  clang-12-omap1_defconfig
  -  clang-11-defconfig
  -  clang-11-omap1_defconfig
  -  clang-13-orion5x_defconfig
  -  clang-12-orion5x_defconfig
  -  clang-11-davinci_all_defconfig
  -  clang-12-lpc32xx_defconfig
  -  clang-11-ixp4xx_defconfig
  -  clang-12-mini2440_defconfig
  -  clang-11-u8500_defconfig
  -  clang-11-integrator_defconfig
  -  clang-13-davinci_all_defconfig
  -  clang-11-mxs_defconfig
  -  clang-11-orion5x_defconfig
  -  clang-12-tinyconfig
  -  clang-12-footbridge_defconfig
  -  clang-11-imx_v4_v5_defconfig
  -  clang-13-s3c2410_defconfig
  -  clang-nightly-bcm2835_defconfig
  -  clang-11-allnoconfig
  -  clang-11-exynos_defconfig
  -  clang-11-keystone_defconfig
  -  clang-13-mini2440_defconfig
  -  clang-13-integrator_defconfig
  -  clang-12-imx_v4_v5_defconfig
  -  clang-13-multi_v5_defconfig
  -  clang-13-omap1_defconfig
  -  clang-11-bcm2835_defconfig
  -  clang-11-imx_v6_v7_defconfig
  -  clang-12-at91_dt_defconfig
  -  clang-12-integrator_defconfig
  -  clang-12-nhk8815_defconfig

steps to reproduce:
-------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch arm --toolchain clang-11
--kconfig at91_dt_defconfig LLVM=1 LLVM_IAS=1


tuxmake --runtime podman --target-arch arm --toolchain clang-11
--kconfig https://builds.tuxbuild.com/22doqqkr5uM1RUG67iJevPNL9nQ/config
LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
