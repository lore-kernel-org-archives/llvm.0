Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7982B3FC0
	for <llvm@lists.linux.dev>; Mon, 20 Sep 2021 03:25:59 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id h17so55623160edj.6
        for <llvm@lists.linux.dev>; Sun, 19 Sep 2021 20:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=UyH5g5gkFhjfVaHvBZg29/bQ5+iZMioda5dgko5wWww=;
        b=ABbKko9j85x/YUs90ogi9RG63IqPMr8E+uMYqkFJ+13BuBWvIswedX7TV9bIXF6u9w
         OugSTSE8hxhXSlbEkTwG0BCKPnCmxfWEnVPq4zLBTJC8Dg7Oq2OG2XGWd/pnGDRCEeuS
         CBTpuoFFJm7qIlDQSPp5rwByYnpWMQeA/0fegw/2cAW8/p+vapn9fTE5mT8+g4OCsNDG
         gM41/9KSUQ+rcFG/OHRYfUzo/fc9+3uSgPi2XJnox2OI69M1Cylozniq7EoGSbRnJJOd
         cG0jyj6hTRuGwKfqEn0JgS75zUJY2lL/hQXYZ7AvQbLjRO7LKxwatWyUySc0lcbPez9c
         KMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=UyH5g5gkFhjfVaHvBZg29/bQ5+iZMioda5dgko5wWww=;
        b=RwTJOhusn6m0cUuuSSZxPl+J8Qd8cajq6zm5PfDDbD23TrrxJVCFM4AbxVYTdkDITT
         X+c/C4VpiMZbPN1AA1wFQUseHXbaZ+DfFUxf8vYb5osPqcvOmbx8HVl/a2Lh03QQ4VY9
         ws8R9SCapC+eRRt0OafgLqSMv6pvY0ZqEMkEcR/gbbHcGEPrGERBfFevgj1hCvQWi2K0
         OiXINb8iOL3z0A+FdnOwhCpIQw8RTQ5OY8t9E/B20GEDGuAET7q0dg89qiZMtCveVZdl
         HEOtAzA7dcy2nc9JhlVHT55EvWyTC9Siuv12+FpTZ8LTbyhUhnJAkYyhwKvjkjTCuOA4
         XmbA==
X-Gm-Message-State: AOAM532jo0Gq8zMWkvpfezvG7yFUsQfBDVab/o5+HRQullzuHX/4hPrf
	2SjcGDRgE+4yZe+uIJMsx3R98VVmBgYsww8qbUeOcw==
X-Google-Smtp-Source: ABdhPJyV03HiHdna6mVQxB3htHHWLBXXOZpWYcO4xTiGH+mgCEtdbNzQbvv7/VYXRDIejFDY+MK5FsiwgHkVW/qzTI0=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr25835157ejc.69.1632108357657;
 Sun, 19 Sep 2021 20:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 20 Sep 2021 08:55:46 +0530
Message-ID: <CA+G9fYvoyDqbCnmcVMHCO3Zxn9=FGTjyTH9u=7FT7rCz-dh6JA@mail.gmail.com>
Subject: x86_64: clang-10: <instantiation>:2:2: error: unknown use of
 instruction mnemonic without a size suffix
To: clang-built-linux <clang-built-linux@googlegroups.com>, llvm@lists.linux.dev, 
	open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

[Please ignore this email if it is already reported ]

Following build warnings/ errors noticed while building linux mainline
master branch
with clang-10 for x86_64 architecture.
But clang-11, clang-12 and clang-13 build pass.

<instantiation>:2:2: error: unknown use of instruction mnemonic
without a size suffix
 lsl %rax, %rax
 ^
<instantiation>:1:1: note: while in macro instantiation
LOAD_CPU_AND_NODE_SEG_LIMIT %rax
^
<instantiation>:2:2: note: while in macro instantiation
 GET_PERCPU_BASE %rax
 ^
/builds/linux/arch/x86/entry/entry_64.S:887:2: note: while in macro
instantiation
 SAVE_AND_SET_GSBASE scratch_reg=%rax save_reg=%rbx
 ^
make[3]: *** [/builds/linux/scripts/Makefile.build:379:
arch/x86/entry/entry_64.o] Error 1
arch/x86/entry/entry_64_compat.o: warning: objtool: .entry.text+0x215:
can't find jump dest instruction at .entry.text+0x21a
make[3]: Target '__build' not remade because of errors.
make[2]: *** [/builds/linux/scripts/Makefile.build:540: arch/x86/entry] Error 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:1868: arch/x86] Error 2


Build config:
https://builds.tuxbuild.com/1yNlOcqNwVJJje4WbGjSV4ZeBh6/config

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
-----------
    git_describe: v5.15-rc2
    git_ref:
    git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    git_sha: e4e737bb5c170df6135a127739a9e6148ee3da82
    git_short_log: e4e737bb5c17 (\"Linux 5.15-rc2\")
    kconfig: [
        defconfig
    ],
    target_arch: x86_64
    toolchain: clang-10

steps to reproduce:
tuxmake --runtime podman --target-arch x86_64 --toolchain clang-10
--kconfig defconfig

https://builds.tuxbuild.com/1yNlOcqNwVJJje4WbGjSV4ZeBh6/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org
