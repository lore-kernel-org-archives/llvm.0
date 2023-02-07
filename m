Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BE3BD32
	for <llvm@lists.linux.dev>; Tue,  7 Feb 2023 07:57:19 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id m2so40996249ejb.8
        for <llvm@lists.linux.dev>; Mon, 06 Feb 2023 23:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hjsB+AGSljRnQpA+58k97XCvwuzQDyJ3UN6KNCrj/C4=;
        b=pN1+ghys/kOt1G6oDLNcsqOKPC0GBRpCTvNgXY4pyab/kLCRMENic/vyj0vzi6c4/8
         EoK+/lRrHx8BJz0JTLDrb9Dz+QA3DoX++R1OGxa8vGW7ACwFZa32OhCovDBYjfzoazTe
         NXsZHaS5Ax+Q1VrttS0Zth3l3wfCRshuKzh8I6SOVmJvPR7qCWXfuN7DwSJQ6zdJL76W
         kINDEA6JlaqlX8mYnrWqgkwZGlv+GY8XnvALqebRPKdzzDWeQaFm4WLOO5W0DoW01fop
         PSaXOfVrbeXomDPbvO52xD6979y7rAagSmhzJQWmFpk8/Drjov4kOqJ+YAAtCpizkXUr
         voIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjsB+AGSljRnQpA+58k97XCvwuzQDyJ3UN6KNCrj/C4=;
        b=Y7ZhNXZ0j3b2cd0omYoBBPL7orzx/lFVtqjvdJfQ7QNfVMUciEbpKyESDfvYsxGy5R
         mhOWOQAyUPgBwsKlICSmFOmmo2u4iaEKf9p6bc4NN47d697LnYsR8Eqy+ReQ+jYxp2lw
         LVQNULCcq1xi9jTOBPfdDlzSZLGjyJRZemwvDRNGJN3WuXEGADo1X0vUpgGdsXr2fdCy
         pG7PurC+jMcTyRqGVqTojI+shTNqK1YkAdnd8J2SKzgogeGcJRTbgcuDjvyFQWbpDF+y
         b/4plxC2sis1Ac3vC6ufiiAEqj0ySmbPQY+LDmw/uaAviTFeA4ftNvCyD0sXSN9967+T
         Iw1A==
X-Gm-Message-State: AO0yUKUjvADjzY85o90c3cJRJ4TPu74uxkP8xTuPjRm2CwoVM6V7TqmY
	TGC3eGVe3/xrl2Ar1gXVM6MnQNIqyPe+PVSPrqcz4iw0+poep1Fv
X-Google-Smtp-Source: AK7set9V3pgczMpgtevwU7e3NotwVmoDa6/EjWoWewDNkfPAzcq1B9PF5l3vDjS6m4TKEpRPyMZk5erMRliHmTK98EQ=
X-Received: by 2002:a17:906:38c2:b0:88c:f92e:a13e with SMTP id
 r2-20020a17090638c200b0088cf92ea13emr593049ejd.172.1675756637037; Mon, 06 Feb
 2023 23:57:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 7 Feb 2023 13:27:05 +0530
Message-ID: <CA+G9fYuSWodh1teau4jGG_P15yT-ev1+bS7HAAmMu5D5J-d2vw@mail.gmail.com>
Subject: x86/include/asm/arch_hweight.h:49:15: error: invalid input size for
 constraint 'D'
To: llvm@lists.linux.dev, open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org
Cc: borislav.petkov@amd.com, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Following Build regressions warnings / errors noticed on Linux next-20230207.

Regressions found on x86_64:

    - build/clang-15-lkftconfig-compat
    - build/clang-nightly-lkftconfig
    - build/clang-15-lkftconfig
    - build/clang-15-lkftconfig-kcsan
    - build/clang-lkftconfig

In file included from arch/x86/entry/vdso/vdso32/vgetcpu.c:2:
In file included from arch/x86/entry/vdso/vdso32/../vgetcpu.c:8:
In file included from include/linux/kernel.h:22:
In file included from include/linux/bitops.h:68:
In file included from arch/x86/include/asm/bitops.h:420:
arch/x86/include/asm/arch_hweight.h:49:15: error: invalid input size
for constraint 'D'
                         : REG_IN (w));
                                   ^
In file included from arch/x86/entry/vdso/vdso32/vgetcpu.c:2:
In file included from arch/x86/entry/vdso/vdso32/../vgetcpu.c:8:
In file included from include/linux/kernel.h:25:
In file included from include/linux/math.h:6:
arch/x86/include/asm/div64.h:85:34: error: invalid output size for
constraint '=a'
        asm ("mulq %2; divq %3" : "=a" (q)
                                        ^
2 errors generated.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Following config diff found.
 + CONFIG_COMPAT_WARN_32BIT_FILESYSTEM_ACCESS=y

Build details link,
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230207/testrun/14611359/suite/build/test/clang-lkftconfig/details/

# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
tuxmake \
 --runtime podman \
 --target-arch x86_64 \
 --toolchain clang-15 \
 --kconfig defconfig \
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft.config
\
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft-crypto.config
\
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/distro-overrides.config
\
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/systemd.config
\
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/virtio.config
\
 --kconfig-add CONFIG_IGB=y \
 --kconfig-add CONFIG_UNWINDER_FRAME_POINTER=y LLVM=1 LLVM_IAS=1


--
Linaro LKFT
https://lkft.linaro.org
