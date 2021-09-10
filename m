Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD333FC3
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 23:40:52 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 131-20020a251489000000b0059bdeb10a84so4575239ybu.15
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 16:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=dYKLTLpTmPN5owZVdEoA+CQx6wna9pjFHY01/pfiuQ4=;
        b=qbSqVK6szk9xdAsM43A6koMNq4VP1LjnW0p3/8Vt9yRFopGXZYEnh4nMRg/L/3wcVr
         vhf54uss1p4pRCskahb0hYnFAA884g6S2mh/+X2kWxE7qoBdKbnSrHFTPV5+rPKUHXx3
         Uywymn8mfLubGmT1bbAR0HILPB8WzNzL9PMTR1uRWFN/oJbXuqZAVkEI0jbYODZumaC+
         rP7zF26TLmTid/DG6mfWJa19+zM5RsgHwyXMfeiQSsCZXumWVFpGeO3Tdk7DCslN3Py4
         n4kXcTGIacTVlJiZCu6mzP+7UpecLXplK6MSWj1JySzZ+MI5WKuO0Nh8gJuptedkPY52
         TGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=dYKLTLpTmPN5owZVdEoA+CQx6wna9pjFHY01/pfiuQ4=;
        b=MUzBJBMKgoerodT7nS/HQBzQzzIP4RCJQnCmE+C0U3SJL4m4Yb0bntmrYajdYg9MoR
         lE8SHxRJ2bFegEiZh2wrE5vSUXwWSm1ByAfaEe+6MWRvUDzDJqT6gts4O6PuNRla68Ma
         U8snxvJgqLNAN4nQWO0zso9OzIGekoJ60M9l6+YBUR63OQFUWGFzBvVC5o3W/fn2KbPQ
         uo+tD0r0YsVXRRWFLgWa4u/HbRPDa712OjvSzj0+iFh3qSCg0hYvW+59BCCRvD9NU3O8
         k2jGoYwHz8tQ2m325hGNxDe5m6z2BfvP2Nty1kB1osWLWBfmox8Jo41QUyg7oHNoUaDm
         44wA==
X-Gm-Message-State: AOAM533vY/YKSYCvoZjet6+UPFfpMwaNwnf5b2cxSZvoTBBzIbjrgojB
	rZdJO2qknb3VeNnJGYdgYNZn9igGgbnVj9+HCAA=
X-Google-Smtp-Source: ABdhPJyUCPirWrWj7upjL/zaVjTC/3QtOA7QWlPN2tum9NX/Ts98LvdkJJzWo4804NqGsqkXClfYxb0whU0Qm7r6prg=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2b76:71d3:b5fb:3734])
 (user=ndesaulniers job=sendgmr) by 2002:a25:a527:: with SMTP id
 h36mr404031ybi.104.1631317251104; Fri, 10 Sep 2021 16:40:51 -0700 (PDT)
Date: Fri, 10 Sep 2021 16:40:37 -0700
Message-Id: <20210910234047.1019925-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 00/10] raise minimum GCC version to 5.1
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

commit fad7cd3310db ("nbd: add the check to prevent overflow in
__nbd_ioctl()")

raised an issue from the fallback helpers added in

commit f0907827a8a9 ("compiler.h: enable builtin overflow checkers and add fallback code")

Specifically, the helpers for checking whether the results of a
multiplication overflowed (__unsigned_mul_overflow,
__signed_add_overflow) use the division operator when
!COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW. This is problematic for 64b
operands on 32b hosts.

Also, because the macro is type agnostic, it is very difficult to write
a similarly type generic macro that dispatches to one of:
* div64_s64
* div64_u64
* div_s64
* div_u64

Raising the minimum supported versions allows us to remove all of the
fallback helpers for !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW, instead
dispatching the compiler builtins.

arm64 has already raised the minimum supported GCC version to 5.1, do
this for all targets now. See the link below for the previous
discussion.

Additional patches cleaning up a few obsolete version checks.

Link: https://lore.kernel.org/all/20210909182525.372ee687@canb.auug.org.au/
Link: https://lore.kernel.org/lkml/CAK7LNASs6dvU6D3jL2GG3jW58fXfaj6VNOe55NJnTB8UPuk2pA@mail.gmail.com/
Link: https://github.com/ClangBuiltLinux/linux/issues/1438

Nick Desaulniers (10):
  Documentation: raise minimum supported version of GCC to 5.1
  compiler.h: drop fallback overflow checkers
  mm/ksm: remove old GCC 4.9+ check
  Kconfig.debug: drop GCC 5+ version check for DWARF5
  riscv: remove Kconfig check for GCC version for ARCH_RV64I
  powerpc: remove GCC version check for UPD_CONSTR
  arm64: remove GCC version check for ARCH_SUPPORTS_INT128
  Makefile: drop GCC < 5 -fno-var-tracking-assignments workaround
  compiler-gcc.h: drop checks for older GCC versions
  vmlinux.lds.h: remove old check for GCC 4.9

 Documentation/process/changes.rst    |   2 +-
 Makefile                             |   6 --
 arch/arm64/Kconfig                   |   2 +-
 arch/powerpc/include/asm/asm-const.h |  10 --
 arch/riscv/Kconfig                   |   2 +-
 include/asm-generic/vmlinux.lds.h    |   4 -
 include/linux/compiler-clang.h       |  13 ---
 include/linux/compiler-gcc.h         |   8 +-
 include/linux/overflow.h             | 138 +-------------------------
 lib/Kconfig.debug                    |   2 +-
 mm/ksm.c                             |   2 -
 scripts/min-tool-version.sh          |   8 +-
 tools/include/linux/compiler-gcc.h   |   8 +-
 tools/include/linux/overflow.h       | 140 +--------------------------
 14 files changed, 13 insertions(+), 332 deletions(-)


base-commit: 2d338201d5311bcd79d42f66df4cecbcbc5f4f2c
-- 
2.33.0.309.g3052b89438-goog

