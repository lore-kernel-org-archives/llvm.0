Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3212C80
	for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 06:17:56 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id i20so47119149edj.10
        for <llvm@lists.linux.dev>; Sun, 10 Oct 2021 23:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=JgZFL1gbaLa9EwP6bgcRPQEmNK/hbPIe9fBJ0qz2WNE=;
        b=Wn1NP/SCh1lD8vj0hwMTgkYtoME/EeJPlAmzpOBMrfg7wY3yiSCN0Ffgy7EGhmHRPC
         zRP7m0Y/4+Rm7SZybudj81DF38xcOAVc8Nyg3mIMTy+wAEqIGuqXG8NeBGPaZ6OLFpoU
         ln5kLnnhFqGos7H5t7+iF1Ul0zQEwfYjTOeMKPAj6lU+wf/Qp3F9r1F7eNjOZIXxaGEg
         KoZ6nAO/xYkS7A8NBVh3x52f7ZK4SkdCPQSLHl1wumnP0378CA8BmoNLmuA6iHfK3zou
         t4Z9Bry2XRLH0Uqzprc/zZppCg6s1eUAXvjWeRavbxlmoe9wLpfxiATGoBwEq2F3hobE
         FheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=JgZFL1gbaLa9EwP6bgcRPQEmNK/hbPIe9fBJ0qz2WNE=;
        b=kG7Qg6vHWK2Pi264aPdKiQ9Q/j3j2ia1d+Szv8TT90f5wY2FJI//wJ0JS2TmA3XamF
         QDN7u3CL+c80LNoJS1s67FWIxp+bwWB/B+ABdCxM3LztT3aLjz8h6C9r+d63VtniXD2o
         x68wNEX24uF1rwgL/Cv2bE44DSy1QTL0O6SSmSt/7W6/NCeVj7UrLuv1IQcMDGAHYWx9
         GFwCv4V7zpJUCtt/ywzCQDYMCPSB6oDmaiQCGWR9uuerBL4nwSzJThTvAiUepxWzfwLd
         Cwj6I4P3zCUZLggW1XqHJynW0FbHxepEvm5FRnxdvVCVYCWWWoYwNXXI+5FypAzMpnNr
         7hLQ==
X-Gm-Message-State: AOAM533jHA6AORiAjh1WjvSH1KG+Ir/t1NolyPMwNviB6npSoquRNusr
	3CQ/3/T/Zh5RL2p5vnV6QwAPRAfqaC8kV9ceULb8BtUUtDfToQ==
X-Google-Smtp-Source: ABdhPJwoQalBJZOhb3Yo1GbsmrfZ+B7X+l1AbPRIvtMqw7LXKPPxvt4v8nMcKO6w2OoJWga+avsMf5+tN/Uwwug30zQ=
X-Received: by 2002:a17:906:c302:: with SMTP id s2mr22596326ejz.499.1633933073798;
 Sun, 10 Oct 2021 23:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 11 Oct 2021 11:47:42 +0530
Message-ID: <CA+G9fYuqwJD5bFO74vG6Mvbbt1G8rxzd_NDHg-gtOZ6rPjeu3A@mail.gmail.com>
Subject: clang-13: s390/kernel/head64.S:24:17: error: invalid operand for instruction
To: llvm@lists.linux.dev, linux-s390@vger.kernel.org, 
	clang-built-linux <clang-built-linux@googlegroups.com>, 
	open list <linux-kernel@vger.kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Alexander Egorenkov <egorenar@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

[Please ignore this email if it is already reported ]

Following s390 builds failed due to warnings / errors.

metadata:
    git_describe: v5.15-rc5
    git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    git_short_log: 64570fbc14f8 (\"Linux 5.15-rc5\")
    target_arch: s390
    toolchain: clang-13


Fail (2861 errors) s390 (tinyconfig) with clang-nightly
  @ https://builds.tuxbuild.com/1zL35IUSGhDGeVuyIrAp7eyzEUi/
Fail (2861 errors) s390 (tinyconfig) with clang-13
  @ https://builds.tuxbuild.com/1zL35Hn7wjErKsLDM6zAgh27BYJ/
Fail (4112 errors) s390 (allnoconfig) with clang-13
  @ https://builds.tuxbuild.com/1zL35HR60hSFvBmAcYJvKHm8Lko/
Fail (4112 errors) s390 (allnoconfig) with clang-nightly
  @ https://builds.tuxbuild.com/1zL35DTlrX9qRGCtGqgtmmMDjnQ/
Fail (23048 errors) s390 (defconfig) with clang-13
  @ https://builds.tuxbuild.com/1zL35DE2KWQUPxbbXeTbwIJaWXS/
Fail (23045 errors) s390 (defconfig) with clang-nightly
  @ https://builds.tuxbuild.com/1zL35EgeQfWQDXDupp4itkUO5At/


Build errors log:
----------------
arch/s390/kernel/head64.S:24:17: error: invalid operand for instruction
 lctlg %c0,%c15,.Lctl-.LPG1(%r13) # load control registers
                ^
arch/s390/kernel/head64.S:40:8: error: invalid operand for instruction
 lpswe .Ldw-.(%r13) # load disabled wait psw
       ^
make[3]: *** [scripts/Makefile.build:379: arch/s390/kernel/head64.o] Error 1
In file included from kernel/sched/cputime.c:5:
In file included from kernel/sched/sched.h:5:
In file included from include/linux/sched.h:14:
In file included from include/linux/pid.h:6:
In file included from include/linux/wait.h:9:
In file included from include/linux/spinlock.h:94:
arch/s390/include/asm/spinlock.h:89:3: error: expected absolute expression
                ALTERNATIVE("", ".long 0xb2fa0070", 49) /* NIAI 7 */
                ^
arch/s390/include/asm/alternative.h:111:2: note: expanded from macro
'ALTERNATIVE'
        ALTINSTR_REPLACEMENT(altinstr, 1)                               \
        ^
arch/s390/include/asm/alternative.h:106:2: note: expanded from macro
'ALTINSTR_REPLACEMENT'
        INSTR_LEN_SANITY_CHECK(altinstr_len(num))
        ^
arch/s390/include/asm/alternative.h:62:3: note: expanded from macro
'INSTR_LEN_SANITY_CHECK'
        ".if " len " > 254\n"                                           \
         ^
<inline asm>:5:5: note: instantiated into assembly here
.if 6651b-6641b > 254
    ^
In file included from kernel/sched/cputime.c:5:
In file included from kernel/sched/sched.h:5:
In file included from include/linux/sched.h:14:
In file included from include/linux/pid.h:6:
In file included from include/linux/wait.h:9:
In file included from include/linux/spinlock.h:94:
arch/s390/include/asm/spinlock.h:89:3: error: cpu alternatives does
not support instructions blocks > 254 bytes
                ALTERNATIVE("", ".long 0xb2fa0070", 49) /* NIAI 7 */
                ^
arch/s390/include/asm/alternative.h:111:2: note: expanded from macro
'ALTERNATIVE'
        ALTINSTR_REPLACEMENT(altinstr, 1)                               \
        ^
arch/s390/include/asm/alternative.h:106:2: note: expanded from macro
'ALTINSTR_REPLACEMENT'
        INSTR_LEN_SANITY_CHECK(altinstr_len(num))
        ^
arch/s390/include/asm/alternative.h:63:3: note: expanded from macro
'INSTR_LEN_SANITY_CHECK'
        "\t.error \"cpu alternatives does not support instructions "    \
         ^
<inline asm>:6:2: note: instantiated into assembly here
        .error "cpu alternatives does not support instructions blocks
> 254 bytes"
        ^
In file included from kernel/sched/cputime.c:5:
In file included from kernel/sched/sched.h:5:
In file included from include/linux/sched.h:14:
In file included from include/linux/pid.h:6:
In file included from include/linux/wait.h:9:
In file included from include/linux/spinlock.h:94:
arch/s390/include/asm/spinlock.h:89:3: error: expected absolute expression
                ALTERNATIVE("", ".long 0xb2fa0070", 49) /* NIAI 7 */
                ^
arch/s390/include/asm/alternative.h:111:2: note: expanded from macro
'ALTERNATIVE'
        ALTINSTR_REPLACEMENT(altinstr, 1)                               \
        ^
arch/s390/include/asm/alternative.h:106:2: note: expanded from macro
'ALTINSTR_REPLACEMENT'
        INSTR_LEN_SANITY_CHECK(altinstr_len(num))
        ^
arch/s390/include/asm/alternative.h:66:3: note: expanded from macro
'INSTR_LEN_SANITY_CHECK'
        ".if (" len ") %% 2\n"                                          \
         ^
<inline asm>:8:5: note: instantiated into assembly here
.if (6651b-6641b) % 2
    ^
In file included from kernel/sched/cputime.c:5:
In file included from kernel/sched/sched.h:5:
In file included from include/linux/sched.h:14:
In file included from include/linux/pid.h:6:
In file included from include/linux/wait.h:9:
In file included from include/linux/spinlock.h:94:
arch/s390/include/asm/spinlock.h:89:3: error: cpu alternatives
instructions length is odd
                ALTERNATIVE("", ".long 0xb2fa0070", 49) /* NIAI 7 */
                ^

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.

tuxmake --runtime podman --target-arch s390 --toolchain clang-13
--kconfig defconfig

-- 
Linaro LKFT
https://lkft.linaro.org
